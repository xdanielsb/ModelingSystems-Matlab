clc
clear all 
close all 
% circuit parameters
m =20;
k =10;
b= 15;
%outcome parameters
wn = sqrt(k/m)
z = b/(2*wn*m)
K = 1/k
%transfer function
num=[K*wn^2];
den=[1 2*wn*z wn^2];
Gs=tf(num, den)
%outcome LTI for the step function
step(Gs) 
%create another figure
figure(2)
%outcome for the impulso function
impulse(Gs)
