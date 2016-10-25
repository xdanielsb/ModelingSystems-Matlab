clc
clear all
close all
%parametros
L=9e-3;
R=5;
C=10e-6;

%parametros funcion de transferencia


num = [1 0 1/L*C];
den = [1 1/R*C 1/L*C];

