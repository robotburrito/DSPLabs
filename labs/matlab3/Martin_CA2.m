clear; clf;

phone_file = 'phone.wav';
[phone_sound, Fs] = wavread(phone_file);
Fs = Fs(1);

%Get the length of the file in seconds.
length_in_seconds = size(phone_sound)/Fs;

%Split the phone_sound into parts for each button pressed.
digit1 = phone_sound(1:1*Fs);
digit2 = phone_sound(1.5*Fs:2.5*Fs);
digit3 = phone_sound(2.6*Fs:3.6*Fs);
digit4 = phone_sound(3.7*Fs:4.4*Fs);
digit5 = phone_sound(4.5*Fs:5.2*Fs);
digit6 = phone_sound(5.7*Fs:6.6*Fs);
digit7 = phone_sound(6.7*Fs:7.4*Fs);
digit8 = phone_sound(7.5*Fs:7.8*Fs);
digit9 = phone_sound(7.9*Fs:8.6*Fs);
digit10 = phone_sound(8.9*Fs:9.5*Fs);

%Use myFFT to get everything into Freq domain.
%Also notice the use of diff() to smooth things out a little bit.
[FFT_digit_1, Freq_of_digit_1] = myFFT(diff(digit1),Fs);
[FFT_digit_2, Freq_of_digit_2] = myFFT(diff(digit2),Fs);
[FFT_digit_3, Freq_of_digit_3] = myFFT(diff(digit3),Fs);
[FFT_digit_4, Freq_of_digit_4] = myFFT(diff(digit4),Fs);
[FFT_digit_5, Freq_of_digit_5] = myFFT(diff(digit5),Fs);
[FFT_digit_6, Freq_of_digit_6] = myFFT(diff(digit6),Fs);
[FFT_digit_7, Freq_of_digit_7] = myFFT(diff(digit7),Fs);
[FFT_digit_8, Freq_of_digit_8] = myFFT(diff(digit8),Fs);
[FFT_digit_9, Freq_of_digit_9] = myFFT(diff(digit9),Fs);
[FFT_digit_10, Freq_of_digit_10] = myFFT(diff(digit10),Fs);

%Plot each number.
hold on;
%{
subplot(4,3,1);
stem(Freq_of_digit_1,abs(FFT_digit_1));
axis([650 1700 -Inf Inf]);
title('Digit 1 = 2');

subplot(4,3,2);
stem(Freq_of_digit_2,abs(FFT_digit_2));
axis([650 1700 -Inf Inf]);
title('Digit 2');

subplot(4,3,3);
stem(Freq_of_digit_3,abs(FFT_digit_3));
axis([650 1700 -Inf Inf]);
title('Digit 3');

subplot(4,3,4);
stem(Freq_of_digit_4,abs(FFT_digit_4));
axis([650 1700 -Inf Inf]);
title('Digit 4');

subplot(4,3,5);
stem(Freq_of_digit_5,abs(FFT_digit_5));
axis([650 1700 -Inf Inf]);
title('Digit 5');

subplot(4,3,6);
stem(Freq_of_digit_6,abs(FFT_digit_6));
axis([650 1700 -Inf Inf]);
title('Digit 6');

subplot(4,3,7);
stem(Freq_of_digit_7,abs(FFT_digit_7));
axis([650 1700 -Inf Inf]);
title('Digit 7');

subplot(4,3,8);
stem(Freq_of_digit_8,abs(FFT_digit_8));
axis([650 1700 -Inf Inf]);
title('Digit 8');

subplot(4,3,9);
stem(Freq_of_digit_9,abs(FFT_digit_9));
axis([650 1700 -Inf Inf]);
title('Digit 9');

subplot(4,3,10);
stem(Freq_of_digit_10,abs(FFT_digit_10));
axis([650 1700 -Inf Inf]);
title('Digit 10');
%}


