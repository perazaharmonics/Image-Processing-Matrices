% Load your RGB image (replace 'your_image.jpg' with your image file)
rgbImage = imread('Fires_NASA.jpg');

% Perform RGB edge detection using the Di Zenzo gradient algorithm
edgeImage = rgbEdgeDetection(rgbImage);

% Display the edge-detected image
imshow(edgeImage);
title('RGB Edge-Detected Image');
