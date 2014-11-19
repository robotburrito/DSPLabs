%Import the sound file.
[x, Fs]=audioread('phrase_noise.wav');

%Visualize the Audio file before filtering.
fvtool(x,Fs);

%Create a loop that tests a lot of different Fp values for the low pass filter.
%Notice freqNormalized(FreqinHz,Sampling Rate) is a function I made to
%convert from Hz to a normalized frequency that the filter functions
%expect.

FpassNormalized = freqNormalized([100 200 300 400 500 600 700 800 900 1000 1100 1200 1300 1400 1500 1600 1700 1800 1900 2000 3000],Fs);

%{
for (i = 1: length(FpassNormalized))
    %Design the low pass filter at each selected Hz.
    filterLowPassSpecifications = fdesign.lowpass('Fp',FpassNormalized(i));
    %Create the low pass filter using specs.
    filterLowPass = design(filterLowPassSpecifications,'ellip');  
    
    %Pass the original sound through the filter.
    x_filterLowPass = filter(filterLowPass,x);
    fprintf('Playing the filter number %d with an Fp at %f \n',i,FpassNormalized(i));
    sound(x_filterLowPass, Fs);
    pause(3);

    
end
%}

%I think that the best sounding filter value was 0.3
%So lets stick with this and construct it and the filtered sound again.

%Design the low pass filter at each selected Hz.
filterLowPassSpecifications = fdesign.lowpass('Fp',FpassNormalized(12));
%Create the low pass filter using specs.
filterLowPass = design(filterLowPassSpecifications,'ellip');  
    
%Pass the original sound through the filter.
x_filterLowPass = filter(filterLowPass,x);
fprintf('Playing the filter number %d with an Fp at %f \n',12,FpassNormalized(12));
sound(x_filterLowPass, Fs);
pause(3);
%Now that we have a value that I like, let us experiment with altering the
%value of Fstop starting at 1200 Hz. I'm not going to hop through as many
%values this time. I'm going to start at 1300 Hz and end at 2000 Hz.
%{
for (i = 13: length(FpassNormalized))
    %Design the low pass filter at each selected Hz.
    filterLowPassSpecifications = fdesign.lowpass('Fp,Fst',FpassNormalized(12),FpassNormalized(i));
    %Create the low pass filter using specs.
    filterLowPass = design(filterLowPassSpecifications,'ellip');  
    
    %Pass the original sound through the filter.
    x_filterLowPass = filter(filterLowPass,x);
    fprintf('Playing the filter number %d with an Fst at %f \n',i,FpassNormalized(i));
    sound(x_filterLowPass, Fs);
    pause(3);
end

%It appears that no value really causes the sound to sound much different.
%Create and play it with the chosen value of 0.4 for Fstop.
%Design the low pass filter at each selected Hz.
filterLowPassSpecifications = fdesign.lowpass('Fp,Fst',FpassNormalized(12),FpassNormalized(13));
%Create the low pass filter using specs.
filterLowPass = design(filterLowPassSpecifications,'ellip');  
    
%Pass the original sound through the filter.
x_filterLowPass = filter(filterLowPass,x);
fprintf('Playing the filter number %d with an Fp at %f and Fst at %f.\n',12,FpassNormalized(12), FpassNormalized(13));
sound(x_filterLowPass, Fs);


%%% Experimenting with Apass
AValues = [0.01 0.0001 0.1 1 10 20 30 40];
for (i = 1: length(AValues))
    %Design the low pass filter at each selected Hz.
    filterLowPassSpecifications = fdesign.lowpass('Fp,Fst,Ap',FpassNormalized(12),FpassNormalized(13),AValues(i));
    %Create the low pass filter using specs.
    filterLowPass = design(filterLowPassSpecifications,'ellip');  
    
    %Pass the original sound through the filter.
    x_filterLowPass = filter(filterLowPass,x);
    fprintf('Playing the filter number %d with an Apass at %f \n',i,AValues(i));
    sound(x_filterLowPass, Fs);
    pause(3);
end

%The best value I found for Apass is 0.0001. If you get higher it becomes
%more echo.
%}

%%%Experiment with altering the Astop.
AValues = [0.01 0.0001 0.1 1 10 20 30 40];
BValues = [10 20 30 40 50 60 100];
for (i = 1: length(BValues))
    %Design the low pass filter at each selected Hz.
    filterLowPassSpecifications = fdesign.lowpass('Fp,Fst,Ap,Ast',FpassNormalized(12),FpassNormalized(13),AValues(2),BValues(i));
    %Create the low pass filter using specs.
    filterLowPass = design(filterLowPassSpecifications,'ellip');  
    
    %Pass the original sound through the filter.
    x_filterLowPass = filter(filterLowPass,x);
    fprintf('Playing the filter number %d with an Apass of %f and a Astop at %f \n',i,AValues(2),BValues(i));
    sound(x_filterLowPass, Fs);
    pause(3);
end