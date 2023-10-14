function transformedImage = toColorSpace(rgbImage, colorSpace)
    % Check if the input image is in double format (0 to 1 range)
    if ~isa(rgbImage, 'double')
        rgbImage = double(rgbImage) / 255.0;
    end

    % Transform the RGB image to the specified color space
    switch lower(colorSpace)
        case 'hsv'
            transformedImage = rgb2hsv(rgbImage);
        case 'lab'
            transformedImage = rgb2lab(rgbImage);
        case 'ycbcr'
            transformedImage = rgb2ycbcr(rgbImage);
        otherwise
            error('Invalid color space specified.');
    end
end
