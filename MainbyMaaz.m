clc
close all
clear all

files = dir("digits_3d_training_data/digits_3d/training_data//*.mat");
for i=1:length(files)
    pos{i} = load("digits_3d_training_data/digits_3d/training_data/"+files(i).name);
    class{i} = floor(i/101);
end

Data = [pos; class];

%normalised_data = min_max_normalization(Data);

colour = [[1 0 0];[0 1 0];[0 0 1];[0 1 1];[1 0 1];[1 1 0];[0 0.4470 0.7410];[0.8500 0.3250 0.0980];[0.8500 0.3250 0.0980];[0.9290 0.6940 0.1250]];

%Plot the un normalised data
% for i =1:n
%     a = Data{1,i}.pos;
%     scatter3(a(:,1),a(:,2),a(:,3),[],colour(Data{2,i}+1,:),'filled')
%     hold on
% end

%Plot normalized data
% for i =1:n
%     a = normalised_data{i};
%     scatter3(a(:,1),a(:,2),a(:,3),[],colour(Data{2,i}+1,:),'filled')
%     hold on
% end

%Create an array for class 
class = [Data{2,:}];

normalised_data = min_max_normalization(Data);


n = 1000;
%Classes for 2 digits
class = class(1:n);
classes = zeros(size(class)); 
classes(1,class== 0) = 1; classes(2, class == 1) = 1;
classes(3,class== 2) = 1; classes(4,class== 3) = 1; 
classes(5,class== 4) = 1; classes(6, class == 5) = 1;
classes(7,class== 6) = 1; classes(8,class== 7) = 1; 
classes(9,class== 8) = 1; classes(10,class== 9) = 1; 

dataset = {normalised_data{1:n}};

%%Divide the data
randIndx = randperm(n);

%k = floor(sqrt(n));
k = 16;

%Training data and class uptill 70%
Training = dataset(:,randIndx(1:round(0.7*n))); 
classTrain = classes(:,randIndx(1:round(0.7*n))); 

%Testing data and class 30%
Testing = dataset(:,randIndx(round(0.7*n)+1:end));
classTest = classes(:,randIndx(round(0.7*n)+1:end));


%Value of K decreases everytime same two classes have equal highest number
%of samples
C= 0;
while(C == 0)
%     k = k-1;
    %Testing data classified in classes in C 
    C = knn(classTrain,Training,Testing, k);
end


%Compare output of algo with training class for accuracy
data_miss = sum(sum(C~=classTest))/2;

%Accuracy
accuracy = (length(classTest)-data_miss)/length(classTest)*100
sprintf("Value of K : %d", k)

