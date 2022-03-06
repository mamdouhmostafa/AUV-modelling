m=32.5;
rho=1000;
V=0.03255;
g=9.81;
zww=260;

kp=0.04668;
ki=0.47958;
kd=-0.19714;

Samp_Time = 10^-2;
Sim_Time = 50;
Time = linspace(0,Sim_Time, (Sim_Time/Samp_Time)+1);
z = zeros(1,(Sim_Time/Samp_Time)+1);
z_dot = zeros(1,(Sim_Time/Samp_Time)+1);

for i=1:Sim_Time/Samp_Time
    error =  5 - z(i);
    ft = PID_f(kp,ki,kd,error,Samp_Time);
    z_ddot = (m*g  - rho*V*g - zww*z_dot(i)*abs(z_dot(i))- ft)/m;
    z_dot(i+1)= z_dot(i) + Samp_Time*z_ddot;
    z(i+1)= z(i) + Samp_Time*z_dot(i);
end
plot(Time,z);