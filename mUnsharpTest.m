% Step 1: Read the image
originalImage = imread('low_quality.jpg'); % Replace 'your_image.jpg' with your image file path

% Step 2: Convert the image to grayscale if it's not already
if size(originalImage, 3) == 3
    grayImage = rgb2gray(originalImage);
else
    grayImage = originalImage;
end

% Step 3: Apply Gaussian blur (low-pass filter)
sigma = 2; % Adjust the sigma value for the strength of blurring
blurredImage = imgaussfilt(double(grayImage), sigma);

% Step 4: Create the high-pass component (sharpening mask)
highPass = double(grayImage) - blurredImage;

% Step 5: Adjust the strength of the high-pass component
scalingFactor = 1.5; % Adjust the factor to control sharpening strength
sharpeningMask = scalingFactor * highPass;

% Step 6: Add the sharpening mask to the original image
sharpenedImage = uint8(double(grayImage) + sharpeningMask);

% Display the original and sharpened images
subplot(1, 2, 1), imshow(grayImage), title('Original Image');
subplot(1, 2, 2), imshow(sharpenedImage), title('Sharpened Image');

% Optional: Save the sharpened image
imwrite(sharpenedImage, 'sharpened_image.jpg'); % Change the filename as needed
