%Clear
clc
clear all
close all
%initialize parameters
R1=10; %Resistencia de 10 ohms
R2=30; %Resistencia de 30 ohms
C=10e-6; %Condensador de 10 micro faradios
%Parameters for the transfer function
T=(R1*R2*C)/(R1+R2)
K =R2/(R1+R2)
%Hallar valores



