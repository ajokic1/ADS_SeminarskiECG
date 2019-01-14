%
% ==== Obrada i klasifikacija EKG signala pomocu SVM klasifikatora ====
%
% Andrej Jokic
%

%% Ucitavanje signala
% ECGData.Data: Matrica dimenzija 162x65536
% ECGData.Labels: Matrica dimenzija 162x1 - klase EKG signala
% Svaki red predstavlja jedan EKG signal

clear;clc;close all

uc_uzorkovanja=128; %ucestanost uzorkovanja 128 Hz
load('ECGData/ECGData.mat');

% nasumicno dijelimo signale na dvije grupe
% jedna ce se koristiti za treniranje, druga za testiranje
percent_train = 70;
[trainData,testData,trainLabels,testLabels] = ...
    HelperRandomSplit(percent_train,ECGData);


%% Obrada signala pomocu LMS algoritma za uklanjanje suma

%obradaLMS(ECGData.Data);

%% Izdvajanje parametara signala
% Parametri se izdvajaju pomocu paketa PhysioNet Cardiovascular Signal
% Toolbox.

HRVparams=InitializeHRVparams('SeminarskiADS');
HRVparams.Fs=uc_uzorkovanja;
HRVparams.windowlength=512;

% Iz rezultata uzimamo samo sljedece parametre:
%   Time domain:        RR mean, RR Std, HR mean, HR Std, RMSSD, NN50,
%                       pNN50, RR Triangular Index, TINN.
%   Frequency domain:   VLFpwr, LFpwr, HFpwer, LFnorm, HFnorm
%                       LF/HF Ratio
ind_parametara=[2:13 15:20];
rezultatiTrain=zeros(size(trainData,1),21);
rezultatiTest=zeros(size(testData,1),21);
for i=1:size(trainData,1)
    [rezultatiTrain(i,:),fileName]=Main_HRV_Analysis(trainData(i,:),'','ECGWaveform',HRVparams,num2str(i));
end
for i=1:size(testData,1)
    [rezultatiTest(i,:),fileName]=Main_HRV_Analysis(trainData(i,:),'','ECGWaveform',HRVparams,num2str(i));
end

%% SVM klasifikacija

template = templateSVM(...
    'KernelFunction','polynomial',...
    'PolynomialOrder',2,...
    'KernelScale','auto',...
    'BoxConstraint',1,...
    'Standardize',true);
model = fitcecoc(...
     trainFeatures,...
     trainLabels,...
     'Learners',template,...
     'Coding','onevsone',...
     'ClassNames',{'ARR','CHF','NSR'});
predLabels = predict(model,testFeatures);

%% Testiranje modela

correctPredictions = strcmp(predLabels,testLabels);
testAccuracy = sum(correctPredictions)/length(testLabels)*100
[confmatTest,grouporder] = confusionmat(testLabels,predLabels);

testTable = helperPrecisionRecall(confmatTest);
disp(testTable)