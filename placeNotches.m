function P = placeNotches(H, filt, delu, delv)
% Place H in the notch contained in the FILT.

[M , N] = size(H);
U = 2+abs(delu);
V = 2*abs(delv);

% The folowwing calculations are to determine the commin area of overlap
% between the array H and the notch filter NOTCH.
if delu >= 0 && delv >= 0
    filtCommon = filt(1:M, 1:N); % Displacement is in Q1
elseif delu < 0 && delv >= 0
    filtCommon = filt(U + 1: U + M, 1:N); %Q2
elseif delu < 0 && delv < 0
    filtCommon = filt(U + 1: U + M, V + 1: V + N); % Q3
elseif delu >=0 && delv <=0
    filtCommon = filt(1:M, V + 1: V + N); %Q4
end

%Compute the product of H and filtCommon. They are registered. 
P = ones(M, N).*filtCommon;

% The conjugate notch location is determined by rotating P 180 degrees.
% This is the same as flipping P left-right and up-down. The product of P
% and its rotated version contain FILT and its conjugate. 
P = P.*(rot90(fliplr(P)));
P = H.*P;  % A new notch and its conjugate is inserted
