function FK = FK(q0,q1,q2)
%FK
%    FK = FK(Q0,Q1,Q2)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    21-Mar-2018 14:25:05

t2 = pi.*(1.0./2.0);
t3 = q0+t2;
t4 = cos(q1);
t5 = cos(t3);
t6 = sin(t3);
t7 = sin(q1);
t8 = sqrt(2.0);
t9 = cos(q2);
t10 = t8.*(1.0./2.0);
t13 = t5.*t8.*3.061616997868383e-17;
t11 = t10-t13;
t12 = sin(q2);
t14 = t10+t13;
t15 = t8.*(3.0./4.0e1);
t16 = t6.*t7.*t8.*(1.0./2.0);
t17 = t4.*t6.*t8.*(2.1e1./2.0e2);
FK = [t4.*t5.*(2.1e1./1.0e2)-t6.*t7.*1.285879139104721e-17+t9.*(t4.*t5-t6.*t7.*6.123233995736766e-17).*(4.0./2.5e1)-t12.*(t4.*t6.*6.123233995736766e-17+t5.*t7).*(4.0./2.5e1);t15+t17-t9.*(t7.*t11-t4.*t6.*t8.*(1.0./2.0)).*(4.0./2.5e1)-t7.*t11.*(2.1e1./1.0e2)-t12.*(t16+t4.*t11).*(4.0./2.5e1);t15-t17-t9.*(t7.*t14+t4.*t6.*t8.*(1.0./2.0)).*(4.0./2.5e1)-t7.*t14.*(2.1e1./1.0e2)+t12.*(t16-t4.*t14).*(4.0./2.5e1)+7.0./1.0e2];
