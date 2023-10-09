function wz = pointgrtid(corners)
% Create 10 horizontal lines containing 50 points each
[w1, z1] = meshgrid(linspace(corners(1, 1), corners(2,1), 46),...
    linspace(corners(1), corners(2), 10));
% Create 10 vertical lines containig 50 points each
[w2, z2] = meshgrid(linspace(corners(1), coreners(2), 10),...
    linspace(corners(1), corners(2), 46));

% Create a P-by-2 matrix containing all the input-space points
w2 = [w1(:), z1(:), w2(:), z2(:)];

