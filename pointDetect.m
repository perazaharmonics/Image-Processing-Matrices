function pointDetect(f, w, T)
g = abs(imfilter(tofloat(f), w)) >= T;
end