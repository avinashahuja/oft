#!/bin/sh

#Experiment for following comparisions
# 1) Single GPU with DLProf and AMP enabled one epoch only - master branch
# 2) Single GPU with DLProf and No AMP - master branch
# 3) Same as 1 w/ gridsamplefp16 branch
# 4) Same as 2 w/ gridsamplefp16 branch

# Cleanup
rm -rf nsys*

# Run training - Constants
EXPT_TIME=$(date +"%y%m%d-%s-")
EXPT_BATCH_SIZE=16
EXPT_NUM_DATA_LOADERS=8


# Expt 1
git checkout master
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-wAMP-master"
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --dlprof True --amp True;
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;

#Expt 2
git checkout master
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-master"
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --dlprof True;
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;

#Expt 3
git checkout gridsamplefp16
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-wAMP-gsfp16"
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --dlprof True --amp True;
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;

#Expt 4
git checkout gridsamplefp16
EXPERIMENT_NAME=$EXPT_TIME"train-benchmark-1gpu-wDLProf-gsfp16"
dlprof --mode=pytorch python train.py $EXPERIMENT_NAME --gpu 0 -b $EXPT_BATCH_SIZE -w $EXPT_NUM_DATA_LOADERS --dlprof True;
mv nsys* experiments/$EXPERIMENT_NAME;
mv event_files/tfdlprof.* experiments/$EXPERIMENT_NAME;