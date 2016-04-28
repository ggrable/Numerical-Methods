function [xr,fxr,ea,numIter]=myBisection_ggrable(myfunc,x0,es,maxIter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function file: myBisection_username.m
%
%Purpose:
% To determine root of function associated with myfunc using the
% Bisection method
%
%Record of revisions (Date | Programmer | Change):
% 2/9/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% myfunc - function handle for [fx]=myfunc(x)
% x0 - (1x2) initial bracket [xL,xU]
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
xL=x0(1);
xU=x0(2);
n=0;
fxL=myfunc(xL);
fxU=myfunc(xU);
xr=0;xrprev=0;
ea=es+1;
    while ea > es && n < maxIter
        xr=(xL+xU)/2;
        fxr=myfunc(xr);
        
            if  fxL*fxr < 0
                xU = xr;
            
            elseif fxU*fxr < 0
                   xL = xr;
                  
            else
                    xprev=xr;
    
            end
            
      n=n+1;
      ea=abs((xr-xrprev)/xr)*100;
      xrprev=xr;
    end
    
fxr=myfunc(xr);
numIter=n;
end