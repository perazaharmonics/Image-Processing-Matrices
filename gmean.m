function f = gmean(g, m, n)
% Implements a geometric mean filter for image noise reduction.
%
% Parameters:
%   g - The input grayscale image, expected to be in any standard image
%       type. It will be converted to floating-point for processing.
%   m, n - The dimensions of the filter window (m x n). These define the
%          size of the local area used for the geometric mean calculation.
%
% Returns:
%   f - The filtered image, with noise reduced by applying the geometric 
%       mean filter. The image is returned in the same type as the input.

% Convert the input image to floating-point to facilitate the logarithmic
% and exponential operations in the filtering process. The 'revertClass' 
% function is used to convert the image back to its original class type 
% after processing.
[g, revertClass] = tofloat(g);

% Apply the geometric mean filter. The 'log' function is applied to each 
% pixel in the image, and then a mean filter (using 'imfilter' with a window
% of ones(m, n)) calculates the local mean of the logarithmically transformed
% values. The 'replicate' option is used for border handling. The mean values
% are then exponentiated to obtain the geometric mean, and the result is 
% normalized by raising it to the power of the reciprocal of the total number
% of pixels in the filter window (1/m/n).
f = exp(imfilter(log(g), ones(m, n), 'replicate')).^(1 / m / n);

% Convert the filtered image back to the original class type to ensure the 
% output image is consistent with the input image in terms of data type.
f = revertClass(f);
end

% Note: The 'tofloat' function and its definition should be provided elsewhere
% in your code as it’s not a built-in MATLAB function and is not defined
% in the snippet provided.
