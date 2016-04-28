function [appDerv,exDerv,et]= myDervWithFuncHandle(func,x,h)
%Function file: myDervWithFuncHandle.m
%
%Purpose:
% Calculate approximate derivative using (f(x+h)-f(x))/h, exact
% derivative f’(x) and true percentage relative error of a function
% specified in func
%
%Record of revisions (Date | Programmer | Change):
% 2/8/16 | Graham Grable | Original program
%
%Inputs:
% func - function handle defined as [fx,dfx]=func_name(x) for
% calculating f(x) and f’(x)
% x - (1x1) value of x where derivative needs to be calculated
% h - (1x1) step size used in approximate derivative formula
%
%Outputs:
% appDerv – (1x1) approximate derivative calculated as (f(x+h)-f(x))/h
% exDerv – (1x1) exact derivative
% et – (1x1) true percentage relative error
[fx,dfx]=func(x);
fx1=func(x+h);
appDerv=(fx1-fx)/h;
exDerv=dfx;
et=abs((exDerv-appDerv)/exDerv)*100;
end