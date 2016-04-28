function [coeffVec,r2]=myPolyReg_ggrable(xi,yi,degPoly)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Function file: myPolyReg_Username.m
%
%Purpose:
% To obtain the parameters of a L.S. polynomial best-fit for given data %
%Record of revisions (Date | Programmer | Change):
% 4/18/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% xi - (1xn) vector of given x values 
% yi - (1xn) vector of given y values 
% degPoly - (1x1) degree of L.S. polynomial 
%
%OUTPUTS:
%       coeffVec - ((degPoly+1) x 1) vector of coeffecients of L.S.
%       polynomial.
%       coeffVec(1) is a0
%       coeffVec(2) is a1
%
%       r2 - rsquared value
%
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


assert(length(xi)==length(yi));
n=length(xi);
ym1=(size(yi))/n;
ym=ym1(1);
for r = 1:degPoly+1;
    for k = 1:degPoly+1;
        A(r,k)=sum(xi.^(r+k-2));
    end
    B(r,1)=sum((xi.^(r-1)).*yi);
end
A(1,1)=n;
coeffVec= linsolve(A,B);
u=length(coeffVec);
fx=0;
for i=1:u
    fx(i,1)= (coeffVec(i)*(xi(i)^(i-1)));
end
ST=sum((yi-ym).^2);

for q = 1:u
    OP=yi(q)-fx(q);
end
SR=sum((OP).^2);
r2=(abs((ST-SR)/ST))*100;
end