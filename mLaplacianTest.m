% Load your image
inputImage = imread('low_quality.jpg'); % Replace 'your_image.jpg' with your image file path

% Define the sharpening factor as a scalar double
sharpeningFactor = 0.33; % Adjust this value as needed

% Apply the Laplacian sharpening filter
sharpenedImage = laplacianSharpen(inputImage, sharpeningFactor);

% Display the original and sharpened images
subplot(1, 2, 1), imshow(inputImage), title('Original Image');
subplot(1, 2, 2), imshow(sharpenedImage), title('Sharpened Image');

% Optional: Save the sharpened image
imwrite(sharpenedImage, 'sharpened_image.jpg'); % Change the filename as needed
