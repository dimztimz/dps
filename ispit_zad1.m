%DPS Zad1 Dimitrij Mijoski

n = [-5:94]; %prozorec od -5 do 94. vo drugite tocki signalot e 0
x = 0.5 .^ n;

nh = [0 1 2];
h = [1 -1 1];

subplot(1, 2, 1);
stem(n, x);
title('signal');

[y, matricaBlokovi] = ovrlpsav(x, h, 5);
ny = [n, max(n)+1+nh(1:end-1)];

subplot(1, 2, 2);
stem(ny, y);
title('conv');

%proverka
[nc, c] = conv_m(n, x, nh, h);
if (all(nc == ny) && all(c == y))
  printf ('tocno\n');
end

%matricaBlokovi
matricaBlokovi