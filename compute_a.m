function a = compute_a(x,data,freq,d)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
lenx = length(data);

a = zeros(1,lenx);
for ind1 = 1:lenx
    a(ind1) = exp(-1j*2*pi*(1/3e8)*(freq(ind1)*x));
end

