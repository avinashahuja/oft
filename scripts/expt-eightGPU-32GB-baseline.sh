#!/bin/sh
# Expt 2 with 32G GPU memory instead of baseline 16 GB. Batch sized and workers doubled with AMP

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-8gpu-32g-wAMP"
EXPT_BATCH_SIZE=80
EXPT_NUM_DATA_LOADERS=32
tensorboard --logdir experiments/$EXPERIMENT_NAME &
python train.py $EXPERIMENT_NAME --gpu 0 1 2 3 4 5 6 7 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --amp True;
