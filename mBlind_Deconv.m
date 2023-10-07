me = imread("Lena2.JPG");
me_2 = rgb2gray(me);
noise = imnoise(me_2, 'gaussian', 0.1);
PSF = fspecial('gaussian', 7, 10);
SD = 0.1;
g = imnoise(imfilter(g, PSF), 'gaussian', 0, SD^2);


INITPSF = ones(size(PSF));
NUMIT = 5;
[g5, PSF5] = deconvblind(g, INITPSF, NUMIT, DAMPAR, WEIGHT);

imshow(pixeldup(PSF5, 73), [])
