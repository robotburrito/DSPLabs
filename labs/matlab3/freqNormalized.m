function [ normalizedFrequency ] = freqNormalized( frequencyInHz, Fs )
%FREQNORMALIZED Converts frequency to normalized frequency.
%   Converts frequency to the normalized frequnecy.
   
normalizedFrequency = (frequencyInHz)/(Fs/2);


end

