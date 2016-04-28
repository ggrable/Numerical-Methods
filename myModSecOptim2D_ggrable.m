function [xVec,fxy,gradF,H,eaVec,numIter]= myModSecOptim2D_ggrable(myfunc,x0Vec,es,maxIter)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Function file: myModSecOptim2D_username.m
%
%Purpose:
% To determine the optimum value of function f(x,y) associated with myfunc
% using Modified Secant method
%
%Record of revisions (Date | Programmer | Change):
% 3/23/2016 | Graham Grable | Original program
%
%Main Variables:
%INPUTS:
% myfunc - function handle for [fxy]=myfunc(x,y)
% x0Vec - (2x2) initial value of x,y and values of deltaX,deltaY.
% x0Vec(1,1) will be initial value of x
% x0Vec(1,2) will be deltaX
% x0Vec(2,1) will be initial value of y
% x0Vec(2,2) will be deltaY
% es - (1x1) specified error tolerance in % (i.e. es=5 implies
% error tolerance of 5%)
% maxIter - (1x1) maximum number of iterations that can be performed
%
%OUTPUTS:
% xVec - (2x1) estimate of the optimum
% fxy - (1x1) value of function at xVec
% gradF - (2x1) gradient of function at xVec
% H - (2x2) Hessian of function at xVec
% eaVec - (2x1) approx. percentage relative error at xVec
% numIter- (1x1) number of iterations required to obtain xVec
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%basic checks on inputs
assert(length(x0Vec(1,:))==2 && length(x0Vec(:,1))==2,...
'x0Vec should have initial value of x,y AND deltaX,deltaY');
assert((es>0)&&(es<100),'es should be between (0,100)');
assert(maxIter>1,'maxIter should be >1');
ea=100;
numIter=0;
eaVec=[100;100];
xVec=[0;0];
while ea > es && numIter < maxIter
   dfdx=(myfunc((x0Vec(1,1)+x0Vec(1,2)),x0Vec(2,1))-myfunc((x0Vec(1,1)-x0Vec(1,2)),x0Vec(2,1)))/(2*x0Vec(1,2));
   dfdy=(myfunc(x0Vec(1,1),(x0Vec(2,1)+x0Vec(2,2)))-myfunc(x0Vec(1,1),(x0Vec(2,1)-x0Vec(2,2))))/(2*x0Vec(2,2));
   d2fdx2=(myfunc((x0Vec(1,1)+x0Vec(1,2)),x0Vec(2,1))-(2*myfunc(x0Vec(1,1),x0Vec(2,1)))+myfunc((x0Vec(1,1)-x0Vec(1,2)),x0Vec(2,1)))/(x0Vec(1,2)^2);
   d2fdy2=(myfunc(x0Vec(1,1),(x0Vec(2,1)+x0Vec(2,2)))-(2*myfunc(x0Vec(1,1),x0Vec(2,1)))+myfunc(x0Vec(1,1),(x0Vec(2,1)-x0Vec(2,2))))/(x0Vec(2,2)^2);
   d2fdxdy=(myfunc((x0Vec(1,1)+x0Vec(1,2)),(x0Vec(2,1)+x0Vec(2,2)))-myfunc((x0Vec(1,1)+x0Vec(1,2)),(x0Vec(2,1)-x0Vec(2,2)))-myfunc((x0Vec(1,1)-x0Vec(1,2)),(x0Vec(2,1)+x0Vec(2,2)))+myfunc((x0Vec(1,1)-x0Vec(1,2)),(x0Vec(2,1)-x0Vec(2,2))))/(4*x0Vec(2,1)*x0Vec(2,2));
   H=[d2fdx2,d2fdxdy;d2fdxdy,d2fdy2];
   gradF=[dfdx;dfdy];
   xVec=[x0Vec(1,1),x0Vec(2,1)]-gradF\H;
   eaVec(1)=abs((xVec(1)-x0Vec(1,1))/xVec(1))*100;
   eaVec(2)=abs((xVec(2)-x0Vec(2,1))/xVec(2))*100;
   if eaVec(1) < es && eaVec(2) < es
      if eaVec(1) < eaVec(2)
          ea=eaVec(2);
      else
          ea=eaVec(1);
      end  
   elseif eaVec(1) < eaVec(2) 
          ea=eaVec(2);
   else
          ea=eaVec(1);
       end
   fxy=myfunc(xVec(1),xVec(2));
   x0Vec(1,1)=xVec(1);
   x0Vec(2,1)=xVec(2);    
    numIter=numIter+1;
end

end