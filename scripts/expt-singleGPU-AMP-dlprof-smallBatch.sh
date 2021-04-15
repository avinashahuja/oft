#!/bin/sh

# Experiment for Single GPU with DLProf and AMP enabled one epoch only
# Note: The batch size for this experiment was optimized for a GPU with 48 GB memory. 
# If you are having memory issues, try reducing the batch size.

# Cleanup
rm -rf nsys*

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-wAMP"
EXPT_BATCH_SIZE=4
EXPT_NUM_DATA_LOADERS=1
EXPT_NUM_EPOCHS=1
EXPT_LEARNING_RATE=1e-8
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS  --lr $EXPT_LEARNING_RATE --dlprof True --amp True;

# Move DLProf files
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;
mv event_files/dbdlprof* experiments/$EXPERIMENT_NAME;
#tensorboard --logdir experiments/$EXPERIMENT_NAME &
