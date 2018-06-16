close all
clear
clc

% add MatConNet toolbox
run /vol/vssp/FaceAnnotation2D/toolbox/MatConvNet/2017a/1.0-beta25/matlab/vl_setupnn.m;

% set gpuOn to your GPU index, set the value to 0 for CPU mode
gpuOn = 1;

% load a pre-trained CNN model
load('./model/cnn6_v1_aflw.mat');
net = dagnn.DagNN.loadobj(net);
if gpuOn
    gpuDevice(gpuOn);
    net.move('gpu');
end

imglist = dir('./imgs/*.jpg');
inImgSize = net.meta.inputSize(1);

% apply the model to cropped face images for facial landmark localisation
for i = 1:length(imglist)
    img = imread(['./imgs/' imglist(i).name]);
    
    tmpImg = imresize(img, [inImgSize, inImgSize]);
    tmpImg = im2single(tmpImg);
    if gpuOn
        tmpImg = gpuArray(tmpImg);
    end
    
    net.eval({'input', tmpImg});
    if gpuOn
        lmks = squeeze(gather(net.vars(end).value)) / inImgSize * size(img,1);
    else
        lmks = squeeze(net.vars(end).value) / inImgSize * size(img,1);
    end
    
    imshow(img);
    hold on;
    plot(lmks(1:end/2), lmks(end/2+1:end), 'ko', 'MarkerFaceColor', 'yellow');
    title('Press any key to the next image!');
    hold off;
    pause();
end