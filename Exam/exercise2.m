clc
clear all
close all
%parametros
L = 50e-6
R = 50
C = 7e-6
q = 10e-18
c1 = 5
c2 = 10
E = 30
u0= 80
qp = q*q/c2 + q/c1

%transfer funtion
num=[1/(R*C*L)];
den=[1 1 (1/(R*C) + 2*qp*C)];