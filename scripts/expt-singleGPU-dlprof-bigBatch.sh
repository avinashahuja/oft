#!/bin/sh

#Experiment for Single GPU with DLProf enabled one epoch only. 
# Large batch size and 8 workers to show GPU utilization.

# Cleanup
rm -rf nsys*

# Run training
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-bigBatch"
EXPT_BATCH_SIZE=20
EXPT_NUM_DATA_LOADERS=8
EXPT_NUM_EPOCHS=1
EXPT_LEARNING_RATE=1e-8
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --dlprof True;

# Move DLProf files
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;
mv event_files/dbdlprof* experiments/$EXPERIMENT_NAME;
#tensorboard --logdir experiments/$EXPERIMENT_NAME &

