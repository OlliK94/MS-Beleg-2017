%% Systemmatrizen
[A, B, C, D] = tf2ss(P.num{1}, P.den{1});
Qs = ctrb(A, B);
Qb = obsv(A, C);

%% Zustandsbeobachter
p_b = [-10+100j, -10-100j, -20+200j, -20-200j, -30+300j, -30-300j];
L = place(A', C', p_b)';

%% Zustandsregler
p_r = [-10+10j, -10-10j, -20+20j, -20-20j, -30+30j, -30-30j];
R = place(A, B, p_r);

%% Vorfilter
W = -inv(C*inv(A-B*R)*B);