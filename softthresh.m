function [out] = softthresh(array,thresh)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
out = zeros(size(array));
for i = 1:length(array)
    if abs(array(i))<=thresh
        out(i) = 0;
    end
    if array(i)>thresh
        out(i) = array(i)-thresh;
    end
    if array(i)>thresh
        out(i) = array(i)+thresh;
    end
end

