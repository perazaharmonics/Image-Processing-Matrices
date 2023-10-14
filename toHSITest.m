% Load an RGB image (or use any RGB image you have)
rgbImage = imread('low_quality.jpg'); % Replace with your image path

% Convert the RGB image to HSI using the toHSI function
hsiImage = toHSI(rgbImage);

% Display the original RGB and converted HSI images
subplot(1, 2, 1), imshow(rgbImage), title('Original RGB Image');
subplot(1, 2, 2), imshow(hsiImage), title('Converted HSI Image');

% Optional: Save the HSI image
imwrite(hsiImage, 'hsi_image.jpg'); % Change the filename as needed
