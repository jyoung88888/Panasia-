# 파나시아 YOLOv11 객체 탐지 프로젝트

이 프로젝트는 YOLOv11을 사용한 3개의 산업용 객체 탐지 모델을 포함합니다. 각 모델은 특정 작업 현장의 안전 및 품질 관리를 위해 훈련되었습니다.


## 모델 소개

### Model1: 안전모 관리 모델

**목적**: 작업 현장에서 안전모 착용 여부 및 올바른 착용 상태 감지

**특징**:
- 객체 탐지 기반의 안전모 인식
- 복수 클래스 분류 (안전모 착용/미착용)
- 실시간 모니터링 가능

**학습 구성**:
- 모델: YOLOv11n (nano)
- 에포크: 500
- 배치 크기: 16
- 조기 종료 patience: 30

**성능 지표**:
- 혼동 행렬 (Confusion Matrix)
- F1 곡선 (F1-Confidence curve)
- Precision/Recall 곡선
- 클래스 분포 (labels.jpg)

**사용 데이터셋**:
- `model1.yaml`: 기본 학습 데이터셋
- `test1.yaml`, `test2.yaml`: 테스트 데이터셋

---

### Model3: 스크라바원자재 모델

**목적**: 스크라바(Scrapper Bar) 및 원자재 상태 감지

**특징**:
- 원자재 품질 검사
- 손상된 부품 자동 감지
- 공정 품질 관리

**학습 구성**:
- 모델: YOLOv11n (nano)
- 에포크: 500
- 배치 크기: 16
- 조기 종료 patience: 30

**성능 지표**:
- 혼동 행렬 (Confusion Matrix)
- F1 곡선
- Precision/Recall 곡선

**사용 데이터셋**:
- `model3.yaml`: 학습 데이터셋 설정

---

### Model5: 조립공정률 모델

**목적**: 조립 공정의 진행률 및 완성도 측정

**특징**:
- 조립 단계별 상태 감지
- 공정 진행률 자동 계산
- 결함 부품 자동 탐지

**학습 구성**:
- 모델: YOLOv11n (nano)
- 에포크: 500
- 배치 크기: 16
- 조기 종료 patience: 30

**성능 지표**:
- 혼동 행렬 (Confusion Matrix)
- F1 곡선
- Precision/Recall 곡선


**사용 데이터셋**:
- `model5.yaml`: 학습 데이터셋 설정

---

## 학습 방법

각 모델별 학습 스크립트가 제공됩니다:

```bash
# Model1 학습
bash train1.sh

# Model2 학습
bash train2.sh

# Model3 학습
bash train3.sh

# Model5 학습
bash train5.sh
```

### 범용 학습 스크립트

모든 모델에 적용 가능한 범용 스크립트:

```bash
bash data/train_yolov11.sh
```

---

## 추론 (Inference)

### Python 스크립트를 사용한 추론

```bash
python src/inference.py
```

**추론 파라미터**:
- `conf`: 신뢰도 임계값 (0.7)
- `iou`: IoU 임계값 (0.5)
- `save_txt`: 예측 결과를 텍스트 파일로 저장
- `save_conf`: 신뢰도 점수 포함

---

## 데이터 전처리 및 증강

### EDA 및 전처리
```bash
jupyter notebook src/eda_preprocessing.ipynb
```

**포함 내용**:
- 데이터셋 분석
- 이미지 통계
- 라벨 분포 확인
- 전처리 프로세스

### 데이터 증강
```bash
jupyter notebook src/Augmentation.ipynb
```

**증강 기법**:
- 랜덤 회전 (Random Rotation)
- 밝기 조정 (Brightness Adjustment)
- 좌우 반전 (Flip)
- 크롭 및 리사이징 (Crop & Resize)
- 노이즈 추가 (Noise)

---

## 성능 지표 해석

### 혼동 행렬 (Confusion Matrix)
- 모든 클래스에 대한 예측 정확도 시각화
- 오분류 패턴 파악

### F1 곡선 (F1-Confidence Curve)
- 신뢰도에 따른 F1 스코어 변화
- 최적 신뢰도 임계값 결정에 사용

### Precision/Recall 곡선 (PR Curve)
- 클래스별 정밀도와 재현율의 관계
- 모델 성능의 전반적 평가

### 결과 그래프 (results.png)
- 학습 과정에서의 손실값 변화
- 에포크별 성능 지표 추이

---

## 요구 사항

```
ultralytics>=8.0.0
opencv-python>=4.8.0
numpy>=1.24.0
torch>=2.0.0
torchvision>=0.15.0
pyyaml>=6.0
```

### 설치

```bash
pip install ultralytics opencv-python numpy torch torchvision pyyaml
```

---

## 디렉토리별 설명

| 디렉토리 | 설명 |
|---------|------|
| `data/` | 각 모델의 데이터셋 구성 파일 (.yaml) 저장 |
| `result/` | 학습 완료 후 생성된 성능 평가 그래프 및 메트릭 |
| `src/` | 데이터 전처리, 증강, 추론 관련 코드 |

---

## 학습 재실행 가이드

특정 모델의 학습을 다시 실행하려면:

1. **데이터 준비**
   - 해당 모델의 yaml 파일 확인
   - 데이터셋 경로 업데이트

2. **스크립트 실행**
   ```bash
   bash train<model_number>.sh
   ```

3. **결과 확인**
   - `result/<model_number>/` 디렉토리에 새로운 결과 생성
   - 성능 지표 이미지 확인

---

## 주의사항

- 각 yaml 파일의 데이터 경로가 실제 데이터 위치와 일치하는지 확인하세요
- GPU 메모리에 따라 배치 크기 조정 필요할 수 있습니다

---

## 라이선스

이 프로젝트는 내부 사용 목적으로 개발되었습니다.

# Panasia-
