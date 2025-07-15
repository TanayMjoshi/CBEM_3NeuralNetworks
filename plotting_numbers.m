clear; clc;
% Load the MNIST CSV file
filename= fullfile('datasets','mnist_train_100.csv');
data = readmatrix(filename);

hold on; %turn off for one digit one graph
digits_to_plot = 0:9;


for digit = digits_to_plot
    % Find indices of this digit in the dataset
    idx = find((data(:, 1) == digit));
    % Take first N samples
    samples_per_digit=length(idx);
    
    for j = 1:samples_per_digit
        sample = data(idx(j), 2:end);
        img = reshape(sample, [28, 28])';
        img = flipud(img); %flip

        % Calculate position for subplot-like grid
        x_offset = (j-1) * 28;
        y_offset = (-digit) * 28;

        % Display the image using imagesc with offset
        imagesc(x_offset + (1:28), y_offset + (1:28), img);
        colormap('gray');
          
    end
end

axis equal;


title('MNIST digits 0–9 with multiple examples');
