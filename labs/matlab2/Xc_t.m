function [ Xc_output ] = Xc_t( t )
%XC_T Summary of this function goes here
%   Detailed explanation goes here

if(abs(t) <= 1) 
    Xc_output = 1 - abs(t);
end

if(abs(t) > 1)
    Xc_output = 0;
end

end

