% Load an RGB image (or use any RGB image you have)
rgbImage = imread('low_quality.jpg');

% Specify the desired color space ('hsv', 'lab', or 'ycbcr')
desiredColorSpace = 'hsv';


% Perform histogram equalization
equalizedImage = histEqColor(rgbImage, desiredColorSpace);

% Display the original and equalized images
subplot(1, 2, 1), imshow(rgbImage), title('Original Image');
subplot(1, 2, 2), imshow(equalizedImage), title('Equalized Image');
