function grid_plot(ab, limits, a_label, b_label)
plot(ab(:,1), ab(:, 2), '.', 'MarkerSize', 2);
axis equal, axis ij, axis(limits);
set(gca, 'XAxisLocation', 'top')
xlabel(a_label), ylabel(b_label)