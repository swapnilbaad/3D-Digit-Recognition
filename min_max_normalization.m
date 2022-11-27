function c = min_max_normalization(Data)
%%Min-Max normalization
    for i = 1:length(Data)
        max_data(i) = max(Data{1,i}.pos(:));
        min_data(i) = min(Data{1,i}.pos(:));
    end
    max_p = max(max_data);
    min_p = min(min_data);
    
    for i = 1:length(Data)
        c{i} = (Data{1,i}.pos - min_p)./(max_p-min_p);
    end

