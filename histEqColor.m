function equalizedImage = histEqColor(inputImage, colorSpace)
    % Step 1: Convert the input image to the specified color space
    switch lower(colorSpace)
        case 'hsv'
            colorImage = rgb2hsv(inputImage);
        case 'lab'
            colorImage = rgb2lab(inputImage);
        case 'ycbcr'
            colorImage = rgb2ycbcr(inputImage);
        otherwise
            error('Invalid color space specified.');
    end

    % Separate the color channels
    channel1 = colorImage(:, :, 1);
    channel2 = colorImage(:, :, 2);
    channel3 = colorImage(:, :, 3);

    % Step 2: Apply histogram equalization to each channel
    equalizedChannel1 = histeq(channel1);
    equalizedChannel2 = histeq(channel2);
    equalizedChannel3 = histeq(channel3);

    % Step 3: Combine the equalized channels
    equalizedColorImage = cat(3, equalizedChannel1, equalizedChannel2, equalizedChannel3);

    % Convert the equalizedColorImage to double format
    equalizedColorImage = double(equalizedColorImage);

    % Step 4: Convert the equalized image back to RGB
    equalizedImage = hsv2rgb(equalizedColorImage); % Use the appropriate conversion function

    % Optionally, clip pixel values to the valid range
    equalizedImage = uint8(min(max(equalizedImage, 0), 255));
end
