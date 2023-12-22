import pandas as pd
import numpy as np
import tensorflow as tf
from flask import Flask, request
from werkzeug.utils import secure_filename
from capture_signs import create_frame_landmark_df 
from capture_signs import do_capture_loop
from capture_signs import create_output_parquet
import os

ROWS_PER_FRAME = 543

def load_relevant_data_subset(pq_path):
    data_columns = ['x', 'y', 'z']
    data = pd.read_parquet(pq_path, columns=data_columns)
    n_frames = int(len(data) / ROWS_PER_FRAME)
    data = data.values.reshape(n_frames, ROWS_PER_FRAME, len(data_columns))
    return data.astype(np.float32)

app = Flask(__name__)

UPLOAD_FOLDER = 'AI_recognization/data'  # Thay đường dẫn tương ứng
ALLOWED_EXTENSIONS = {'mp4'}

app.config['UPLOAD_FOLDER'] = UPLOAD_FOLDER

def allowed_file(filename):
    return '.' in filename and filename.rsplit('.', 1)[1].lower() in ALLOWED_EXTENSIONS

@app.route('/', methods=['POST'])
def upload_video():
    if 'video' not in request.files:
        return {'message': 'No file part'}, 400

    video = request.files['video']

    if video.filename == '':
        return {'message': 'No selected file'}, 400

    if video and allowed_file(video.filename):
        filename = secure_filename(video.filename)
        video.save(os.path.join(app.config['UPLOAD_FOLDER'], filename))
        create_output_parquet()
        interpreter = tf.lite.Interpreter(model_path="AI_recognization/data/model.tflite")
        found_signatures = list(interpreter.get_signature_list().keys())
        prediction_fn = interpreter.get_signature_runner("serving_default")

        train = pd.read_csv('AI_recognization/data/train.csv')
        train['sign_ord'] = train['sign'].astype('category').cat.codes

        SIGN2ORD = train[['sign', 'sign_ord']].set_index('sign').squeeze().to_dict()
        ORD2SIGN = train[['sign_ord', 'sign']].set_index('sign_ord').squeeze().to_dict()

        pq_file = "AI_recognization/data/output.parquet"
        xyz_np = load_relevant_data_subset(pq_file)

        prediction = prediction_fn(inputs=xyz_np)
        sign = prediction['outputs'].argmax()
        
        # return {'message': ORD2SIGN[sign]}, 200
        return {'message': 'dmmmmm'}, 200
    else:
        return {'message': 'Invalid file type'}, 400

if __name__ == '__main__':
    app.run(debug=True)