function hsi = toHSI(rgb)
    % Extract rgb individual channels
    r = double(rgb(:, :, 1));
    g = double(rgb(:, :, 2));
    b = double(rgb(:, :, 3));

    % Implement the conversion equation
    num = 0.5*((r - g) + (r - b));
    den = sqrt((r - g).^2 + (r - b).*(g - b) + eps); % Add eps for numerical stability
    theta = acos(num./(den + eps));

    H = theta;
    H(b > g) = 2*pi - H(b > g);
    H = H/(2*pi);

    num = min(min(r, g), b);
    den = r + g + b;
    den(den == 0) = eps;
    S = 1 - 3.*num./den;
    H(S == 0) = 0;
    I = (r + g + b) / 3;

    % Combine all three results into an hsi image
    hsi = cat(3, H, S, I);
end
