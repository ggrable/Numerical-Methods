function [xr,fxr,ea,numIter]=myModSec_ggrable(myfunc,x0,es,maxIter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function file: myModSec_username.m
%
%Purpose:
% To determine root of function associated with myfunc using the
% Modified Secant method
%
%Record of revisions (Date | Programmer | Change):
% 2/10/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% myfunc - function handle for [fx]=myfunc(x)
% x0 - (1x2) initial estimate of root and delta x such that
% x0(1) is the initial estimate of the root,
% x0(2) is delta x.
% es - (1x1) specified error tolerance in % (i.e. es=5 implies
% error tolerance of 5%)
% maxIter - (1x1) maximum number of iterations that can be performed
%
%OUTPUTS:
% xr - (1x1) estimate of the root
% fxr - (1x1) value of function at xr
% ea - (1x1) approx. percentage relative error at xr
% numIter- (1x1) number of iterations required to obtain xr
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%basic checks on inputs
 assert(length(x0)==2,'x0 should be a two value matrix');
 assert((es>0)&&(es<100),'es should be between (0,100)');
 assert(maxIter>1,'maxIter should be >1');
%initialize the outputs
 xr=0;
 fxr=0;
 ea=100;
 numIter=0;
 xr=x0(1);
 dx=x0(2);
 [fxr]=myfunc(xr);
 dfxr=(myfunc(xr+dx)-myfunc(xr))/dx;

while (ea>=es)&&(numIter<maxIter)
 xrPrev=xr;
 xr=xr-(fxr/dfxr);
 [fxr]=myfunc(xr);
 dfxr=(myfunc(xr+dx)-myfunc(xr))/dx;
 ea=abs((xr-xrPrev)./xr).*100;
 numIter=numIter+1;
end;
end