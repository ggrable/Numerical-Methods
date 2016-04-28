function [A,b,a0,a1,a2,stderror,stddev,cofdet,corrcof] = quadraticregression(x,y)
%Linear Regression calculates the linear best fit curve, along with other
%important vaiables.
%   Enter two arrays, the first for x values, and the second for y values.
%   These arrays should be the same length.

assert(length(x)==length(y));
n=numel(x);
sumx=sum(x);
sumx2=sumsqr(x);
sumx3=sum(x.^3);
sumx4=sum(x.^4);
sumy=sum(y);
sumxy=sum(x.*y);
sumx2y=sum((x.^2).*y);
A=[n,sumx,sumx2;sumx,sumx2,sumx3;sumx2,sumx3,sumx4];
b=[sumy;sumxy;sumx2y];
D=linsolve(A,b);
a0=D(1);a1=D(2);a2=D(3);
g=a0+(x.*a1)+((x.^2).*a2);
sr=sumsqr(y-g);
stderror=sqrt(sr/(n-3));
st=sumsqr(y-(sum(y)./n));
stddev=sqrt(st/(n-1));
cofdet=(st-sr)/st;
corrcof=sqrt(cofdet);
plot(x,y,'*',x,g); grid on;
end
