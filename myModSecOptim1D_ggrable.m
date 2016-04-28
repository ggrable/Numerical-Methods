function [xr,fxr,dfxr,d2fxr2,ea,numIter]= myModSecOptim1D_ggrable(myfunc,x0,es,maxIter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function file: myModSecOptim1D_username.m
%
%Purpose:
% To determine the optimum value of function f(x) associated with myfunc
% using Modified Secant method
%
%Record of revisions (Date | Programmer | Change):
% 3/23/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% myfunc - function handle for [fx]=myfunc(x)
% x0 - (1x2) initial value of x and value of deltaX.
% x0(1) will be initial value of x
% x0(2) will be deltaX
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
assert(length(x0)==2,'x0 should have initial value of x AND deltaX');
assert((es>0)&&(es<100),'es should be between (0,100)');
assert(maxIter>1,'maxIter should be >1');
numIter=0;
ea=100;

while ea >= es && numIter < maxIter
   dfxr=((myfunc(x0(1)+x0(2)))-(myfunc(x0(1)-x0(2))))/(2*x0(2)); 
   d2fxr2=((myfunc(x0(1)+x0(2)))-(2*myfunc(x0(1)))+myfunc(x0(1)-x0(2)))/(x0(2)^2);
   xr=x0(1)-(dfxr/d2fxr2);
   ea=abs((xr-x0(1))/xr)*100;
   fxr=myfunc(xr);
   x0(1)=xr;
   numIter=numIter+1;
end