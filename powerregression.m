function [A,b,a0,a1,stderror,stddev,cofdet,corrcof] = powerregression(x,y)
%Linear Regression calculates the linear best fit curve, along with other
%important vaiables.
%   Enter two arrays, the first for x values, and the second for y values.
%   These arrays should be the same length.

assert(length(x)==length(y));
n=numel(x);
sumx=sum(log(x));
sumx2=sumsqr(log(x));
sumy=sum(log(y));
sumxy=sum(log(x).*log(y));
A=[n,sumx;sumx,sumx2];
b=[sumy;sumxy];
D=linsolve(A,b);
a0=exp(D(1));
a1=D(2);
g=(x.^a1)*a0;
sr=sumsqr(y-g);
stderror=sqrt(sr/(n-2));
st=sumsqr(y-(sum(y)./n));
stddev=sqrt(st/(n-1));
cofdet=(st-sr)/st;
corrcof=sqrt(cofdet);
plot(x,y,'*',x,g); grid on;
end