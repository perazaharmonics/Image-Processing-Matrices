% Step 1: Create a MATLAB script (e.g., test_unsharp_filter.m)

% Step 2: Load an image
inputImage = imread('low_quality.jpg'); % Replace 'your_image.jpg' with your image file path

% Step 3: Define parameters for the unsharp high-pass filter
sigma = 0.1;           % Gaussian blur parameter
scalingFactor = 1.5; % Sharpening strength

% Step 4: Call the unsharpHighPassFilter function
sharpenedImage = unsharpHighPassFilter(inputImage, sigma, scalingFactor);

% Step 5: Display the original and sharpened images
subplot(1, 2, 1), imshow(inputImage), title('Original Image');
subplot(1, 2, 2), imshow(sharpenedImage), title('Sharpened Image');

% Step 6: Optionally, save the sharpened image
imwrite(sharpenedImage, 'sharpened_image.jpg'); % Change the filename as needed
