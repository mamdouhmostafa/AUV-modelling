function force = PID_f(kp,ki,kd,E,Tc)

E_int = 0;
E_old = 0;

%proportional term
    f_p = kp * E;

%derivative term
    f_d = ((E-E_old)/Tc)*kd;
    E_old = E;

%integral term
    int = E*Tc;
    E_int= E_int+int;
    f_i = E_int*ki;

%calculation and restriction of total output
    f_tot = f_p+f_d+f_i;
    force = f_tot;

end 

