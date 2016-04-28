function [xr,fxr,ea,numIter]=myNR_ggrable(myfuncHW10,x0,es,maxIter)
 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  %Function file: myNR_ggrable.m
  %
  %Purpose:
  %   To determine root of function associated with myfunc using the
  %   Newton-Raphson method
  %
  %Record of revisions (Date | Programmer | Change):
  %   2/13/2016    | Graham Grable | Adapted from ElC
  %
  %Main Variables:
  %INPUTS:
  %   myfuncHW10     - function handle for [fx,dfx]=myfunc(x)
%OUTPUTS:
% xr
% fxr
% ea
%- (1x1) estimate of the root
%- (1x1) value of function at xr
%- (1x1) approx. percentage relative error at xr
%(1x1) initial estimate of root
%(1x1) specified error tolerance in % (i.e. es=5 implies
% x0-
% es- %
%   maxIter    - (1x1) maximum number of iterations that can be performed
%
%error tolerance of 5%)
%   numIter- (1x1) number of iterations required to obtain xr
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%basic checks on inputs
assert(length(x0)==1,'x0 should be a single value'); assert((es>0)&&(es<100),'es should be between (0,100)'); assert(maxIter>1,'maxIter should be >1');
%initialize the outputs
xr=0;
fxr=0;
ea=100;
numIter=0;
xr=x0;
[fxr,dfxr]=myfuncHW10(xr);
assert(dfxr~=0,'Function should not have zero derivative');
while (ea>=es)&&(numIter<maxIter)
assert(dfxr~=0,'Function should not have zero derivative');
    xrPrev=xr;
    xr=xr-fxr./dfxr;
    [fxr,dfxr]=myfuncHW10(xr);
    ea=abs((xr-xrPrev)./xr).*100;
    numIter=numIter+1;
end;