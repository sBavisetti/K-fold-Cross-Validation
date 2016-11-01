% Knn.m : Srinivas Bavisetti,Utphala Puttananjammagari
% Description: function to perform k-fold cross validation
%              algorithm

function [test_data,train_data] = KFoldCrossValidation(data,fold_size)

    % code which is used to shuffle all the rows of the data set
    sort_array = randperm(size(data,1));
    for i = 1: size(data,1)
        randomized_data(i,:) = data(sort_array(i),:);
    end
    % code to divide the dataset int k sub data sets.
    no_of_rows = size(data,1);

    test_data{fold_size,1} = [];
    train_data{fold_size,1} = [];

  block = floor(no_of_rows/fold_size);

  test_data{1} = randomized_data(1:block,:);
  train_data{1} = randomized_data(block+1:end,:);

  for f = 2:fold_size
      test_data{f} = randomized_data((f-1)*block+1:(f)*block,:);
      train_data{f} = [randomized_data(1:(f-1)*block,:); randomized_data(f*block+1:end, :)];
  end
end
