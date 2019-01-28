clear;close all;clc
load('rezultati.mat')
%% nasumicna podjela na podatke za treniranje i testiranje
percentTrain=80;
trainInd=randsample(N1+N2, round(percentTrain/100*(N1+N2)));
testInd=setdiff(1:(N1+N2), trainInd);

ind_parametara=[2:14 16:21];
rezultati=rezultati(:,ind_parametara);
%% SVM treniranje
model = fitcsvm(...
     rezultati(trainInd,:),...
     klase(trainInd),...
     'ClassNames',{'ARR','NSR'});
 
 %% Testiranje modela
predLabels = predict(model,rezultati(testInd,:));
correctPredictions = strcmp(predLabels,klase(testInd));
testAccuracy = sum(correctPredictions)/length(testInd)*100
[confmatTest,grouporder] = confusionmat(klase(testInd),predLabels);

testTable = helperPrecisionRecall2(confmatTest);
disp(testTable)