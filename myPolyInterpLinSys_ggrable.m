function [coeffVec]= myPolyInterpLinSys_ggrable(xi,yi)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Function file: myPolyInterpLinSys_Username.m
%
%Purpose:
% To obtain the coefficients of an interpolating polynomial for given data % using a linear system
%
%Record of revisions (Date | Programmer | Change):
% Date | Name | Original program %
%Main Variables:
%INPUTS:
% xi - (nx1) vector of given x values % yi - (nx1) vector of given y values %
%OUTPUTS:
 
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
n=length(xi);
assert(length(yi)==n,'xi and yi should be of the same length'); 
assert(length(xi(1,:))==1,'xi should be a column vector'); 
assert(length(yi(1,:))==1,'yi should be a column vector');
a=1; g=1;
A=eye(n,n);
while a <= n
   A(a,1)=1
   while g <= n-1
      A(a,g+1)=xi(a)^g
      
      g=g+1;
   end
    
    a = a+1;
    g=1;
end
coeffVec = linsolve(A,yi);
end

                     