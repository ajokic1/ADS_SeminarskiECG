%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lmsalgo : NLMS algorithm demo
% Author : Tamer abdelazim Mellik
% Contact information : 
%Department of Electrical & Computer Engineering,
%University of Calgary,
%2500 University Drive N.W. ,
%Calgary, AB T2N 1N4 ,
%Canada .
% email :abdelasi@enel.ucalgary.ca  
% email : tabdelaz@ucalgary.ca
% Webpage : http://www.enel.ucalgary.ca/~abdelasi/
% Date    : 25-2-2001
% Version : 1.0.0
% Reference : S. Haykin, Adaptive Filter Theory. 3rd edition, Upper Saddle River, NJ: Prentice-Hall, 1996. 
% Note : The author doesn't take any responsibility for any harm caused by the use of this file
clear all
close all
hold off
%channel system order
sysorder = 5 ;
% Number of system points
N=2000;
load('C:\Users\kokik\Documents\ADS\Seminarski EKG\MLII\1 NSR\100m (0).mat')
inp=val(1:N).';
% inp = randn(N,1);
n = 1000*randn(N,1);
[b,a] = butter(2,0.25);
Gz = tf(b,a,-1);
%This function is submitted to make inverse Z-transform (Matlab central file exchange)
%The first sysorder weight value
%h=ldiv(b,a,sysorder)';  %download and uncomment to get h matrix
% if you use ldiv this will give h :filter weights to be
h=  [0.0976;
    0.2873;
    0.3360;
    0.2210;
    0.0964;];
y = lsim(Gz,inp);
%add some noise
n = n * std(y)/(10*std(n));
d = y + n;
totallength=size(d,1);
%Take 60 points for training
N=60 ;	
%begin of algorithm
w = zeros ( sysorder  , 1 ) ;
for n = sysorder : N 
	u = inp(n:-1:n-sysorder+1) ;
    y(n)= w' * u;
    e(n) = d(n) - y(n) ;
% Start with big mu for speeding the convergence then slow down to reach the correct weights
%      if n < 20
%          mu=2;
%      else
%          mu=0.5;
%      end
% Use adaptive step to reach the solution faster mu = 0.95 * 2/M*r(0)
    mu=0.95*2/(5*(0.001+var(u)));
% alpha = 0.01     
	w = w + mu/(0.001+u'*u ) * u * e(n) ;
end 
%check of results
for n =  N+1 : totallength
	u = inp(n:-1:n-sysorder+1) ;
    y(n) = w' * u ;
    e(n) = d(n) - y(n) ;
end 
hold on
plot(d)
plot(y,'r');
title('System output') ;
xlabel('Samples')
ylabel('True and estimated output')
figure
semilogy((abs(e))) ;
title('Error curve') ;
xlabel('Samples')
ylabel('Error value')
figure
plot(h, 'k+')
hold on
plot(w, 'r*')
legend('Actual weights','Estimated weights')
title('Comparison of the actual weights and the estimated weights') ;
axis([0 6 -0.5 0.5]);