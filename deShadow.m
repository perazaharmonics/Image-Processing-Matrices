function filteredImage = deShadow(inputImage, sigma)
    % Apply Gaussian filter to the input image
    filteredImage = imgaussfilt(inputImage, sigma);
end
