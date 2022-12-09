clc
clear all

files = dir("digits_3d_training_data/digits_3d/training_data//*.mat");
for i=1:length(files)
    pos{i} = load("digits_3d_training_data/digits_3d/training_data/"+files(i).name);
    class{i} = floor(i/101);
end

Data = [pos; class];
testData = Data{1,201}.pos(:,:);

C = digit_classify(testData)
