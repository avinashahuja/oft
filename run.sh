#!/bin/sh

#Install requirements
pip install -r requirements.txt

# Run training
EXPERIMENT_NAME="train-benchmark-8gpu"
python train.py $EXPERIMENT_NAME --gpu 0 > $EXPERIMENT_NAME.out &
tensorboard --logdir experiments/$EXPERIMENT_NAME