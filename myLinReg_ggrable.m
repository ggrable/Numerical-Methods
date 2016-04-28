function [coeffVec,r2]=myLinReg_ggrable(xi,yi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Function file: myLinReg_Username.m
%
%Purpose:
 %   To obtain the parameters of a L.S. linear best-fit for given data
 %
 %Record of revisions (Date | Programmer | Change):
 %   4/10/2016 |   Graham Grable    |  Original program
 %
 %Main Variables:
 %INPUTS:
 %   xi      - (1xn) vector of given x values
 %   yi      - (1xn) vector of given y values
 %OUTPUTS:
%   coeffVec- (2x1) vector of coeffcients of linear best fit a0+a1*x
%               coeffVec(1) is intercept (a0)
%               coeffVec(2) is slope (a1)
%      r2- r squared value
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

n=numel(xi);
sumx=sum(xi);
sumx2=sumsqr(xi);
sumy=sum(yi);
sumxy=sum(xi.*yi);
A=[n,sumx;sumx,sumx2];
b=[sumy;sumxy];
coeffVec=linsolve(A,b);
g=coeffVec(1)+(xi.*coeffVec(2));
sr=sumsqr(yi-g);
st=sumsqr(yi-(sum(yi)./n));
r2=(st-sr)/st;
end