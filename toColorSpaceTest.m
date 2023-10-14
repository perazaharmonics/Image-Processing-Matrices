% Load an RGB image (or use any RGB image you have)
rgbImage = imread('low_quality.jpg');

% Convert the RGB image to the desired color space
desiredColorSpace = 'ycbcr'; % Change to 'lab' or 'ycbcr' as needed
transformedImage = toColorSpace(rgbImage, desiredColorSpace);

% Display the original RGB and transformed color space images
subplot(1, 2, 1), imshow(rgbImage), title('Original RGB Image');
subplot(1, 2, 2), imshow(transformedImage), title(['Transformed to ' desiredColorSpace]);
