clear;

load('FMCW.mat');
load('IF.mat');
load('LO.mat');
load('Tone.mat');
load('TX.mat');

time=FMCWTime(1:fix(length(FMCWTime)/8));
fs=1/(time(2)-time(1));
fmcwdata=FMCWData(1:length(time));
ifdata=IFData(1:length(time));
lodata=LOData(1:length(time));
tonedata=TONEData(1:length(time));
txdata=TXData(1:length(time));

NFFT=2^20;

freq=(0:NFFT-1)*fs/NFFT;

figure(1);
subplot(2,1,1),plot(time,fmcwdata);
subplot(2,1,2),plot(time,lodata);

figure(2);
plot(time,tonedata);

figure(3);
plot(time,txdata);

figure(4);
plot(time,ifdata);

figure(5);
FFTIF=fft(ifdata,NFFT)*2/NFFT;
FFTIF=FFTIF(1:NFFT/2);
plot(freq(1:NFFT/2),20*log10(abs(FFTIF)));
axis([0,8e6,-140,-80]);