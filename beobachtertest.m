clear y
y = zeros(length(xhat.Time), 1);
for i = 1:length(xhat.Time)
y(i) = C*xhat.Data(i, :)';
end
plot(xhat.Time, y)