function M_fix = getM(q0,q1,q2)
%GETM
%    M_FIX = GETM(MASS,Q0,Q1,Q2)

%    This function was generated by the Symbolic Math Toolbox version 7.2.
%    20-Mar-2018 08:44:03
mass = 1;
t2 = cos(q0);
t3 = cos(q1);
t4 = pi.*(1.0./2.0);
t5 = q2+t4;
t6 = sin(q1);
t7 = sin(q0);
t9 = cos(t5);
t10 = sin(t5);
t12 = t2.*t3.*(2.1e1./1.0e2);
t13 = t6.*t7.*1.285879139104721e-17;
t18 = t2.*t3;
t19 = t6.*t7.*6.123233995736766e-17;
t20 = t18-t19;
t21 = t9.*t20.*(4.0./2.5e1);
t22 = t2.*t6;
t23 = t3.*t7.*6.123233995736766e-17;
t24 = t22+t23;
t25 = t10.*t24.*(4.0./2.5e1);
t8 = t12-t13+t21-t25;
t15 = t2.*t6.*1.285879139104721e-17;
t16 = t3.*t7.*(2.1e1./1.0e2);
t26 = t2.*t3.*6.123233995736766e-17;
t27 = t6.*t7;
t28 = t26-t27;
t30 = t2.*t6.*6.123233995736766e-17;
t31 = t3.*t7;
t32 = t30+t31;
t35 = t9.*t32.*(4.0./2.5e1);
t36 = t10.*t28.*(4.0./2.5e1);
t11 = t15+t16+t35+t36;
t14 = t12-t13;
t17 = t15+t16;
t29 = t2.*t3.*1.285879139104721e-17;
t33 = t2.*t6.*(2.1e1./1.0e2);
t34 = t3.*t7.*1.285879139104721e-17;
t37 = t9.*t24.*(4.0./2.5e1);
t38 = t10.*t20.*(4.0./2.5e1);
t39 = t9.*t28.*(4.0./2.5e1);
t44 = t6.*t7.*(2.1e1./1.0e2);
t40 = t29-t44;
t41 = mass.*t14.*t40;
t42 = t33+t34;
t43 = mass.*t17.*t42;
t45 = t33+t34+t37+t38;
t46 = mass.*t11.*t45;
t50 = t10.*t32.*(4.0./2.5e1);
t47 = t29+t39-t44-t50;
t51 = t3.*t9.*(4.0./2.5e1);
t52 = t6.*t10.*(4.0./2.5e1);
t53 = t3.*(2.1e1./1.0e2);
t48 = t51-t52+t53;
t49 = t37+t38;
t54 = mass.*t11.*t49;
t55 = t39-t50;
t56 = mass.*t45.*t49;
t57 = mass.*t47.*t55;
t58 = t51-t52;
t59 = mass.*t48.*t58;
t60 = t56+t57+t59;
M_fix = reshape([mass.*t8.^2+mass.*t11.^2+mass.*t14.^2+mass.*t17.^2,t41+t43+t46+mass.*t8.*t47,t54+mass.*t8.*t55,t41+t43+t46+mass.*t8.*(t29+t39-t6.*t7.*(2.1e1./1.0e2)-t10.*t32.*(4.0./2.5e1)),mass.*t3.^2.*4.41e-2+mass.*t40.^2+mass.*t42.^2+mass.*t45.^2+mass.*t47.^2+mass.*t48.^2,t60,t54+mass.*t8.*(t39-t10.*t32.*(4.0./2.5e1)),t60,mass.*t49.^2+mass.*t55.^2+mass.*t58.^2],[3,3]);
