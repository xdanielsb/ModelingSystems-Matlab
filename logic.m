%Define the original transfer function
nums = [1.6];
dens = [1 3 2];
Gs = tf(nums,dens)
step(Gs)
grid on

%Define the desire transfer function
numd = [32.6];
dend = [1 8 32.6];
Gd = tf(numd, dend)
hold on
step(Gd)

%Calc the transfer function
%based on the dominant pole 
dominant_pole =-5*max(real(roots(dend)));
Gnd = tf([dominant_pole],[1 dominant_pole])


%Now the multiplication of the transfer 
%functions for could compare among the functions
Gd3 = series(Gd, Gnd)


%Create another figure
figure(2)
step(Gd)
grid on 
hold on
step(Gd3)

%Now the values of the PID
Kd = 25/1.6;
Kp = 190.6/1.6;
Ki = 652/1.6;

Cs = tf([Kd Kp Ki], [1 0])

%Now get the desire function
Glc = feedback(series(Gs, Cs), 1)
step(Glc)









