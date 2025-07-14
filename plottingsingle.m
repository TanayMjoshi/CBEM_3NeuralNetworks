clc;
clear;


filename = fullfile('datasets','mnist_test_10.csv');
data = readmatrix(filename);
index = randi(10);  

% specify digit
label = data(index, 1);
pixels = data(index, 2:end);


image = reshape(pixels, [28, 28])';
figure;
imshow(image, []);
title(['Label: ', num2str(label)]);