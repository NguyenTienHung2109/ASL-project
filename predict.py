import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import tflite_runtime.interpreter as tflite
ROWS_PER_FRAME = 543

def load_relevant_data_subset(pq_path):
    data_columns = ['x', 'y', 'z']
    data = pd.read_parquet(pq_path, columns=data_columns)
    n_frames = int(len(data) / ROWS_PER_FRAME)
    data = data.values.reshape(n_frames, ROWS_PER_FRAME, len(data_columns))
    return data.astype(np.float32)

interpreter = tflite.Interpreter(model_path="model.tflite")
found_signatures = list(interpreter.get_signature_list().keys())
prediction_fn = interpreter.get_signature_runner("serving_default")

pq_file = "output.parquet"
xyz_np = load_relevant_data_subset(pq_file)

prediction = prediction_fn(inputs=xyz_np)
sign = prediction['outputs'].argmax()

print(sign)
