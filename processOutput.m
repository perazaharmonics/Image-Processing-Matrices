function Hout = processOutput(notch, H, M, N, center)

centerU = center(1, 1);
centerV = center(1, 2);
newRow = H(1, :);
newRow(1:centerV - 1) = fliplr(newRow(centerV + 1:end)); % Symmetric now.
newCol = H(:, 1);
newCol(1:centerU - 1) = flipud(newCol(centerU + 1:end));

% Insert new ror and/or column if appropiate:

if iseven(M) && iseven(N)
    Hout = cat(1, newRow, H);
    newCol = cat(2, newCol, Hout);
elseif iseven(M) && isodd(N)
    Hout = cat(1, newRow, H);
elseif isodd(M) && iseven(N)
    Hout=cat(2, newCol, H);
else 
    Hout = H;
end
%Uncenter the filter
Hout = ifftshift(Hout);

% Generate a pass filter if one was specified
if strcmp(notch, 'pass');
    Hout = 1 - Hout;
end
