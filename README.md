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

* You can download the paper from [HERE](https://www.researchgate.net/publication/321180616_Wing_Loss_for_Robust_Facial_Landmark_Localisation_with_Convolutional_Neural_Networks).

## News
* 2018-06-16: Add the demo code as well as two pretrained CNN6 models on the AFLW dataset with 19 facial landmarks
* 2018-03-29: The pre-trained model and test code are coming soon.

## New Results on the [COFW](http://www.vision.caltech.edu/xpburgos/ICCV13/) and [WFLW](https://wywu.github.io/projects/LAB/WFLW.html) datasets

* Results on COFW

| Method              | NME(%) | Failure Rate(%) |
|---------------------|--------|-----------------|
| CNN6 (Wing+PDB)     | 5.44   | 3.75            |
| ResNet50 (Wing+PDB) | 5.07   | 3.16            |

* Results on WFLW

| Metric           | Method              | **FullSet** | Pose   | Expression | Illumination | Makeup | Occlusion | Blur   |
|------------------|---------------------|---------|--------|------------|--------------|--------|-----------|--------|
| NME(%)           | ESR                 | 11.13   | 25.88  | 11.47      | 10.49        | 11.05  | 13.75     | 12.20  |
|                  | SDM                 | 10.29   | 24.10  | 11.45      | 9.32         | 9.38   | 13.03     | 11.28  |
|                  | CFSS                | 9.07    | 21.36  | 10.09      | 8.30         | 8.74   | 11.76     | 9.96   |
|                  | DVLN                | 6.08    | 11.54  | 6.78       | 5.73         | 5.98   | 7.33      | 6.88   |
|                  | LAB                 | 5.27    | 10.24  | 5.51       | 5.23         | **5.15**| 6.79      | 6.32   |
|              | **ResNet50 (Wing+PDB)** | **4.99**|**8.43**|**5.21**    | **4.88**     | 5.26   | **6.21**  | **5.81**|
| Failure Rate (%) | ESR                 | 35.24   | 90.18  | 42.04      | 30.80        | 38.84  | 47.28     | 41.40  |
|                  | SDM                 | 29.40   | 84.36  | 33.44      | 26.22        | 27.67  | 41.85     | 35.32  |
|                  | CFSS                | 20.56   | 66.26  | 23.25      | 17.34        | 21.84  | 32.88     | 23.67  |
|                  | DVLN                | 10.84   | 46.93  | 11.15      | 7.31         | 11.65  | 16.30     | 13.71  |
|                  | LAB                 | 7.56    | 28.83  | 6.37       | 6.73         | **7.77**| 13.72     | 10.74  |
|              | **ResNet50 (Wing+PDB)** | **5.64**|**23.31**| **4.14**  |**4.87**      |8.74    | **11.69** | **7.50**|
| AUC@0.1          | ESR                 | 0.2774  | 0.0177 | 0.1981     | 0.2953       | 0.2485 | 0.1946    | 0.2204 |
|                  | SDM                 | 0.3002  | 0.0226 | 0.2293     | 0.3237       | 0.3125 | 0.2060    | 0.2398 |
|                  | CFSS                | 0.3659  | 0.0632 | 0.3157     | 0.3854       | 0.3691 | 0.2688    | 0.3037 |
|                  | DVLN                | 0.4551  | 0.1474 | 0.3889     | 0.4743       | 0.4494 | 0.3794    | 0.3973 |
|                  | LAB                 | 0.5323  | 0.2345 | 0.4951     | 0.5433       | 0.5394 | 0.4490    | 0.4630 |
|             | **ResNet50 (Wing+PDB)**  | **0.5585**|**0.3309**| **0.4979**| **0.5631**|**0.5460**| **0.4985**| **0.5010**|

## Pre-trained models

### Uploaded

* cnn6_v0_aflw: pre-trained CNN-6 model on the AFLW-FULL dataset, using the CNN6 architecture as shown in the paper
* cnn6_v1_aflw: similar to cnn6_v0 but with doubled filter sizes, which performs better than the original CNN6 but a little bit slower

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
