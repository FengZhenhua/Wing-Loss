% the input are all the facial landmarks in a 2L*N matrix
% the output is the re-balanced index for PDB
% to test this code run
% load ./data/aflwTrainData.mat
% allShapes = [];
% for i = 1:20000
%     allShapes(:,i) = trainData(i).gtLmk;
% end
% pdbIdx = pdb(allShapes, 9);

function newIdx = pdb(allShapes, numBins)

% align all the facial landmark using procrustes analysis
alignedShape = allShapes;
meanShape = mean(alignedShape, 2);
for i = 1:length(alignedShape)
    [~, tmpS] = procrustes(reshape(meanShape,[],2), reshape(alignedShape(:,i),[],2));
    alignedShape(:,i) = [tmpS(:,1); tmpS(:,2)];
end

% apply pca to aligned shapes
meanShape = mean(alignedShape,2);
[COEFF,~,~] = pca(alignedShape');

% select the shape eigen vector controlling pose variations
numLmk = size(allShapes, 1) / 2;
switch numLmk
    case 19
        poseEig = COEFF(:, 2);
    otherwise
        poseEig = COEFF(:, 1);
end
posePara = poseEig' * (alignedShape - repmat(meanShape, 1, length(alignedShape)));

% balance the training samples by yaw rotations
absPosePara = abs(posePara);
maxPasePara = max(absPosePara);
maxSampleInBins = max(hist(absPosePara, numBins));

newIdx = [];
for i = 1:numBins
    tmp1 = find(absPosePara >= (i-1)*maxPasePara/numBins);
    tmp2 = find(absPosePara <= i*maxPasePara/numBins);
    tmpTrainIdx = intersect(tmp1, tmp2);
    ratio = round(maxSampleInBins / length(tmpTrainIdx));
    newIdx = [newIdx, repmat(tmpTrainIdx, 1, ratio)];
end

%% debug
% figure();
% subplot(1,2,1);
% hist(absPosePara, numBins);
% subplot(1,2,2);
% hist(absPosePara(newIdx), numBins);
end