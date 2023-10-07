me = imread("Lena2.JPG");
me_2 = rgb2gray(me);
noise = imnoise(me_2, 'gaussian', 0.1);
len = 3;
theta = 0.5;
PSF = fspecial('motion', len, theta);
g = imfilter(me_2, PSF, 'circular');
g = g + noise;
figure, imshow(g);
frest = deconvwnr(g, PSF);
Sn = abs(fft2(noise)).^2; % noise power spectrum
nA = sum(Sn(:))/numel(noise); % noise average power
Sf = abs(fft2(me_2)).^2; %image power spectrum
fA = sum(Sf(:))/numel(me_2);
R = nA / fA;
frest2 = deconvwnr(g, PSF, R);
figure, imshow(frest2)
NCORR = fftshift(ifft2(Sn));
ICORR = fftshift(real(ifft2(Sf)));

% Weiner Filter
frest3 = deconvwnr(g, PSF, NCORR, ICORR);
figure, imshow(frest3)
% Least Square Filters
frest4 = deconvreg(g, PSF, 0.4, [1e-7, 1e7]);
figure, imshow(frest2)

% Lucy Richardson Filter

g = checkerboard(8);

 
PSF = fspecial('gaussian', 7, 10);
SD = 0.01;
g = imnoise(imfilter(g, PSF), 'gaussian', 0, SD^2);
DAMPAR = 10*SD;

LIM = ceil(size(PSF, 1) / 2);
WEIGHT = zeros(size(g));
WEIGHT(LIM + 1: end - LIM, LIM + 1:end - LIM) = 1;
NUMIT = 5;

 

f5 = deconvlucy(g, PSF, NUMIT, DAMPAR, WEIGHT);
figure, imshow(f5)
