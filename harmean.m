function f = harmean(g, m, n)
% Implements a harmonic mean filter for noise reduction in images.
%
% Parameters:
%   g - The input grayscale image, which can be of any standard image type
%       and will be converted to floating-point for processing.
%   m, n - The dimensions of the filter window (m x n), which should ideally
%          be odd numbers to ensure a central pixel.
%
% Returns:
%   f - The filtered image, with the same type as the input image, where
%       noise has been reduced using the harmonic mean filter.

% Convert the input image to floating-point, preserving the original class
% type for a later conversion back to ensure the output image is of the 
% same type as the input.
[g, revertClass] = tofloat(g);

% Compute the harmonic mean. The harmonic mean is calculated by dividing 
% the product of the window size (m*n) by the sum of reciprocals of the 
% pixel intensities within the window. The 'imfilter' function is used with 
% a filter window of ones(m, n) to sum the reciprocals of the pixel intensities.
% 'replicate' option is used to handle the border by replicating the values 
% at the image edges. 'eps' is added to avoid division by zero.
f = m*n ./ imfilter(1 ./ (g + eps), ones(m, n), 'replicate');

% Convert the filtered image back to the original class type of the input
% image, ensuring that the output is of the same type as the input.
f = revertClass(f);
end

% The 'tofloat' function and its implementation should be provided to 
% ensure this code works, as it is not a built-in MATLAB function and 
% is not provided in the snippet above.
