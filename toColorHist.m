function histogram = toColorHist(inputImage, colorSpace)
    % Convert the input image to the specified color space
    switch lower(colorSpace)
        case 'rgb'
            colorImage = inputImage;
        case 'hsv'
            colorImage = rgb2hsv(inputImage);
        case 'lab'
            colorImage = rgb2lab(inputImage);
        case 'ycbcr'
            colorImage = rgb2ycbcr(inputImage);
        otherwise
            error('Invalid color space specified.');
    end

    % Extract the color channels from the color image
    channel1 = colorImage(:, :, 1);
    channel2 = colorImage(:, :, 2);
    channel3 = colorImage(:, :, 3);

    % Compute the histograms of the color channels
    numBins = 256; % You can adjust the number of bins as needed
    histogram1 = imhist(channel1, numBins);
    histogram2 = imhist(channel2, numBins);
    histogram3 = imhist(channel3, numBins);

    % Concatenate the histograms of all color channels
    histogram = [histogram1; histogram2; histogram3];

    % Optionally, normalize the histogram
    histogram = histogram / sum(histogram);
end
