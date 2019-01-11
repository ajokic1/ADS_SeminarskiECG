clear all
close all 
clc

tic
load('ECGData/ECGData.mat');
percent_train = 70;
[trainData,testData,trainLabels,testLabels] = ...
    HelperRandomSplit(percent_train,ECGData);

%% Broj signala po kategorijama:
Ctrain = countcats(categorical(trainLabels))./numel(trainLabels).*100;
Ctest = countcats(categorical(testLabels))./numel(testLabels).*100;

%% Ekstrakcija karakteristika signala koje ce se koristiti za treniranje klasifikatora
timeWindow = 8192;
ARorder = 4;
MODWPTlevel = 4;
[trainFeatures,testFeatures,featureindices] = ...
    helperExtractFeatures(trainData,testData,timeWindow,ARorder,MODWPTlevel);

%%SVM klasifikacija
features = [trainFeatures; testFeatures];
rng(1)
template = templateSVM(...
    'KernelFunction','polynomial',...
    'PolynomialOrder',2,...
    'KernelScale','auto',...
    'BoxConstraint',1,...
    'Standardize',true);
model = fitcecoc(...
    features,...
    [trainLabels;testLabels],...
    'Learners',template,...
    'Coding','onevsone',...
    'ClassNames',{'ARR','CHF','NSR'});
kfoldmodel = crossval(model,'KFold',5);
classLabels = kfoldPredict(kfoldmodel);
loss = kfoldLoss(kfoldmodel)*100
[confmatCV,grouporder] = confusionmat([trainLabels;testLabels],classLabels);

%% prikaz rezultata
CVTable = helperPrecisionRecall(confmatCV);
disp(CVTable)

toc