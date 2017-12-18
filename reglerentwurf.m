%% Regler
v_h = 10; % 10
d_z = 0.9; % 0.9
w_z = 5.8; % 5.8
w_n = 58; % 58
d_z0 = 1.2; % 1.2
d_n0 = 0.2; % 0.2
w_0 = 126.6; % 126.6
s = tf('s');
H = v_h*quadraticf(d_z, w_z)/s/linearf(w_n)*quadraticf(d_z0, w_0)/quadraticf(d_n0, w_0);

%% Vorfilter
L = H*P;
T = feedback(L, 1);
p_T = pole(T);
n_T = zero(T);
n1 = s-real(n_T(1));
n2 = s-real(n_T(2));
n34 = s^2 - 2*real(n_T(3))*s + real(n_T(3))^2 + imag(n_T(3))^2;
n56 = s^2 - 2*real(n_T(5))*s + real(n_T(5))^2 + imag(n_T(5))^2;
p12 = s^2 - 2*real(p_T(1))*s + real(p_T(1))^2 + imag(p_T(1))^2;
p34 = s^2 - 2*real(p_T(3))*s + real(p_T(3))^2 + imag(p_T(3))^2;
p5 = s-real(p_T(5));
F = p12*p34*p5/n1/n2/n34/n56;
v_f = 1/evalfr(F, 0);
F = v_f*F;
G = F*T;

%% Plots
L1 = H*P1;
T1 = feedback(L1, 1);
G1 = F*T1;
figure(1);
nichols(L1);
grid on;
figure(2);
step(G1);
grid on;
figure(3);
step(feedback(P1, H));
grid on;
stepinfo(G1)