function [g, T] = edgeDetection(f, method, T, dir, sigma)

switch method
    case 'prewitt'
        [g, T] = edge(f, 'prewitt', T, dir);

    case 'roberts'
        [g, T] = edge(f, 'roberts', T, dir);

    case 'log'
        [g, T] = edge(f, 'log', T, dir);

    case 'zero'
        [g, T] = edge(f, 'zerocross', T, sigma);

    case 'canny'
        [g, T] = edge(f, 'canny', T, sigma);

    otherwise
        error('Invalid edge detection method.');
end

end
