% LinearRegression.m : Srinivas Bavisetti , Utphala Puttananjammagari
% description: the following matlab code is for LinearRegression classifier
% Reference :http://artint.info/html/ArtInt_179.html

function result = LinearRegression(train_data,test_data)    
    % the following code converts training data files into training variables which are
    %  used to train the model;
    y_train = train_data(:,1);
    x_train = train_data(:,2:end);
    
    % the following code converts testing data files into testing variables
    % which are used to test the model
    x_test = test_data(:,2:end);
    y_test = test_data(:,1);
    
    % indicator matrix creation and initilization
    y_indicator_matrix = zeros(size(unique(y_train),2),size(x_train,1));
    for i = 1 : size(x_train,1)
        y_indicator_matrix(y_train(i),i) = 1;
    end
    
    %the following code calculate the weight matrix which in turn is used
    %to predict the class value
   
    B = pinv(x_train) * double(y_indicator_matrix)';
    y_test1 = B' * x_test';
    
    % classificiation of the test data;
    [test_value,test_position] = max(y_test1,[],1);
    Predicted_Values =test_position';
    Expected_Values = y_test;
    
    result = table(Predicted_Values,Expected_Values);    
end

      
   

    
        
    