
% del 1, opsta ravenka za diskretna furieva transformacija
% X(k) = suma n=0..N-1 x(n)*e^(-i*(2*pi/N)*k*n)
% k prima od 0 do N-1
% w = 2*pi/N*k - agolna brzina t.e. digitalna agolna frekvencija (rad/primerok)


% del 2 Transformation matrix
% Matrica kade po redovi se dvizi n (brojot na primerok od vleznata niza),
% a po koloi se dvizi agolnata brzina odnosno k
% WN(n,k) = e^(-i*(2*pi/N)*k*n)
% Znaci edna redica od matricata na diskreten furev red pretstavuva
% vektor na eden kompleksen sinusoid so digitalna agolna freq w (vidi pogore),
% odnosno digitalna obicna freq od k/N (1/primerok).
% matircata se dobiva so slednava komanda

pkg load signal
N = 1000;
WN = dftmtx(N);

% matricata od nejzinata desna strana se mnozi so vektor kolona vo koj se naogja signalot
% i se dobiva diskretniot furiev red
% alternativen nacin da se dobie matricata e racno koristejki ja formulata pogore

WN = exp(-i*2*pi/N*([0:N-1]' * [0:N-1]));
% moze da zabelezime deka ovaa matrica e kvadratna zasto i k i n se dvizat od 0 do N-1,
% odnosno rabotime so onolku kompleksni sinusoidi kolku sto ima primeroci vo signalot.
% dopolnitelno matricata e i simetricna, sto znaci nema potreba da pravime transponiranje ako
% sakame da izmnozime so vektor-redica od levo.

%Inverznata furieva transformacija koja signalot od frekventen domen go vrakja vo vremenski
%moze da se napravi so naogjanje inverzna matrica na WN. Se pokazuva deka taa se dobiva
%so samo naogjanje na kompleksno konjugiranje na sekoj element vo nea i delenje so N.
%pa
iWN = exp(+i*2*pi/N*([0:N-1]' * [0:N-1]))/N;


