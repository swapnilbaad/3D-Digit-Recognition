function C = knn(trainclass, traindata, testData, k)
%% knn returns the class C for testData 

%Class vector gets appended with each classification
C = [];

%Distance between each sample calculated using DTW
for n = 1:length(testData)
    for i=1:length(traindata)
        dtwSum = 0;
        for d = 1:3
            dtwMatrix = DTW(testData{n}(:,d), traindata{i}(:,d));
       
            %Last element is the actual distance b/w the 2 time series
            dtw = dtwMatrix(size(dtwMatrix,1),size(dtwMatrix,2));

            dtwSum = dtwSum + dtw;
        end
        dist(i) = dtwSum;
    end

    %closest k neighbours
    [~,idx] = mink(dist,k);

    %Which class has closest set of elements; 3x1
    classPredicted = sum(trainclass(:,idx),2);
    

    %If two classes have same number of closest elements then return 
    [~,class_compare] = maxk(classPredicted,2);

%     if(classPredicted(class_compare(1))==classPredicted(class_compare(2)))
%         %When the loop returns we reduce value of k
%         C=0;
%         return
%     end
    
    %get class with max closest points
    [~, class] = max(classPredicted);
    
    %Assigning the data point the class based on kNN
    C(class,n) = 1;
 
end