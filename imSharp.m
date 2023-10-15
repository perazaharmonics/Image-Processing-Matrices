function sharpenedImage = imSharp(inputImage, method)
    % Convert the image to double format
    inputImage = im2double(inputImage);

    % Define sharpening kernels for different methods
    switch method
        case 'laplacian'
            sharpenKernel = [0 -1 0; -1 5 -1; 0 -1 0];
        case 'unsharp'
            % You can define your unsharp masking kernel here
        otherwise
            error('Invalid sharpening method.');
    end

    % Apply the selected sharpening kernel to the image
    sharpenedImage = imfilter(inputImage, sharpenKernel);

    % Ensure pixel values are within the [0, 1] range
    sharpenedImage = min(max(sharpenedImage, 0), 1);
end
