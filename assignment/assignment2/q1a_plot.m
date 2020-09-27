% Xinyu Ma
% 28652703
clc;clear;close all;
r=-1;
s=1;
x0=rand;
y0=(1-x0)*rand;
z0=1-x0-y0;
h=0.01;
max_T=40;
[x,y,z,t] = RK2_RPS(s,r,x0,y0,z0,h,max_T);
plot(t,x,'b-',t,y,'r-',t,z,'black-')
title('r=-1,s=1')
legend('x','y','z')
xlabel('t')
axis([0 max_T 0 1])