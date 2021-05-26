%signal sampling and reconstruction of analog signals.
clear ;
t = 1:50 ;
signal = 2*sin(2*pi*0.02*t) ; 

%plotting modulating signal 
subplot(4,1,1) ; 
plot(t,signal) ; 
title("Modulating signal" ) ; 
xlabel("time(in second)") ; 
ylabel("amplitude") ; 

%creating carrier Signal 
carrier = sin(2*pi*0.1*t) ; 
for i = 1:50 
      if carrier(i) < 0 
           carrier(i) = -1 ; 
      else
          if carrier(i) > 0
             carrier(i) = 1 ;
          else 
              carrier(i) = 0 ; 
          end 
      end
end

%plotting carrier signal 
subplot(4,1,2) ; 
plot(t,carrier) ; 
title("Carrier signal" ) ; 
xlabel("time(in second)") ; 
ylabel("amplitude") ; 


%creating sampled signal 
for i = 1:50 
    if carrier(i) == -1 
        signal(i) = 0 ;
    end 
end

%plotting Sampled Signal
subplot(4,1,3) ; 
plot(t,signal) ;
title("Sampled signal") ;
xlabel("time(in second)") ; 
ylabel("amplitude") ; 

%reconstructing the signal
for i = 1:50 
    if signal(i) == 0 
        signal(i) = 2*sin(2*pi*0.02*i) ;
    end 
end

%plotting reconstructing signal
subplot(4,1,4) ;
plot(t,signal) ;
title("Reconstructed signal") ;
xlabel("time(in second)") ; 
ylabel("amplitude") ; 


