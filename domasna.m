
% del 1, opsta ravenka za diskretna furieva transformacija
% X(k) = suma n=0..N-1 x(n)*e^(-i*(2*pi/N)*k*n)
% k prima od 0 do N-1
% w = 2*pi/N*k - agolna brzina t.e. digitalna agolna frekvencija (rad/primerok)


% del 1.1 Transformation matrix
% Matrica kade po redovi se dvizi n (brojot na primerok od vleznata niza),
% a po koloi se dvizi agolnata brzina odnosno k
% WN(n,k) = e^(-i*(2*pi/N)*k*n)
% Znaci edna redica od matricata na diskreten furev red pretstavuva
% vektor na eden kompleksen sinusoid so digitalna agolna freq w (vidi pogore),
% odnosno digitalna obicna freq od k/N (1/primerok).
% matircata se dobiva so slednava komanda

pkg load signal;
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


% del 1.2 Magnitude and phase
% ovde testirame diskretna furieva transformacija na edinecen skok
% da zabelezime deka skokot trae od pocetokot do polovinata
% vsusnost ovde imame kvadraten signal kade skokot e prvata polovinata
% toa sto skokot trae tocno 1 polovina od signalot podocna se manifestia
% so golemi numercki greski vo fazata
pkg load signal;
x = [ones(1,64) zeros(1,64)]; %edinecen skok
figure;
stem(x);
N = 128;
W128 = dftmtx(N);
X = x * W128;

%magnituda
stem(abs(X)); 
stem((1:N)/N,abs(X)); 
plot((1:N)/N,abs(X));

%faza so numericki greski vo neparnite primeroci
stem((1:N)/N,angle(X));
stem((1:N)/N*2*pi,angle(X));

%inverzna
xx = real(X*conj(W128)/N);

%===================================
%del 2 Role of the fourier transform
% 2.1 two birds with a stone

%link do datotekata so eden signal https://github.com/LCAV/DSPNumex/blob/master/NumEx4/frequencyRepresentation.mat
load frequencyRepresentation.mat 
plot(x(1:500)); %go iscrtuvame signalot, prvite 500 prmeroci od vkupno 4000

%so slednive komandi go pustame signalot na kako zvuk
wavwrite(x, 8192, 'zvuk1.wav');
system zvuk1.wav

pkg load signal;
N = length(x);
W4000 = dftmtx(N);
X = x * W4000;
plot((1:N)/N, abs(X));
%zabelezuvame deka signalot se sostoi od tocno dva sinusoidi

%2.2 proekcina na del od sinusoidite
x = [ones(1,64) zeros(1,64)]; %edinecen skok
W128 = dftmtx(128);
X1 = x * W128(:,1);
xx1 = real( X1 * conj(W128(1,:))/128 );

X2 = x * W128(:,1:2);
xx2 = real( X2 * conj(W128(1:2,:))/128 );

X3 = x * W128(:,1:3);
xx3 = real( X3 * conj(W128(1:3,:))/128 );

X4 = x * W128(:,1:4);
xx4 = real( X4 * conj(W128(1:4,:))/128 );

X10 = x * W128(:,1:10);
xx10 = real( X10 * conj(W128(1:10,:))/128 );

plot(xx1, 'color', 'blue');
hold on;
plot(xx2, 'color', 'green');
hold on;
plot(xx3, 'color', 'red');
hold on;
plot(xx4, 'color', 'yellow');
hold on;
plot(xx10, 'color', 'black');
hold on;

% 2.3 three tones
%pravime zvucen signal kade pustame tri tona, ama bez poklopuvanje
%prvo sviri nizok ton, pa pauza, pa sreden ton, pauzia i na kraj visok ton

x1 = sin(2*pi*40*(1:1000)/1000);
x2 = sin(2*pi*80*(1:1000)/1000);
x3 = sin(2*pi*160*(1:1000)/1000);
x = [x1 zeros(1,1000) x2 zeros(1,1000) x3];
wavwrite(x, 8192, 'zvuk2.wav');
system zvuk2.wav;
W5000 = dftmtx(5000);
X = x * W5000;
plot((1:5000)/5000,abs(X));

% sega kje ja reducirame osnovata na furievata, donson kje skratime sinusoidi
W5000reduced = W5000(:, [1:600 4400:5000]);
iW5000reduced = conj(W5000([1:600 4400:5000],:))/5000;

Xapprox = x * W5000reduced; %aproximirana fureiva transformacija
xapprox = real(Xapprox * iW5000reduced); %rekonstrukcija od aproksimiranata transformacija

wavwrite(xapprox, 8192, 'zvuk3.wav');
system zvuk3.wav; %slusame deka fali tretiot ton

% sega pravime normalna furoeva transformacija na rekonstrukcijata
X = xapprox * W5000;
plot((1:5000)/5000,abs(X)); % tuka pak gledame deka fali tretiot ton
% Na prasanjeto od domasnata na krajot od sekcijata odgoorot e pod 2.
% Go aporksimiravme originalniot signal preku ogranicena osnova
% sto moze da opise samo odredeni frekvencii.

% =====================================
% del 3 FFT

X = fft(x); %Пресметува ффт со онолку примероци (синусоиди) колку што има примероци влезниот сигнал
%со тоа се овозможува целосна реконструкција од фреквентен во временски домен.
%постои и следнава форма на оваа функција

X = fft(x, M)
%со оваа форма се добива ДФТ со М примероци. Ако М е пократко од сигналот, ќе се направи
%ДФТ само на првите М примероци од сигналот што значи ќе добиеме пократок сигнал
%при реконструкција со xx = ifft(X).
%ова однесување е еквивалентно со X = fft(x(1:M))

%ако М е поголемо од сигналот, на сигналот прво се додаваат нули од десно па потоа се прави ФФТ.
%реконструираниот сигнал ќе биде подол од оригиналниот со додадените нули.

%Пример за кратење
n = [1:4000]/1000;
x1 = sin(2*pi*40*n);
x2 = sin(2*pi*50*n);
x = x1 + x2;
plot(x1(1:200), 'color', 'red');
hold on;
plot(x2(1:200), 'color', 'blue');
hold on;
plot(x(1:200), 'color', 'green');


%so site primeroci
M = 4000;
X = fft(x,M);
plot([1:M]/M, abs(X));

%so 500 primeroci
M = 500;
X = fft(x,M);
plot((1:M)/M,abs(X));

xx = ifft(X);
plot(real(xx));

%so 50
M = 50;
X = fft(x,M);
plot((1:M)/M,abs(X));
%tuka vekje gubime mnogu informacija

xx = ifft(X);
plot(real(xx));
%tie prvi 50 primeroci od originalniot signal ne pravat ni cela perioda od sumata na dvata sinusoidi


%prosiruvanje so nuli

%prvo vlezniot signal da go skratime na prvite 50 primeroci
M = 50;
X = fft(x,M);
x50 = ifft(X); %tuka se samo prvite 50 primeroci od vlzniot signal

%sega na skrateniot signal kje napravime FFT so 4000 primeroci
M = 4000;
X = fft(x50, M);
plot((1:M)/M,abs(X));

%zabelezuvame deka i so zgolemena rezolucija ne se zabelezuvaat dvata sinusuidi posebno

