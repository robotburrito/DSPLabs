%Vincent Martin
%DSP MATLAB Assignment #1.


%%%% Part 1.
% y[n] = ay[n-1] + x[n]
% Set a to a value.
a = 2;

%Set a range for n.
n = -10:10;


%Define H
H = zeros(size(n));

%Fill up Y with zeros.
Y = zeros(size(n));

%Create H
for i1 = -10:10
    H(i1 + 11) = (a^i1)*(i1>=0);
end


%Create X
for i2 = -10:10
   X(i2 + 11) = (i2>=0);
end

%Create Y with Y[n]= aY[n-1] + x[n]
for n_index = -10:10

    %If n_index == 1 then we run into a problem where Y(n-1) = 0 that
    %causes us some problems. So we have to make some assumptions. Let's
    %assume that Y(1-1) == 0 as an initial condition.
    
    if(n_index == 1)
        Y(n_index + 11) = a*0 + X(n_index);
    end
    
    if(n_index > 1)
        Y(n_index + 11) = a*Y(n_index-1) + X(n_index);
    end
    
       
end


%Plotting Part 1.
%Plot H
subplot(4,1,1);
stem(n,H);
title('Impulse Response for y[n] = ay[n-1] + x[n]');
xlabel('n');
ylabel('H[n]');

%Plot X
subplot(4,1,2);
stem(n,X);
title('X[n]');
xlabel('n');
ylabel('X[n]');

%Plot Y
subplot(4,1,3);
stem(n,H);
title('Y[n]');
xlabel('n');
ylabel('Y[n]');

%%% Part 2. Convolution.

%Fill up Y with zeros.
Yconv = zeros(size(n));

%Flip X 
for m = 1:20
    X(m) = (m<=11);
end


Yconv(21) = H(21) * X(21);

for indexa = 1:22

    if(21-indexa == 0)
        Yconv(indexa) = H(indexa) * 0;
    end
    
    if(21-indexa > 0)
        Yconv(indexa) = H(indexa) * X(22 - indexa);
        %fprintf('Indexa: %f H: %f X: %f \n', indexa, H(indexa), X(22-indexa));
    end
    
    if(indexa == 21)
        Yconv(indexa) = H(indexa) * X(22 - indexa);
        %fprintf('Indexa: %f H: %f X: %f \n', indexa, H(indexa), X(22-indexa));
    end

end



%Plot Yconv
subplot(4,1,4);
stem(n,Yconv);
title('Yconv[n]');
xlabel('n');
ylabel('Yconv[n]');