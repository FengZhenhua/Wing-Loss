# CNN-based facial landmark localisation using Wing Loss

This software is developed by [Zhenhua Feng](https://sites.google.com/view/fengzhenhua) from the Centre for Vision, Speech and Signal Processing ([CVSSP](https://www.surrey.ac.uk/centre-vision-speech-signal-processing)), University of Surrey. The software is implemented by Matlab and powered by the [MatConvNet](http://www.vlfeat.org/matconvnet/) toolbox.

If you use this software, please cite the following publication:

* Zhen-Hua Feng, Josef Kittler, Muhammad Awais, Patrik Huber, Xiao-Jun Wu. Wing Loss for Robust Facial Landmark Localisation with Convolutional Neural Networks, IEEE Conference on Computer Vision and Patten Recognition (CVPR), Salt Lake City, USA, 2018.
```sh
@inproceedings{feng2018wing,
  title={Wing Loss for Robust Facial Landmark Localisation with Convolutional Neural Networks},
  author={Feng, Zhen-Hua and Kittler, Josef and Awais, Muhammad and Huber, Patrik and Wu, Xiao-Jun},
  booktitle={Computer Vision and Pattern Recognition (CVPR), 2018 IEEE Conference on},
  year={2018},
  pages ={2235-2245},
  organization={IEEE}
}
```

* You can download the paper from my [ResearchGate](https://www.researchgate.net/publication/321180616_Wing_Loss_for_Robust_Facial_Landmark_Localisation_with_Convolutional_Neural_Networks).

## News
* 2018-06-16: Add the demo code as well as two pretrained CNN6 models on the AFLW dataset with 19 facial landmarks
* 2018-03-29: The pre-trained model and test code are coming soon.

## Pre-trained models

### Uploaded

* cnn6_v0_aflw: pre-trained CNN-6 model on the AFLW-FULL dataset, using the CNN6 architecture as shown in the paper
* cnn6_v1_aflw: similar to cnn6_v0 but with doubled filter sizes, which performs better than the original CNN6 but a little bit slower

### To be uploaded

* cnn6_v0_300w
* cnn6_v1_300w
* resnet50_pre_aflw
* resnet50_scratch_aflw
* resnet50_scratch_300w

## Installation
1. Download and install [MatConvNet](http://www.vlfeat.org/matconvnet/) to `pathToMatConvNet/`.
2. Modify the path to MatConvNet in demo.m and run the script

## License

This soft ware is released under the Apache 2.0 license.


## Contact

Dr Zhenhua Feng

Centre for Vision, Speech and Signal Processing

University of Surrey, Guildford GU2 7XH, United Kingdom

z.feng@surrey.ac.uk, fengzhenhua2010@gmail.com
