%Vincent Martin
%DSP MATLAB Assignment #1.


%%%% Part 1.
% y[n] = ay[n-1] + x[n]
% Set a to a value.
a = 2;

% Put into the form y[n] - ay[n-1] = x[n] so that we can figure out the
% co-efficient arrays.
A = [1, -a];
B = [1];

%Set a range for n.
n = [-50:50];

%Get the impulse response from the system and store in h1.
h1 = impz(B,A,n);

%Heaviside
x1 = heaviside(n);
x1(x1==0.5) = 0;

%Output Y
y1 = filter(B,A,x1)


%Plot h1
subplot(3,1,1);
stem(n,h1);
title('Impulse Response for y[n] = ay[n-1] + x[n]');
xlabel('n');
ylabel('h[n]');

%Plot x1
subplot(3,1,2);
stem(n,x1);
title('x[n]');
xlabel('n');
ylabel('x[n]');

%Plot y1
subplot(3,1,3);
stem(n,y1)
title('y[n]');
xlabel('n');
ylabel('y[n]');

%%%% Part 2.
