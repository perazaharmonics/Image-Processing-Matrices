function sharpenedImage = unsharpHighPassFilter(inputImage, sigma, scalingFactor)
    % Step 2: Convert the image to grayscale if it's not already
    if size(inputImage, 3) == 3
        grayImage = rgb2gray(inputImage);
    else
        grayImage = inputImage;
    end

    % Step 3: Apply Gaussian blur (low-pass filter)
    blurredImage = imgaussfilt(double(grayImage), sigma);

    % Step 4: Create the high-pass component (sharpening mask)
    highPass = double(grayImage) - blurredImage;

    % Step 5: Adjust the strength of the high-pass component
    sharpeningMask = scalingFactor * highPass;

    % Step 6: Add the sharpening mask to the original image
    sharpenedImage = uint8(double(grayImage) + sharpeningMask);
end
