#!/bin/sh
# Experiment 1 with AMP for 16GB V100

# Cleanup
rm -rf nsys*

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPET_TIME"train-benchmark-8gpu-wAMP"
EXPT_BATCH_SIZE=40
EXPT_NUM_DATA_LOADERS=16
tensorboard --logdir experiments/$EXPERIMENT_NAME &
python train.py $EXPERIMENT_NAME --gpu 0 1 2 3 4 5 6 7 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --amp True;
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;