clc 
close all
t = linspace(0,1,5000) ; 
%frequency sensitivity 
Kf = 30 ; 
%message Signal
Am = 1 ; 
Fm = 2 ; 
messageSignal = Am*cos(2*pi*Fm*t) ; 

%carrier signal 
Ac = 1 ; 
Fc = 40 ; 
carrierSignal = Ac*cos(2*pi*Fc*t) ; 

%modulation index 
beta = (Kf*Am)/Fm ; 
%FM for signal tone wave
frequencyModulatedWave = Ac*cos(2*pi*Fc*t  + beta*(sin(2*pi*Fm*t))) ;  

figure ;
%plotting message signal
subplot(3,1,1) ;
plot(t,messageSignal) ;
xlabel("time") ; 
ylabel("amplitude" ) ; 
title("Message signal" ) ; 

%plotting carrier signal
subplot(3,1,2) 
plot(t,carrierSignal) ; 
xlabel("time") ; 
ylabel("amplitude" ) ; 
title("Carrier signal" ) ; 

%plotting frequency modulated signal 
subplot(3,1,3) 
plot(t,frequencyModulatedWave) ; 
xlabel("time") ; 
ylabel("amplitude" ) ; 
title("FrequencyModulated signal" ) ; 

