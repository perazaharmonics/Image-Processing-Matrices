function [out, revertclass] = tofloat(in)
% TOFLOAT Converts the input image to floating point.
% [OUT, REVERTCLASS] = TOFLOAT(IN) converts the input image IN to
% floating-point. If IN is a double or single image, then OUT equals IN.
% Otherwise, OUT equals IM2SINGLE(IN). REVERTCLASS is a function handle
% that can be used to convert OUT back to the class of IN.

identity = @(x) x;

if isa(in, 'double') || isa(in, 'single')
    out = in;
    revertclass = identity;
else
    out = im2single(in);
    revertclass = @(x) im2uint8(x);
end
