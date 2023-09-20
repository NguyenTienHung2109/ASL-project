import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import tensorflow as tf
ROWS_PER_FRAME = 543

def load_relevant_data_subset(pq_path):
    data_columns = ['x', 'y', 'z']
    data = pd.read_parquet(pq_path, columns=data_columns)
    n_frames = int(len(data) / ROWS_PER_FRAME)
    data = data.values.reshape(n_frames, ROWS_PER_FRAME, len(data_columns))
    return data.astype(np.float32)

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

print(ORD2SIGN[sign])