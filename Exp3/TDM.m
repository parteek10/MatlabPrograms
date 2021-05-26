clear ;
t = 0:0.5:4*pi ; 
sig1 = sin(t) ; 
sig2 = triang(length(t) ) ; 

%plot of continuous form of signals 
figure(1) ;
subplot(2,2,1) ; 
plot(t,sig1) ;
xlabel("time") ; 
ylabel("amplitude") ; 
title("Continuous Form of signal 1") ;

subplot(2,2,2) ; 
plot(t,sig2) ;
xlabel("time") ; 
ylabel("amplitude") ; 
title("Continuous Form of signal 2") ;

%plot of Discrete form of signals 
subplot(2,2,3) ; 
stem(t,sig1) ;
xlabel("time") ; 
ylabel("amplitude") ; 
title("Discrete Form of signal 1") ; 

subplot(2,2,4) ; 
stem(t,sig2) ;
xlabel("time") ; 
ylabel("amplitude") ; 
title("Discrete Form of signal 2") ; 

%calculation for time division multiplexing
for i = 1:length(t) 
    Signal(1,i) = sig1(i) ; 
    Signal(2,i) = sig2(i) ;
end
MultiplexedSignal = reshape(Signal , 1 , 2*length(t)) ; 

%plotting TDM signal 
figure(2);
stem(MultiplexedSignal) ;
xlabel("time") ; 
ylabel("amplitude") ; 
title("Multiplexed Signal") ; 

%calculation for Demultiplexing 
DemutilplexedSignal = reshape(MultiplexedSignal , 2 , length(t) ) ; 
for i = 1:length(t) 
     sig1(i) = DemutilplexedSignal(1,i) ;
     sig2(i) = DemutilplexedSignal(2,i) ;
end 
%plotting demultiplexed signal 
figure(3) ;
subplot(1,2,1) 
plot(t,sig1) ;
xlabel("time") ; 
ylabel("amplitude") ; 
title("Demuxed signal 1") ; 
subplot(1,2,2) 
plot(t,sig2) ; 
xlabel("time") ; 
ylabel("amplitude") ; 
title("Demuxed signal 2") ;








