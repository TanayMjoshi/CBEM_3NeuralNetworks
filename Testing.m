clear;
clc;
error_sum=0;
corr_count=zeros(1,10);
total=zeros(1,10);
percentage=zeros(1,10);
%loading trained model
load("Trained_models\trainedNetwork.mat");
%network_test = neuralNetwork(784,100,10,0.5);
%loading test file
filename= fullfile('datasets','mnist_test.csv');
data = readmatrix(filename);
l=size(data,1);
%testing


for i = 1:l
    inputs = ((data(i,2:end) / 255.0)*0.99+0.01)';
    n=data(i,1);
    total(n+1)=1+total(n+1);
    target = ones(10,1) ./ 100;
    target(n+1,1)=0.99;
    corr=network1.test(inputs,target);

    if corr==1
        corr_count(n+1)=1+corr_count(n+1);
    end
end



for i=1:10
    percentage(i)=(corr_count(i)/total(i))*100;
    fprintf("Digit: %d Accuracy: %.2f%%\n",i-1, percentage(i));
end
%printing accuracy
plot((0:9),percentage);
title('Numbers vs Accuracy');

fprintf("Accuracy of our Neural Network: %.2f%% \n",(sum(corr_count)/l)*100);
disp('End');
