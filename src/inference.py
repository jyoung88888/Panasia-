from ultralytics import YOLO
import os
model = YOLO("F:/2.프로젝트/파나시아/2025/model1/model/model1_0525.pt")  # load a pretrained model (recommended for training)

if __name__ == '__main__':
    # Load a model
    image_path = './dataset/test2/images/'

    for i in os.listdir(image_path):
        image_file = image_path + i
        
        if '.jpg' in image_file:
            print('image_file: ', image_file)            
   
        # Predict
        
        results = model.predict(image_file,
                                save_conf=True,
                                save_txt = True, 
                                #save=True,
                                iou=0.5, 
                                conf = 0.7, project='./runs/test2_predict/model1_0525/',exist_ok=True)  