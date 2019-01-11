clear all
M = 1000;
t = (1:M)';
noise = randn(M, 1);
govor = 0.05*randn(M, 1);
govor = govor.*cos(10*pi*t/M).^2; %modulisani govorni signal 
x1 = noise;
noise2 = conv(noise, [3, 2, -1, 0, 1, 1]);
noise2 = noise(1:M);
x2 = noise + govor;
x = x1;
d = x2;
N = 15;
mi = 0.01;
H = zeros(N, 1);
e = zeros(M, 1);
for n = N:M
    X = x(n:-1:n-N+1);
    y = H'*X;
    e(n) = d(n) - y;
    H = H + mi*e(n)*X;
end
t = 1:M;
plot(govor)
figure
plot(t, e, t, govor)