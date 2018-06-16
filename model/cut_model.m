close all
clear
clc

run /vol/vssp/FaceAnnotation2D/toolbox/MatConvNet/2017a/1.0-beta25/matlab/vl_setupnn.m;

modellist = dir('./ori/*.mat');
for i = 1:length(modellist)
    load(['./ori/' modellist(i).name]);
    net = dagnn.DagNN.loadobj(net);
    
    layer = net.layers(end);
    net.removeLayer(layer.outputs{1});
    net.rebuild();
    
    net.saveobj();
    save(['./' modellist(i).name], 'net');
end