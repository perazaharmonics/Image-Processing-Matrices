function vistform(tform, w2)

% transform the input points to output space.
xy = tformfwd(tform, wz);

% Compute axes limits for both plots. Bump the limits outward slightly
minlim = min([wz; xy], [], 1);
maxlim = max([wz; xy], [], 1);
bump = max((maxlim - minlim)*0.05, 0.1);
limits = [minlim(1)-bump(1), maxlim(1)+bump(1),...
    minlim(2)-bump(2), maxlim(2)+bump(2)];

subplot(1, 2 ,1)
grid_plot(wz, limits, 'x', 'y');