%Clean screen, clear varables and close all tabs
clc
clear all
close all
%Initialize parameters
R1=10;
R2=20;
C=10e-6;
K=R2/(R2+R1);
T=R1*R2*C/(R1+R2);
