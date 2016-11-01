% centroid.m : Srinivas Bavisetti , Utphala Puttananjammagari
% description: the following matlab code is for centroid classifier

function result = centroid(train_data,test_data)  
    % the following code converts training data files into training variables which are
    %  used to train the model;
    y_train = train_data(:,1);
    x_train = train_data(:,2:end);
    
    % the following code converts testing data files into testing variables
    % which are used to test the model
    x_test = test_data(:,2:end);
    y_test = test_data(:,1);
    
    % the following code gets the centroids of the classes
    
    centroid_centers = zeros(size(unique(y_train),1) , size(x_train,2));
    class_number_count = zeros(1,size(unique(y_train),1));
    
    for i = 1:size(x_train,1)
        centroid_centers(y_train(i),:) =centroid_centers(y_train(i),:) + x_train(i,:);
        class_number_count(y_train(i)) = class_number_count(y_train(i))+1;
    end
    
    for i = 1 : size(unique(y_train),1)
        centroid_centers(i,:) = centroid_centers(i,:)./class_number_count(i);
    end
    
    % the following code performs testing on the centroid classifier model;
    
    res = zeros(1,size(unique(y_train),1));
    answer = zeros(1,size(x_test,1));
    
    % classifying the input test data to its respective class based on the
    % minimum eucledian distance betwwn the test vector and centroids of all the classe 
    
    for i = 1 : size(x_test,1)
        for j = 1 : size(unique(y_train),1)
            res(j) = norm(centroid_centers(j,:)-x_test(i,:));
        end
        [m,k] = min(res);
        answer(i) = k;
    end
    
   Expected_Values = y_test;
   Predicted_Values = answer';
   result = table(Predicted_Values,Expected_Values);
end

        
    
    
    
    
    
    
    