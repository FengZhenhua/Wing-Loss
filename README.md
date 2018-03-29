# CNN-based facial landmark localisation using Wing Loss

This software is developed by [Zhenhua Feng](https://sites.google.com/view/fengzhenhua) from the Centre for Vision, Speech and Signal Processing ([CVSSP](https://www.surrey.ac.uk/centre-vision-speech-signal-processing)), University of Surrey. The software is implemented by Matlab and powered by the [MatConvNet](http://www.vlfeat.org/matconvnet/) toolbox.

<> <div align="center">
<>  <img src="results/examples.jpg" width="600px" />
<> <p>Landmark localisation examples (AFLW) output by DAC-CSR.</p>
<> </div>

If you use this software, please cite the following publication:

* Zhen-Hua Feng, Josef Kittler, William Christmas, Patrik Huber and Xiao-Jun Wu. Dynamic Attention-controlled Cascaded Shape Regression Exploiting Training Data Augmentation and Fuzzy-set Sample Weighting, IEEE Conference on Computer Vision and Patten Recognition (CVPR), Honolulu, Hawaii, 2017.
```sh
@inproceedings{feng2017dynamic,
  title={Dynamic attention-controlled cascaded shape regression exploiting training data augmentation and fuzzy-set sample weighting},
  author={Feng, Zhen-Hua and Kittler, Josef and Christmas, William and Huber, Patrik and Wu, Xiao-Jun},
  booktitle={Computer Vision and Pattern Recognition (CVPR), 2017 IEEE Conference on},
  pages={3681--3690},
  year={2017},
  organization={IEEE}
}
```

* You can download the paper from my [ResearchGate](https://www.researchgate.net/publication/310440905_Dynamic_Attention-controlled_Cascaded_Shape_Regression_Exploiting_Training_Data_Augmentation_and_Fuzzy-set_Sample_Weighting).

## News
* 2018-03-13: Add Test code for AFLW as well as a pre-trained DAC-CSR model. The training code is coming soon.
* 2017-05-07: Add results/*.fig files for the results on the AFLW and COFW datasets. You can open them using Matlab and add your results for comparison.

## License

DAC-CSR is released under the [Apache 2.0 license](https://github.com/FengZhenhua/DAC-CSR/blob/master/license).

## Installation

### Download the code and dataset
1. Clone the repository to `/pathtomaindir/` using `git clone git@github.com:FengZhenhua/DAC-CSR.git`.
2. Download the AFLW dataset from `https://www.tugraz.at/institute/icg/research/team-bischof/lrs/downloads/aflw/` and unpack it to `/pathtomaindir/aflw/data`.
3. Download the AFLW-FULL protocol data from `http://mmlab.ie.cuhk.edu.hk/projects/compositional/AFLWinfo_release.mat` and put the file under `/pathtomaindir/aflw/`.
4. Download the latest VLFeat binary distribution from `http://www.vlfeat.org/install-matlab.html` and unpack it to `/pathtomaindir/vlfeat/`.

### Run test on AFLW using the pre-trained model 
5. Run the `runTestAFLW.m` script for the test on AFLW using the AFLW-Full protocol.

### The training code is coming soon...

## Contact

Dr Zhenhua Feng

Centre for Vision, Speech and Signal Processing

University of Surrey, Guildford GU2 7XH, United Kingdom

z.feng@surrey.ac.uk, fengzhenhua2010@gmail.com
