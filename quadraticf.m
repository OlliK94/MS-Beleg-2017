function sys = quadraticf(d, w)

sys = tf([1/w^2, 2*d/w, 1], 1);

end

