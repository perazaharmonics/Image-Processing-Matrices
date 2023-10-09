function g = reprotate(f, interp_method)

% Form a spacial transformation that rotates the image about its center
% point. The transformation is formed as a composite of three affine
% tranformations. 

%1. Transform of the center of the image to the origin.
center = fliplr(1 + size(f) / 2);
A1 = [1 0 0; 0 1 0; -center, 1];

%2. Rotate 30 degrees about the origin.
theta = 30*pi / 180;
A2 = [cos(theta) -sin(theta) 0; sin(theta) cos(theta) 0; 0 0 1];


% 3. Transform from the origin back to the original center location.
A3 = [1 0 0; 0 1 0; center 1];

% Compute the three transforms using matrix multiplication

A = A1 * A2 *A3;
tform= maketform('affine', A);


% Apply each rotation 12 times in sequence. Use imtranform2 so that each
% successive transformation is computed using the same location and size as
% the original image.
g = f;
for k =1:12
    g = imtransform2(g, tform, interp_method);
end

