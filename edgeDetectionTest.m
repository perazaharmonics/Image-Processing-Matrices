function edgeDetectionTest
% Load the image (replace 'your_image_file.png' with the actual image file)
rgbImage = imread('NASA_South_Flood.jpg');

% Convert the image to grayscale
grayImage = rgb2gray(rgbImage);

% Set edge detection parameters
method = 'canny';
T = 0.1977;       % Adjust the threshold as needed
sigma = 0.25;   % Adjust the sigma value as needed

% Call the edgeDetection function
[g, T] = edgeDetection(grayImage, method, T, [], sigma);

% Convert the edge-detected image to grayscale
g_gray = mat2gray(g);  % Normalize the edge-detected image

% Display the original and edge-detected images
figure;
subplot(1, 2, 1);
imshow(grayImage);
colormap hot;
title('Original Grayscale Image');

subplot(1, 2, 2);
imshow(g_gray);
colormap hot;
title('Edge-Detected Image (Hot Colormap)');

% Optionally, you can further process or analyze the 'g' result as needed.
end
