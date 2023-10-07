function f = apmedian(g, Smax)
% Implements an adaptive median filter to process an image with the goal
% of reducing impulse noise while preserving edges.

% Validate the Smax parameter to ensure it is an odd, positive integer.
if (Smax <= 1) || (mod(Smax, 2) == 0)
    error('Smax must be an odd integer greater than 1.');
end

% Initial setup: create an output image 'f' initialized with zeros, 
% and a logical matrix 'alreadyProcessed' to keep track of the pixels 
% that have been processed.
f = zeros(size(g));
alreadyProcessed = false(size(g));

% Begin filtering: iterate with window sizes from 3 to Smax, incrementing by 2
% to ensure the window size is always odd.
for k = 3:2:Smax
    % Compute the minimum, maximum, and median values in the kxk neighborhood.
    zmin = ordfilt2(g, 1, ones(k, k), 'symmetric');
    zmax = ordfilt2(g, k*k, ones(k, k), 'symmetric');
    zmed = medfilt2(g, [k k], 'symmetric');
    
    % Identify the pixels that need processing at this level: those where
    % zmed is between zmin and zmax, and that have not been processed yet.
    process = (zmed > zmin) & (zmed < zmax) & ~alreadyProcessed;
    
    % Of those identified for processing, determine which ones will be 
    % replaced by zxy (original value) and which ones will be replaced 
    % by zmed (median value).
    zB = (g > zmin) & (g < zmax);
    outputZxy = process & zB;
    outputZmed = process & ~zB;
    
    % Assign the new values to the output image 'f'.
    f(outputZxy) = g(outputZxy);
    f(outputZmed) = zmed(outputZmed);  % Corrected this line
    
    % Update the 'alreadyProcessed' matrix.
    alreadyProcessed = alreadyProcessed | process;
    
    % If all pixels have been processed, break from the loop.
    if all(alreadyProcessed(:))
        break;
    end
end

% For the pixels that have not been processed after the loop,
% assign the original pixel values.
f(~alreadyProcessed) = g(~alreadyProcessed);
end
