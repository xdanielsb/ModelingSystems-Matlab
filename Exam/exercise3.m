% PID 
% Daniel Santos
% 2016

%Create the transfer function 
%define the poles
polo1 = -2 -2i;
polo2 = -2 +2i;
polos = [polo1 polo2];

%define the zeros 
zeros = [];

%define the gain
gain = 0.7;

%   gain, zeros, poles 
[num,den] = zp2tf(zeros,polos,gain);

%Obtain the parameter of aaa second grade ecuation

%Natural frecuency
Wn = sqrt(den(3)) 
%Damping constant 
zeta = den(2)/(Wn * 2)

%den(3) is Wn squared
num_G_s = [gain * den(3)];
den_G_s = den;
G_s = tf(num, den)


%Create the desired function
%underscore _d means desired

%parameters for the desired transfer function
zeta_d = 1;
Ws_d = 0.5;
tao_d = 1 /(zeta_d * Ws_d);
gain_d = 1;


num = [gain_d*(Ws_d^2)];
den = [1 2*Ws_d*zeta_d Ws_d^2];
%define the desired transfer function based on the parameters
Gs_d = tf(num, den);



%Now find the result of Y(s)/G(s)
%G_lc = Y(s)/G(s) =  ( C(s) * G(s) )/ (1 + C(s) * G(s))



%add the pole to the function
a = 2.5;
G_p = tf([a], [1 a]);
G_result  = Gs_d  * G_p;

[num,den] = tfdata(G_result);

coef_s2 = den{1}(2);
coef_s = den{1}(3);
coef_cons = den{1}(4);

coef_s2_lc = den_G_s(2);
coef_s_lc = den_G_s(3);

kd = ( coef_s2 - coef_s2_lc) /(num_G_s)
kp = ( coef_s - coef_s_lc) /(num_G_s)
ki = ( coef_cons) /(num_G_s)
