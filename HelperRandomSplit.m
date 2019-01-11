function [train,test,trainL,testL]=HelperRandomSplit(percent,data)
[br_uk]=size(data.Data,1); %ukupan broj signala
br_train=fix(percent/100 * br_uk); %broj signala za treniranje
br_test=br_uk-br_train; %broj signala za testiranje

n=1:br_uk;
n_train=randsample(br_uk,br_train); %niz indeksa za treniranje
n_test=setdiff(n,n_train); %niz indeksa za testiranje

train=data.Data(n_train,:);
trainL=data.Labels(n_train);

test=data.Data(n_test,:);
testL=data.Labels(n_test);