#!/bin/bash

# YOLOv11 Training Script
# This script trains a YOLOv11 model with specified configurations

# Configuration variables
MODEL_NAME="yolov11n"  # Model size: yolov11n, yolov11s, yolov11m, yolov11l, yolov11x
DATA_YAML="./data.yaml"  # Path to your dataset YAML file
EPOCHS=100  # Number of training epochs
BATCH_SIZE=8  # Batch size (adjust based on GPU memory)
IMG_SIZE=640  # Input image size
DEVICE="0"  # GPU device ID (0 for first GPU, or "cpu" for CPU training)
PROJECT_DIR="./runs/detect"  # Output directory for training results
EXP_NAME="yolov11_train"  # Experiment name

# Optional advanced parameters
PATIENCE=20  # Early stopping patience
LR0=0.01  # Initial learning rate
MOMENTUM=0.937  # SGD momentum
WEIGHT_DECAY=0.0005  # Weight decay
WORKERS=8  # Number of data loading workers
SEED=42  # Random seed for reproducibility

# Create directories if they don't exist
mkdir -p "${PROJECT_DIR}"

# Print training information
echo "=========================================="
echo "YOLOv11 Training Configuration"
echo "=========================================="
echo "Model: ${MODEL_NAME}"
echo "Dataset: ${DATA_YAML}"
echo "Epochs: ${EPOCHS}"
echo "Batch Size: ${BATCH_SIZE}"
echo "Image Size: ${IMG_SIZE}"
echo "Device: ${DEVICE}"
echo "Learning Rate: ${LR0}"
echo "=========================================="

# Run YOLOv11 training
python -m ultralytics.yolo detect train \
    model="${MODEL_NAME}.pt" \
    data="${DATA_YAML}" \
    epochs="${EPOCHS}" \
    batch="${BATCH_SIZE}" \
    imgsz="${IMG_SIZE}" \
    device="${DEVICE}" \
    project="${PROJECT_DIR}" \
    name="${EXP_NAME}" \
    patience="${PATIENCE}" \
    lr0="${LR0}" \
    momentum="${MOMENTUM}" \
    weight_decay="${WEIGHT_DECAY}" \
    workers="${WORKERS}" \
    seed="${SEED}" \
    save=true \
    cache=ram \
    half=true \
    exist_ok=false

echo "=========================================="
echo "Training completed!"
echo "Results saved to: ${PROJECT_DIR}/${EXP_NAME}"
echo "=========================================="
