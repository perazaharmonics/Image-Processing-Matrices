% Load the RGB image of the storm (replace with your image path)
rgbImage = imread('Fires_NASA.jpg');

% Set segmentation parameters for the "mahalanobis" method
method = 'mahalanobis';
T = 0.01;  % Adjust the threshold as needed
meanVector = [128, 128, 128];  % Adjust the mean vector as needed
covarianceMatrix = eye(3);  % Identity covariance matrix (adjust as needed)

% Perform segmentation using colorseg on the RGB image
segmentedImage = colorseg(rgbImage, T, meanVector, covarianceMatrix);

% Display the results
figure;

% Original RGB image
subplot(1, 3, 1);
imshow(rgbImage);
title('Original RGB Image');

% Grayscale image (for reference)
grayImage = rgb2gray(rgbImage);
subplot(1, 3, 2);
imshow(grayImage, []);
title('Grayscale Image (Reference)');

% Segmented image
subplot(1, 3, 3);
imshow(segmentedImage, []);
title('Segmented Image');

% Optionally, you can save the segmented image or perform further analysis.
