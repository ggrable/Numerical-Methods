function [L,U]=myLUFact (A) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Purpose:
% To determine the L and U factors of matrix A using LU decomposition
% (using Gauss Elimination without partial pivoting)
%Main Variables:
%INPUTS:
% A - (n x n) square matrix with n rows & n columns
%OUTPUTS:
% L - (n x n) lower traingular matrix with 1s on
% principal diagonal such %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[m,n]=size(A) %numbers of rows/columns of A 

assert(m==n,'A should be a square matrix') 
U=A
L=eye(n) % initialize L to an identity matrix 
for pRow=1:n-1 %pRow represents pivot row
assert(U(pRow,pRow)~=0,'pivot element cannot be zero')
for k=pRow+1:n
    k=k
    pRow=pRow
mult=U(k,pRow)./U(pRow,pRow) %multiple for row operations 
U(k,:)=U(k,:)-mult.*U(pRow,:)
 L(k,pRow)=mult
end 
end
