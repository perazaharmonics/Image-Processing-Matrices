function H = rejectFilter(type, MO, NO, DO, K, C, n)
%Frequency rectangle
H = ones(MO, NO, 'Single');
for I = 1:K


    % Place the notch at each location in delta. Function hpfilter returns
    % the filter uncentered. Use fftshift to center the M-by-N filter to
    % simplify indexing in the function placeNotches
    Usize = MO + 2* abs(C(I, 1));
    Vsize = NO + 2*abs(C(I, 2)); 
    filt = fftshift(hpfilter(type, Usize, Vsize, DO(I), n));
    % Insert FILT in H.
    H = placeNotches(H, filt, C(I, 1), C(I, 2));
end