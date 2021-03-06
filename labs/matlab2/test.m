% Illustration of the Sampling Process 
clf; 
t = 0:00005:1; 
f = 13; 
xa = cos(2*pi*f*t); 
subplot(2,1,1) 
plot(t,xa); grid; 
xlabel('Time, msec'); 
ylabel('Amplitude'); 
title('Continuous Time Signal x(at)'); 
axis([0 1 -1.2 1.2]);  
subplot(2,1,2); 
T=0.1; 
N=0:T:1; 
Xs= cos(2*pi*f*N); 
K=0:length(N)-1; 
stem(K,Xs); grid; 
xlabel('Time Index n'); ylabel('Amplitude'); 
title(' discrete time signal x[n]');