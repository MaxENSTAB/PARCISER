function A = compute_a(x,y,datac,fmusicx,fmusicy)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
[lenx,leny]= size(datac);

A = zeros(lenx,leny);
for ind1 = 1:lenx
    for ind2 = 1:leny
        A(ind1,ind2) = exp(1j*4*pi*(1/3e8)*(fmusicx(ind1)*x - fmusicy(ind2)*y));
    end
end

