w_r = [11.6, 51.6, 201.6];
w_a = 41.6;
d_r = [0.01, 0.01, 0.01];
d_a = 0.01;
k = 0.1;
P = k*quadraticf(d_a, w_a)/quadraticf(d_r(1), w_r(1))/quadraticf(d_r(2), w_r(2))/quadraticf(d_r(3), w_r(3));

w_r1 = [11.6, 51.6, 201.6];
w_a1 = 41.6;
d_r1 = [0.01, 0.01, 0.01];
d_a1 = 0.01;
k1 = 0.1;
P1 = k1*quadraticf(d_a1, w_a1)/quadraticf(d_r1(1), w_r1(1))/quadraticf(d_r1(2), w_r1(2))/quadraticf(d_r1(3), w_r1(3));

bode(P);
hold on;
grid on;
bode(P1);
hold off;