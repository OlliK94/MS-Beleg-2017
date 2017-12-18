u = noise_in.Data';
y = noise_out.Data';
L = length(noise_in.Time);
NFFT = 2^nextpow2(L);

r_uu = xcorr(u);
r_uy = xcorr(u, y);

Ts = noise_in.Time(2);
fs = 1/Ts;

S_uu = fft(r_uu, NFFT)/L;
S_uy = fft(r_uy, NFFT)/L;

G = S_uy./S_uu;
G = 2*abs(G(1:NFFT/2+1));
f = fs/2*linspace(0, 1, NFFT/2+1);
w = 2*pi*f;

plot(w, 20*log10(G));