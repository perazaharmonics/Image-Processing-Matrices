function sharpenedImage = laplacianSharpen(inputImage, sharpeningFactor)
    % Step 2: Convert the image to grayscale if it's not already
    if size(inputImage, 3) == 3
        grayImage = rgb2gray(inputImage);
    else
        grayImage = inputImage;
    end

    % Step 3: Create the Laplacian filter kernel
    laplacianKernel = [0, -1, 0; -1, 4, -1; 0, -1, 0];

    % Step 4: Apply the Laplacian filter
    sharpened = imfilter(double(grayImage), laplacianKernel);

    % Adjust the strength of sharpening by multiplying with a scalar double
    sharpened = double(grayImage) + sharpeningFactor * sharpened;

    % Clip the pixel values to the range [0, 255]
    sharpened = uint8(min(max(sharpened, 0), 255));

    sharpenedImage = sharpened;
end
