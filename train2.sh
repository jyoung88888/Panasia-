#!/bin/bash

# YOLO11 Training Script
# 기본 학습 명령어를 실행하는 스크립트

# 학습 파라미터
DATA="model2.yaml"
MODEL="yolo11n.pt"
EPOCHS=500
BATCH=16
PATIENCE=30

# 추가 옵션 (필요시 수정)
DEVICE="0"  # GPU 디바이스 ID
IMG_SIZE=1280
PROJECT="runs/detect"
NAME="exp"

echo "=========================================="
echo "YOLO11n Detection Training"
echo "=========================================="
echo "Dataset: ${DATA}"
echo "Model: ${MODEL}"
echo "Epochs: ${EPOCHS}"
echo "Batch Size: ${BATCH}"
echo "Patience: ${PATIENCE}"
echo "=========================================="

# YOLO11 학습 실행
yolo detect train \
    data="${DATA}" \
    model="${MODEL}" \
    epochs=${EPOCHS} \
    batch=${BATCH} \
    patience=${PATIENCE} \
    device=${DEVICE} \
    imgsz=${IMG_SIZE} \
    project="${PROJECT}" \
    name="${NAME}"

echo "=========================================="
echo "Training completed!"
echo "=========================================="
