% %https://www.mathworks.com/help/vision/examples/image-category-classification-using-deep-learning.html
clear all
clc
close all
% end
%% Dataset Paths
outputFolder='D:\Study\Matlab_Codes\Datasets\';
rootFolder = fullfile(outputFolder, 'Fire');

allfoldernames= struct2table(dir(rootFolder));
for (i=3:height(allfoldernames))
    new(i-2)=allfoldernames.name(i);
end
clear i
categories=new;
imds = imageDatastore(fullfile(rootFolder, categories), 'LabelSource','foldernames');
tbl = countEachLabel(imds);
minSetCount = min(tbl{:,2}); % determine the smallest amount of images in a category
% Use splitEachLabel method to trim the set.
% imds = splitEachLabel(imds, minSetCount, 'randomize');
imds = splitEachLabel(imds, minSetCount, 'random');
% Notice that each set now has exactly the same number of images.
countEachLabel(imds);


%%

% Find the first instance of an image for each category
%% Pretrained Net AlexNet
% net = alexnet();
% net = vgg16();
net = inceptionv3();
net.Layers(1);
net.Layers(end);

imr=net.Layers(1, 1).InputSize(:,1);
imc=net.Layers(1, 1).InputSize(:,2);

imds.ReadFcn = @(filename)readAndPreprocessImage(filename,imr,imc);
[trainingSet, testSet] = splitEachLabel(imds, 0.7, 'random');
% Get the network weights for the second convolutional layer
% w1 = net.Layers(2).Weights;
%%   Resize weigts for vgg only
% w1 = imresize(w1,[imr imc]);
%%
featureLayer = 'avg_pool';
%%
trainingFeatures = activations(net, trainingSet, featureLayer, ...
 'MiniBatchSize', 64, 'OutputAs', 'columns');

trainingLabels = cellstr(trainingSet.Labels);


classifier = fitcecoc(trainingFeatures, trainingLabels, ...
    'Learners', 'Linear', 'Coding', 'onevsall', 'ObservationsIn', 'columns');

testFeatures = activations(net, testSet, featureLayer, ...
'MiniBatchSize', 128, 'OutputAs', 'columns');

trainingFeatures =trainingFeatures';
x = trainingFeatures';
y = cellstr(trainingLabels);
xy = array2table(x);
xy.type = y;