clear ;
t = 0:0.01:2; 

%message wave
Am = 4 ;
Fm = 3; 
MessageWave = Am*cos(2*pi*Fm*t) ; 

%carrier wave 
Ac = 8;
Fc = 10 ; 
CarrierWave = Ac*sin(2*pi*Fc*t) ; 

%modulated wave
ModulatedWave = CarrierWave.*(1+MessageWave/Ac) ; 

%plotting message wave
subplot(3,1,1) 
plot(t,MessageWave) ;
title("MessageWave") ; 
xlabel("time(in seconds)") ; 
ylabel("Amplitude" ) ; 

%plotting carrier wave
subplot(3,1,2) ;
plot(t,CarrierWave) ; 
title("CarrierWave") ; 
xlabel("time(in seconds)") ; 
ylabel("Amplitude" ) ; 

%plotting modulated wave
subplot(3,1,3) ;
plot(t,ModulatedWave) ; hold on ; 
title("ModulatedWave") ; 
xlabel("time(in seconds)") ; 
ylabel("Amplitude" ) ; 
%upper bound
plot(t,Ac*(1+MessageWave/Ac) , 'b:') ; hold on ; 
%lower bound
plot(t,-Ac*(1+MessageWave/Ac) , 'b:' ) ; hold off; 



