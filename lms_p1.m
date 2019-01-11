function rez=lms_p1(sig, ssum)

x=ssum;
d=sig;

M=length(x);
N=10;
H=zeros(N,1);
mi=0.5;
mi1=0.3;
e=zeros(1,M);
%y=zeros(1,M);
for i=N:M
    X=x(i+(0:-1:-N+1)).';
    y=H.'*X;
    e(i)=d(i)-y;
    %mi=mi1/(1+X.'*X);
    H=H+mi*e(i)*X;
end
figure(2)
semilogy(abs(e));
rez=e;
H
X.'*X