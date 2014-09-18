%DPS lab 1
%zadaca 1
A = [1 3 2; 2 3 3; 2 2 3]
B = [A, 2* ones(3, 2); zeros(2, 3), ones(2)]
C = [1:7; 2:2:14; 5:5:35]

%zadaca 2
n1 = [0:8]
x1 = [3 5 8 1 2 3 7 8 1]
n2 = n1
x2 = [2 1 0 4 0 5 4 3 3]

prozivod = conv(x1, x2)

%zadaca 3
na = [2:3:35];
xa = 2*na.^2 + 3;
stem(na, xa);

nb = [3:13];
xb = exp(-0.01*nb.^2) + sqrt(nb-2);
stem(nb, xb);

tv = [0:0.001:4];
xv = exp(-tv) .* cos(4*tv-3);
plot(tv, xv);

td = [0:0.01:15];
xd = cos(3*td+2) .* sin(2*td);
plot(td,xd);

%zadaca 4
t = [0:0.01:10];
x1 = cos(t);
x2 = cos(4*t);
subplot(2, 2, 1);
plot(t, x1, 'color', 'red');
legend('cos(t)');
subplot(2, 2, 2);
plot(t, x2, 'color', 'green');
legend('cos(4t)');

t = [0:0.01:10];
x1 = exp(-t);
x2 = sin(2*t);
subplot(2, 2, 3);
plot(t, x1, 'color', 'black');
title('e^-^t');
subplot(2, 2, 4);
plot(t, x2, 'color', 'blue');
title('sin(2t)');