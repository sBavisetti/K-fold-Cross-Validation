% Knn.m : Srinivas Bavisetti,Utphala Puttananjammagari
% Description: function to classify data based on K- nearest neighbors
%              algorithm

function result = Knn(train_data,test_data,no_of_neighbours)
        
    % the following code converts training data files into training variables which are
    %  used to train the model;
    y_train = train_data(:,1);
    x_train = train_data(:,2:end);
    
    % the following code converts testing data files into testing variables
    % which are used to test the model
    x_test = test_data(:,2:end);
    y_test = test_data(:,1);
    
    %testing
    eval_matrix = zeros(size(x_train,1),2);
    resultant_matrix = zeros(size(x_test,1),1);
    for i =1 : size(x_test,1)
        for j = 1 : size(x_train,1)
            eval_matrix(j,1) = norm(x_test(i,:) - x_train(j,:));
            eval_matrix(j,2) = y_train(j);
        end
            eval_matrix = sortrows(eval_matrix);
            res = eval_matrix(1:no_of_neighbours,2);
            resultant_matrix(i) = mode(res);
            eval_matrix = zeros(size(x_train,1),2);
    end
   Predicted_Values = resultant_matrix;
   Expected_Values = y_test;
   result = table(Predicted_Values,Expected_Values);
            
end

