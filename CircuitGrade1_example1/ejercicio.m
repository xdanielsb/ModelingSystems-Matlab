%Initialize the workspace
clc
clear all
close all
% Initialize the parameters
R =10; %10 ohmnios
C=10e-6; %10 micro faradios
v0=.1; % .1 voltio
%Equations
T =R*C %time constant tao
q0 = v0*C; %Initial load 