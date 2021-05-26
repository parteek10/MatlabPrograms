%Message signal 
Am = 2 ;
Fm = 4 ;
t = 0:0.001:1 ; 
message = Am*sin(2*pi*Fm*t) ; 

%Carrier signal
Ac = 2 ;
Fc = 10*Fm ;
carrier = Ac*sin(2*pi*Fc*t) ; 

%ploting message signal
figure(1) 
subplot(2,1,1)
plot(t,message) ; 
xlabel("time") ;
ylabel("amplitude") ; 
title("message signal") ;

%plotting carrier signal
subplot(2,1,2)
plot(t,carrier) ; 
xlabel("time") ;
ylabel("amplitude") ; 
title("carrier signal") ;

%calculation of amplitude modulated wave with modulatio index 0.5
modulatingIndex = 0.5 ; 
modulatedWave = Ac + Am*(1+modulatingIndex*sin(2*pi*Fm*t) ).*sin(2*pi*Fc*t) ;
figure(2) ;
subplot(2,2,1) ;
plot(t,modulatedWave) ;
xlabel("time") ;
ylabel("amplitude") ;
title("AM Modulated wave with modulation index 0.5 ") ;

%calculation of amplitude modulated wave with modulation index = 1
modulatingIndex = 1 ; 
modulatedWave = Ac + Am*(1+modulatingIndex*sin(2*pi*Fm*t) ).*sin(2*pi*Fc*t) ;
subplot(2,2,2) ;
plot(t,modulatedWave) ;
xlabel("time") ;
ylabel("amplitude") ;
title("AM Modulated wave with modulation index 0.5 ") ;

%calculation of amplitude modulated wave with modulatio index 2
modulatingIndex = 2 ; 
modulatedWave = Ac + Am*(1+modulatingIndex*sin(2*pi*Fm*t) ).*sin(2*pi*Fc*t) ;
subplot(2,2,3) ;
plot(t,modulatedWave) ;
xlabel("time") ;
ylabel("amplitude") ;
title("AM Modulated wave with modulation index 2 ") ;

%calculation of amplitude modulated wave with modulation index = 3
modulatingIndex = 3 ; 
modulatedWave = Ac + Am*(1+modulatingIndex*sin(2*pi*Fm*t) ).*sin(2*pi*Fc*t) ;
subplot(2,2,4) ;
plot(t,modulatedWave) ;
xlabel("time") ;
ylabel("amplitude") ;
title("AM Modulated wave with modulation index 3") ;


