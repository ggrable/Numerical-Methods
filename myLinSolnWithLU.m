function [X]=myLinSolnWithLU (A,B) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% %Purpose:
% To determine the solution to AX=B using LU decomposition from
% [L,U]=myLUFact_username(A)
%Main Variables:
%INPUTS:
% A - (n
%columns
% B - (n %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
[m,n]=size(A); %numbers of rows/columns of A
assert(m==n,'A should be a square matrix')
[mB,nB]=size(B) %numbers of rows/columns of B

assert(mB==m,'B should have')
assert(nB==1,'B should be a')
[L,U]=myLUFact(A)
d=zeros(n,1)
d=B
for j=2:n
 for k=1:j-1
     j=j
     k=k
 d(j)=d(j)-L(j,k).*d(k)
 end
end
X=d
X(n)=d(n)./U(n,n)
for j=n-1:-1:1
 for k=n:-1:j+1
     j1=j
     k1=k
 X(j)=X(j)-U(j,k).*X(k)
 end;
 X(j)=X(j)./U(j,j)
end;