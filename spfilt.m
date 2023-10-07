function f = spfilt(g, type, varargin)
    [m, n, Q, d] = processinputs(varargin{:});

    % Do the filtering
    w = fspecial('average', [m, n]);
    
    switch type
        case 'gmean'
            f = gmean(g, m, n);

        case 'hmean'
            f = harmean(g, m, n);

        case 'chmean'
            f = charmean(g, m, n, Q);

        case 'median'
            f = medfilt2(g, [m, n], 'symmetric');

        case 'max'
            f = imdilate(g, ones(m, n));

        case 'min'
            f = imerode(g, ones(m, n));

        case 'midpoint'
            f1 = ordfilt2(g, 1, ones(m, n), 'symmetric');
            f2 = ordfilt2(g, m * n, ones(m, n), 'symmetric');
            f = imlincombo(0.5, f1, 0.5, f2);

        case 'atrimed'
            f = alphatrim(g, m, n, d);

        otherwise
            error('Unknown Filter Type.');
    end
end

function [m, n, Q, d] = processinputs(varargin)
    % This is a helper function to process the optional input arguments.
    % You can define the processing logic for your specific needs here.
    % Extract m, n, Q, and d from varargin and provide defaults if necessary.
    % For example:
    
    m = 3; % Default value for m
    n = 3; % Default value for n
    Q = 1; % Default value for Q
    d = 1; % Default value for d
    
    % Process varargin to update m, n, Q, and d as needed based on the input arguments.
end
