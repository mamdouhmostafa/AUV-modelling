m= 32.5;
g= 9.81;
V = 0.03255;
rho = 1000;
Samp_Time=0.01;
Sim_Time=50;
z_ww= 260;
time= linspace(0,Sim_Time,(Sim_Time/Samp_Time)+1);
z= zeros(1, (Sim_Time/Samp_Time)+1);
z_dot = zeros(1,(Sim_Time/Samp_Time)+1);

for i= 1:Sim_Time/Samp_Time
    z_ddot= (m*g -rho * V * g- z_ww * z_dot(i)* abs(z_dot(i)))/m;
    z_dot(i+1)= z_dot(i) + Samp_Time * z_ddot;
    z(i+1)= z(i) + Samp_Time * z_dot(i);
end 

plot(time,-z);

