close all;
clear all;
% Reading data from text files;
data = csvread('hand_26.txt');
data =data';
No_of_folds = 5;
[test_data,train_data] = KFoldCrossValidation(data,No_of_folds);


Average_Accuracy = zeros(4,1);
KNN = zeros(No_of_folds,1);
CENTROID = zeros(No_of_folds,1);
LINEAR_REGRESSION = zeros(No_of_folds,1);
SVM = zeros(No_of_folds,1);
for i =1 : No_of_folds
%Knn Classifier:
    knn_result = Knn(train_data{i},test_data{i},3);
    Average_Accuracy(1)= Average_Accuracy(1)+ Accuracy(knn_result);
    KNN(i) = Accuracy(knn_result);

% Centroid Classifier
    centroid_result = centroid(train_data{i},test_data{i});
    Average_Accuracy(2)= Average_Accuracy(2)+Accuracy(centroid_result);
    CENTROID(i) = Accuracy(centroid_result);

% Linear Regression Classifer
    linear_regression_result = LinearRegression(train_data{i},test_data{i});
    Average_Accuracy(3)= Average_Accuracy(3)+Accuracy(linear_regression_result);
    LINEAR_REGRESSION(i) = Accuracy(linear_regression_result); 

% SVM Classifer 
    svm_result = svm(train_data{i},test_data{i});
    Average_Accuracy(4)= Average_Accuracy(4)+Accuracy(svm_result);
    SVM(i) = Accuracy(svm_result);
end
Average_Accuracy = Average_Accuracy./No_of_folds;
Iteration = 1 : No_of_folds;
Iteration = Iteration';
Accuracy_Iteration_Level = table(Iteration , KNN, CENTROID, LINEAR_REGRESSION,SVM)
names = {'KNN'; 'CENTROID'; 'LINEAR_REGRESSION';'SVM'};
Average_Accuracy = table(Average_Accuracy,'RowNames',names)


