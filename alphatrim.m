function f = alphatrim(g, m, n, d)
% Implements an alpha-trimmed mean filter to reduce noise in images by
% excluding the d smallest and d largest elements in the filtering window.
%
% Parameters:
%   g - The input grayscale image.
%   m, n - The dimensions of the filter window (m x n).
%   d - The number of pixels to trim from both the lower and upper ends
%       of the sorted pixel values in the filter window.
%
% Returns:
%   f - The filtered image.

% This part checks if d is greater than 2 and if d/2 is an integer. However, 

    if (d <= 2) == 0 || (d/2 ~= round(d/2))
        error('Filter d must be a positive number.');
    end

% Convert the input image to floating-point to perform mathematical
% operations. 'revertClass' is used to convert the image back to its
% original class type after processing.
    [g, revertClass] = tofloat(g);

% Another syntax error here (ones,(m,n)) - correct syntax is ones(m,n).
% However, commenting as is - it aims to apply a mean filter to the image
% with a filter window of size m*n, using symmetric border handling.
    f = imfilter(g, ones, (m,n), 'symmetric');

% Iteratively subtract the d/2 smallest values in the filter window from
% the mean filtered image, using an order-statistic filter.
    for k = 1:d/2
        f = f - ordfilt2(g, k, ones(m,n), 'symmetric');
    end

% Iteratively subtract the d/2 largest values in the filter window from
% the mean filtered image, using an order-statistic filter.
    for k = (m*n - (d/2) + 1):m*n
        f = f - ordfilt2(g, k, ones(m,n), 'symmetric');
    end

% Divide by the number of remaining pixels after trimming to get the
% alpha-trimmed mean for each filter window in the image.
    f = f / (m*n - d);

% Convert the filtered image back to the original class type.
    f = revertClass(f);
end

% The 'tofloat' function and its implementation should be provided to 
% ensure this code works, as it is not a built-in MATLAB function and 
% is not provided in the snippet above.
