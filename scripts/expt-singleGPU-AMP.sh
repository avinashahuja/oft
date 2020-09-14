#!/bin/sh

#Experiment for Single GPU baseline 1 epoch wAMP

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wAMP"
EXPT_BATCH_SIZE=16
EXPT_NUM_DATA_LOADERS=8
EXPT_NUM_EPOCHS=1
python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS -e $EXPT_NUM_EPOCHS --amp True;