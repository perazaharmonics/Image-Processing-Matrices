function f = charmean(g, m, n, q)
% Implements a characteristic mean filter for reducing either salt or
% pepper noise in a grayscale image, based on the order parameter 'q'.
%
% Parameters:
%   g - The input grayscale image, which can be in any standard image format.
%       It will be converted to floating-point for processing.
%   m, n - The dimensions of the filter window (m x n), specifying the
%          local neighborhood size used for the filtering operation.
%   q - The order parameter, a scalar value indicating the type of noise
%       to be reduced: positive values target salt noise, while negative
%       values target pepper noise.
%
% Returns:
%   f - The filtered image, with noise reduced based on the characteristic
%       mean filter. The image is returned in the same format as the input.

% Convert the input image to a floating-point format to allow precise
% mathematical operations. The 'revertClass' function is also called to 
% ensure the output image is converted back to the original format.
[g, revertClass] = tofloat(g);

% Apply a power-law transformation to the image using the exponent (q+1)
% and then filter it using a mean filter of size m*n. The 'replicate' 
% option is used for edge handling.
f = imfilter(g.^(q+1), ones(m, n), 'replicate');

% Divide the transformed and filtered image by another filtered image that
% has been transformed using the exponent 'q'. This operation generates the 
% characteristic mean. An epsilon is added to the denominator to prevent 
% division by zero.
f = f ./ (imfilter(g.^q, ones(m, n), 'replicate') + eps);

% Convert the filtered image back to its original data type to ensure 
% consistency between the formats of the input and output images.
f = revertClass(f);
end

% Note: Ensure the 'tofloat' function and its definition are included 
% elsewhere in your code, as it’s not a built-in MATLAB function and 
% has not been defined in this snippet.
