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
subplot(3,1,1)
plot(t,message) ; 
xlabel("time") ;
ylabel("amplitude") ; 
title("message signal") ;

%plotting carrier signal
subplot(3,1,2)
plot(t,carrier) ; 
xlabel("time") ;
ylabel("amplitude") ; 
title("carrier signal") ;

%calculation of amplitude modulated wave 
modulatingIndex = 1 ; 
modulatedWave = Ac + Am*(1+modulatingIndex*sin(2*pi*Fm*t) ).*sin(2*pi*Fc*t) ;
subplot(3,1,3) ;
plot(t,modulatedWave) ;
xlabel("time") ;
ylabel("amplitude") ;
title("AM Modulated wave") ;


