function [appInteg]= myIntegWithFuncHandle(func,limVec,n)
%Function file: myIntegWithFuncHandle.m
%
%Purpose:
% Calculate approximate integral of function specified in func
% between the lower/upper limits specified in limVec using n
% rectangles
%
%Record of revisions (Date | Programmer | Change):
% 2/8/16 | Graham Grable | Original program
%
%Inputs:
% func - function handle defined as [fx,dfx]=func_name(x) for
% calculating f(x) and f’(x)
% limVec - (1x2) vector containing limits of integral; limVec(1) is
% lower limit and limVec(2) is upper limit.
% n - (1x1) number of rectangles
%
%Outputs:
% appInteg – (1x1) approximate value of integral
x=[limVec(1):(limVec(2)-limVec(1))./n:limVec(2)];
y=func(x);
appInteg=sum(((limVec(2)-limVec(1))./n).*y);
end