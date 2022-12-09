function C = digit_classify(testdata)
%% Function returns Class C of Nx3 test data

%Load normalised and preprocessed data and related classes
load normalisedData.mat;
load classes.mat;
load minMaxNormalisationVariables.mat
minMax = minMaxNormalisationVariables;
n = length(normalised_data);

%Min max normalisation of testdata
for d = 1:3
    normalTestData(:,d) = (testdata(:,d) - minMax(2,d))./(minMax(1,d)-minMax(2,d));
end

%Normalised training data
dataset = {normalised_data{1:n}};

%Value of k for knn classification
k = 8;
C = knnDigit3D(classes,dataset,normalTestData, k);





