clear;

%Define a time vector.
startTime = -2;
endTime = 2;
t = (startTime:1/10:endTime);

%Get the "center" of our time line so that we can refer to
%the real time location rather than the MATLAB version.
timeCenterFix = find(t==0);


%Let us define our continous signal Xc
Xc_data = t;

%And then populate the data from this function into Xc_data.
for i = 1:numel(t)
    %fprintf('Index:%d Time Value: %d Xc_t Value: %d \n',i, t(i), Xc_t(t(i)));
    
    Xc_data(i) = Xc_t(t(i));
end





