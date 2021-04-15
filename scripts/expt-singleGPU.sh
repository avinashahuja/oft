#!/bin/sh

#Experiment for Single GPU baseline 1 epoch (without AMP)
# Note: The batch size for this experiment was optimized for a GPU with 48 GB memory. 
# If you are having memory issues, try reducing the batch size.

# Cleanup
# Nothing to do here

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu"
EXPT_BATCH_SIZE=16
EXPT_NUM_DATA_LOADERS=8
EXPT_NUM_EPOCHS=1
#EXPT_LEARNING_RATE=1e-8
python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS -e $EXPT_NUM_EPOCHS;

# Move DLProf files
# Nothing to do here

# Start Tensorboard
# Nothing to do here