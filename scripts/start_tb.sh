#!/bin/sh
tensorboard --logdir 200909-1599637451-train-benchmark-1gpu-wDLProf/ &\
tensorboard --logdir 200909-1599664799-train-benchmark-1gpu-wDLProf-wAMP/ & \
tensorboard --logdir train-benchmark-1gpu-AMP-wDLProf-1epoch/ & \
tensorboard --logdir train-benchmark-1gpu-wDLProf-1epoch/