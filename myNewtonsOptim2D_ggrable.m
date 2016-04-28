function [xVec,fxy,gradF,H,eaVec,numIter]=myNewtonsOptim2D_ggrable(myfunc,x0Vec,es,
maxIter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function file: myNewtonsOptim2D_sidsavad.m
%
%Purpose:
% To determine the optimum value of function f(x,y) associated with myfunc
% using Newton's method
%
%Record of revisions (Date | Programmer | Change):
% 03/23/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% myfunc - function handle for [fxy,dfx,dfy,d2fx2,d2fy2,d2fxy2]=myfunc(xVec)
% x0Vec - (2x1) initial estimate of optimum [x0;y0]
% es - (1x1) specified error tolerance in % (i.e. es=5 implies
% error tolerance of 5%)
% maxIter - (1x1) maximum number of iterations that can be performed
%
%OUTPUTS:
%
% xVec - (2x1) estimate of the optimum
% fxy - (1x1) value of function at xVec
% gradF - (2x1) gradient of function at xVec
% H - (2x2) Hessian of function at xVec
% eaVec - (2x1) approx. percentage relative error at xVec
% numIter- (1x1) number of iterations required to obtain xVec
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%basic checks on inputs
 assert(length(x0Vec)==2,'x0Vec should have 2 values');
 assert((es>0)&&(es<100),'es should be between (0,100)');
 assert(maxIter>1,'maxIter should be >1');
%initialize the outputs
 xVec=[0;0];
 fxy=0;
 gradF=[0;0];
 H=zeros(2,2);
 eaVec=[100;100];
 numIter=0;
 xVec=x0Vec;
 [fxy,dfx,dfy,d2fx2,d2fy2,d2fxy2]=myfunc(xVec);
 gradF=[dfx;dfy];
 H=[d2fx2 d2fxy2;d2fxy2 d2fy2];
 assert(det(H)~=0,'Hessian should have non-zero determiannt to be invertible');

while (max(eaVec)>=es)&&(numIter<maxIter)
 assert(det(H)~=0,'Hessian should have non-zero determiannt to be invertible');
 xVecPrev=xVec;
 xVec=xVec-H\gradF;
 [fxy,dfx,dfy,d2fx2,d2fy2,d2fxy2]=myfunc(xVec);
 gradF=[dfx;dfy];
 H=[d2fx2 d2fxy2;d2fxy2 d2fy2];
 eaVec=abs((xVec-xVecPrev)./xVec).*100;
 numIter=numIter+1;

end;