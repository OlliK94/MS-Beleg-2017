%% Systemmatrizen
[A, B, C, D] = tf2ss(P.num{1}, P.den{1});
Qs = ctrb(A, B);
Qb = obsv(A, C);

%% Zustandsbeobachter
p_b = [-10+100j, -10-100j, -20+200j, -20-200j, -30+300j, -30-300j];
L = acker(A', C', p_b)';

%% Zustandsregler
Ai = [A, zeros(size(B)); -C, 0];
Bi = [B; 0];
Ci = [C, 0];
%p_r = [-10+10j, -10-10j, -20+20j, -20-20j, -30+30j, -30-30j];
%K = acker(A, B, p_r);
p_i = [-10, -10+1j, -10-1j, -15+2j, -15-2j, -20+3j, -20-3j];
R = acker(Ai, Bi, p_i);
Ki = -R(end);
Kp = -inv(C*inv(A)*B);
K = R(1:end-1);
%K = Ki - Kp*C;