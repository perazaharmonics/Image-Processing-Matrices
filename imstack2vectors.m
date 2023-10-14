function vectorizedImages = imstack2vectors(imageStack)
    % Determine the number of images in the stack
    numImages = size(imageStack, 3);

    % Initialize the output matrix
    vectorizedImages = reshape(imageStack, [], numImages);
end
