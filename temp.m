clear
disp('Ucitavanje signala iz MIT-BIH baze...')
[~,config]=wfdbloadlib;
M=10000;
[ecg,Fs]=rdsamp('mitdb/100',1,M);
plot(ecg)
save('ecg_1.mat','ecg','Fs','M')