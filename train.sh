#!/bin/sh

# Run training
EXPERIMENT_NAME="train-benchmark-8gpu"
EXPT_BATCH_SIZE=50
EXPT_NUM_DATA_LOADERS=32
python train.py $EXPERIMENT_NAME --gpu 0 1 2 3 4 5 6 7 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS > $EXPERIMENT_NAME.out &
tensorboard --logdir experiments/$EXPERIMENT_NAME