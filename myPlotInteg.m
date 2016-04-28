function []= myPlotInteg(func,limVec)
%Function file: myPlotInteg.m
%
%Purpose:
% Plot approximate percentage relative error vs. number of rectangles
% used to calculate the approximate integral between the lower/upper
% limits specified in limVec for 11, 12, 13, … 100 rectangles.
% [appInteg]= myIntegWithFuncHandle(func,limVec,n)is used to calculate
% the approximate integral using n rectangles.
%
%Record of revisions (Date | Programmer | Change):
% 2/8/16 | Graham Grable | Original program
%
%Inputs:
% func - function handle defined as [fx,dfx]=func_name(x) for
% calculating f(x) and f’(x)
% limVec - (1x2) vector containing limits of integral; limVec(1) is
% lower limit and limVec(2) is upper limit.
%
%Outputs:
% NONE
for n = 11:100
    appInteg(10)=.3279;
    appInteg(n)=myIntegWithFuncHandle(func,limVec,n);
    ea(n)=abs((appInteg(n)-appInteg(n-1))/appInteg(n))*100;
    plot(ea);
end