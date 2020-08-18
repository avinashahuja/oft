# Orthographic Feature Transform for Monocular 3D Object Detection

![OFTNet-Architecture](https://github.com/tom-roddick/oft/raw/master/architecture.png "OFTNet-Architecture")
This is a PyTorch implementation of the OFTNet network from the paper [Orthographic Feature Transform for Monocular 3D Object Detection](https://arxiv.org/abs/1811.08188). The code currently supports training the network from scratch on the KITTI dataset - intermediate results can be visualised using Tensorboard. The current version of the code is intended primarily as a reference, and for now does not support decoding the network outputs into bounding boxes via non-maximum suppression. This will be added in a future update. Note also that there are some slight implementation differences from the original code used in the paper.

## Setup
This repository is updated to run on the [pytorch container on NGC](https://ngc.nvidia.com/catalog/containers/nvidia:pytorch)  
Install the dependencies by running the `setup.sh`
```
sh setup.sh
```
If you have the data in the `data/kitti/objects` folder you can skip the next step otherwise you can run `download_data.sh` to download and unzip the data.
Finally, you can run training by following the steps below or by running the `train.sh` file. This assumes that the script is being run on an 8 GPU single node system.
The batch size and number of data loader workers have been updated to enable optimal data loading into the GPU. 

## Training
The training script can be run by calling `train.py` with the name of the experiment as a required position argument. 
```
python train.py name-of-experiment --gpu 0
```
By default data will be read from `data/kitti/objects` and model checkpoints will be saved to `experiments`. The model is trained using the KITTI 3D object detection benchmark which can be downloaded from [here](http://www.cvlibs.net/datasets/kitti/eval_object.php?obj_benchmark=3d). See `train.py` for a full list of training options.

## Inference
To decode the network predictions and visualise the resulting bounding boxes, run the `infer.py` script with the path to the model checkpoint you wish to visualise:
```
python infer.py /path/to/checkpoint.pth.gz --gpu 0
```

## Citation
If you find this work useful please cite the paper using the citation below.
```
@article{roddick2018orthographic,  
  title={Orthographic feature transform for monocular 3d object detection},  
  author={Roddick, Thomas and Kendall, Alex and Cipolla, Roberto},  
  journal={British Machine Vision Conference},  
  year={2019}  
}
```
