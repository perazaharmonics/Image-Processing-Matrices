function edgeImage = rgbEdgeDetection(image)
    % Convert the RGB image to double format
    image = im2double(image);

    % Extract individual color channels
    redChannel = image(:, :, 1);
    greenChannel = image(:, :, 2);
    blueChannel = image(:, :, 3);

    % Calculate gradients for each color channel using the Sobel operator
    gradR = edge(redChannel, 'Sobel');
    gradG = edge(greenChannel, 'Sobel');
    gradB = edge(blueChannel, 'Sobel');

    % Combine the gradient images from all color channels
    edgeImage = gradR | gradG | gradB;
end
