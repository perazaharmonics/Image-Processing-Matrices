function g = imtransform2(f, varargin)

% Uses the same coordinate space for in the input coordinates and output
% coordinates to facilitate image geometrical transformations visualization
% when comparing.
[M, N] = size(f);
xdata = [1 N];
ydata = [1 M];
g = imtransform(f, varargin{:}, 'XData', xdata, 'YData', ydata);
