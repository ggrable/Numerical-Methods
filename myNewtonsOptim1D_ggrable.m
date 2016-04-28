function [xr,fxr,dfxr,d2fxr2,ea,numIter]=myNewtonsOptim1D_ggrable(myfunc,x0,es,maxIter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function file: myNewtonsOptim1D_sidsavad.m
%
%Purpose:
% To determine the optimum value of function associated with myfunc
% using Newton's method
%
%Record of revisions (Date | Programmer | Change):
% 03/23/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% myfunc - function handle for [fx,dfx,d2fx2]=myfunc(x)
% x0 - (1x1) initial estimate of optimum
% es - (1x1) specified error tolerance in % (i.e. es=5 implies
% error tolerance of 5%)
% maxIter - (1x1) maximum number of iterations that can be performed
%
%OUTPUTS:
% xr - (1x1) estimate of the optimum
% fxr - (1x1) value of function at xr
% dfxr - (1x1) value of derivative of function at xr
% d2fxr2 - (1x1) value of 2nd derivative of function at xr
% ea - (1x1) approx. percentage relative error at xr
% numIter- (1x1) number of iterations required to obtain xr
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%basic checks on inputs
 assert(length(x0)==1,'x0 should be a single value');
 assert((es>0)&&(es<100),'es should be between (0,100)');
 assert(maxIter>1,'maxIter should be >1');
%initialize the outputs
 xr=0;
 fxr=0;
 dfxr=0;
 d2fxr2=0;
 ea=100;
 numIter=0;
 xr=x0;
 [fxr,dfxr,d2fxr2]=myfunc(xr);
 assert(d2fxr2~=0,'Function should not have zero 2nd derivative');
while (ea>=es)&&(numIter<maxIter)

 assert(d2fxr2~=0,'Function should not have zero 2nd derivative');

 xrPrev=xr;
 xr=xr-dfxr./d2fxr2;
 [fxr,dfxr,d2fxr2]=myfunc(xr);

 ea=abs((xr-xrPrev)./xr).*100;
 numIter=numIter+1;

end;