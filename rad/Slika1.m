% Program kreira sliku 1 u eps formatu
x=-3:0.1:3;
f=sqrt(pi)/2*erf(x);
figure(1)
% grafik sirine 7cm i visine 4cm
SetFigureDefaults(7,4)
plot(x,f)
xlabel('x')
ylabel('f(x)')
grid
print Slika1 -depsc2
!epstopdf Slika1.eps