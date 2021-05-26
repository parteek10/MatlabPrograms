clc, clear all, close all;
x= input('Enter Digital Input Information = '); %Information Bits
br=10^6; %Transmission Bit rate
Fc=br; %Carrier Frequency
T=1/br; %Bit Duration
t=T/99:T/99:T; %Time Vector
 
%Display information
subplot(4,1,1);
stem(x,'Linewidth',1.5);
grid on;
title('Information to be Transmitted');
axis([0 11 0 1.5]);
 
% Differential Encoding
d=1; %Intial Bit
coded=[d];
for i=1:length(x)
temp=~xor(d,x(i));
coded=[coded temp];
d=temp;
end
 
% Display Differential Encoded information
subplot(4,1,2);
stem(coded,'linewidth',1.5);
grid on
title('Deifferential Encoded Signal');
axis([0 11 0 1.5]);
 
%PSK Modulation of Encoded Bit Stream
coded_PNRZ=2*coded-1;
modulated=[];
t=T/99:T/99:T;
for i=1:length(coded)
temp=coded_PNRZ(i)*sqrt(2/T)*cos(2*pi*Fc*t);
modulated=[modulated temp];
end
 
%Plotting DPSK Modulated Signal
t1=T/99:T/99:(T*length(coded));
subplot(4,1,3);
plot(t1,modulated,'linewidth',1.5);
title('DPSK Modulated Signal');
grid on;
 
%Non Coherent Detection of DPSK Signal
received=modulated;
Rx_data=[];
for i=1:length(coded)-1;
Z_in=received((i-1)*length(t)+1:i*length(t)).*received((i)*length(t)+1:(i+1)*length(t));
Z_in_intg=(trapz(t,Z_in)); %Integration Using Trapzoidal Rule
if(Z_in_intg>0)
temp=1;
else
temp=0;
end
Rx_data=[Rx_data temp];
end
 
%Display Demodulated Data
subplot(4,1,4);
stem(Rx_data,'linewidth',1.5);
grid on
title('Received Information Bits');
axis([0 11 0 1.5]);

