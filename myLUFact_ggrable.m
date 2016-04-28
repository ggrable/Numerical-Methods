function [L,U]=myLUFact_ggrable(A)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Function file: myLUFact_username.m
%
%Purpose:
% To determine the L and U factors of matrix A using LU decomposition % (using Gauss Elimination without partial pivoting)
%
%Record of revisions (Date | Programmer | Change):
% 3/14/2016 | Graham Grable | Original program %
%Main Variables:
%INPUTS:
% A - (n x n) square matrix with n rows and n columns %
%OUTPUTS:
%
%
%
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% L - (n x n) lower traingular matrix with 1s on principal diagonal such that L*U==A
% U - (n x n) upper triangular matrix obtained from performing forward elimination on A

[m,n]=size(A); %numbers of rows/columns of A assert(m==n,'A should be a square matrix');
assert(m==n);
U=A;
for t=1:n-1
   
    U(t+1:n,t) = U(t+1:n,t)/U(t,t);
   
    U(t+1:n,t+1:n) = U(t+1:n,t+1:n) - U(t+1:n,t)*U(t,t+1:n);
   
end
I=eye(n,n);
L = I + tril(U,-1);
U = triu(U);
