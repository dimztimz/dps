%DPS DImitrij Mijoski
%zadaca 3
b = [0, 0.7, 0, -1];
a = [1, -0.7];

[H, w] = freqz(b, a, 200, 'whole');

subplot(2,2,1);
plot(w, abs(H));
title('H Amplitudna karakteristika');

subplot(2,2,2);
plot(w, angle(H));
title('H Fazna karakteristika');


%zadaca 4
n = [0:200]
x = 1 + cos(0.3*pi*n);
subplot(2,2,3);
plot(n, x);
title('vlezen signal')

subplot(2,2,4);
y = filter(b,a,x);
plot(n, y);