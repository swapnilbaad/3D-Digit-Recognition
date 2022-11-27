clc
close all
clear all

files = dir("digits_3d_training_data\digits_3d\training_data\\*.mat");
for i=1:length(files)
    pos{i} = load("digits_3d_training_data\digits_3d\training_data\"+files(i).name);
    class{i} = floor(i/101);
end

Data = [pos; class];


% b = Data{1,200}.pos;

% colour = [[1 0 0];[0 1 0];[0 0 1];[0 1 1];[1 0 1];[1 1 0];[0 0.4470 0.7410];[0.8500 0.3250 0.0980];[0.8500 0.3250 0.0980];[0.9290 0.6940 0.1250]];
% 
% for i =1:200
%     a = Data{1,i}.pos;
%     scatter3(a(:,1),a(:,2),a(:,3),[],colour(Data{2,i}+1,:),'filled')
%     hold on
% end

normalised_data = min_max_normalization(Data);
% class = knn(Data,k,Data_to_be_classified);

function c = min_max_normalization(Data)
    for i = 1:length(Data)
        max_data(i) = max(Data{1,i}.pos(:));
        min_data(i) = min(Data{1,i}.pos(:));
    end
    max_p = max(max_data);
    min_p = min(min_data);
    
    for i = 1:length(Data)
        c{i} = (Data{1,i}.pos - min_p)./(max_p-min_p);
    end
end