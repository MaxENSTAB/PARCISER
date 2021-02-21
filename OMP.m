function [A,histo] = OMP(D,X,L,Nx,Ny)
%
%=============================================
% 'Orthogonal matching pursuit' coding of a group of signals based on a given 
% dictionary and specified number of atoms to use. 
%
% INPUTS :
% D - the dictionary
% X - the signals to represent
% L - Desired number of bright spots
%
% OUTPUTS :
% A - scattering map.
% histo - histogram of the atoms used in the sparse repr.
%=============================================

[n,P]=size(X);
[n,K]=size(D);
A=zeros(K,P);
histo=zeros(1,K);
n0 = 1;
n1 = 1;
% Orthogonal matching pursuit

while n0 < L
    a=[];
    x=X(:,1);
    residual=x;
    indx=zeros(n1,1);
    for j=1:1:n1
        proj=D'*residual;
        pos=find(abs(proj)==max(abs(proj)));
        pos=pos(1);
        indx(j)=pos;
        a=pinv(D(:,indx(1:j)))*x;
        residual=x-D(:,indx(1:j))*a;
    end;
    A(indx,1)=a;
    abis = reshape(A,Nx,Ny);
    otsu = graythresh(abs(abis')/max(abs(abis'),[],'all'));
    binar = imbinarize(abs(abis')/max(abs(abis'),[],'all'),otsu);
    n0 = max(bwlabel(fftshift(binar)),[],'all');
    n1 = n1+1;
end;

% Histogram of atom indices
if (nargout==2)
        for i=1:K
            if (A(i,1)~=0)
                histo(i)=histo(i)+1;
            end
        end
end

