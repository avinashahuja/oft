#!/bin/sh

# Download data
mkdir -p data/kitti/object
cd data/kitti/object
wget https://s3.eu-central-1.amazonaws.com/avg-kitti/data_object_image_2.zip
wget https://s3.eu-central-1.amazonaws.com/avg-kitti/data_object_label_2.zip
wget https://s3.eu-central-1.amazonaws.com/avg-kitti/data_object_calib.zip

#Unzip data
unzip data_object_image_2.zip
unzip data_object_label_2.zip
unzip data_object_calib.zip