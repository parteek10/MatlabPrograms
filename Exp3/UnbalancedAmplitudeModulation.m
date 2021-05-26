clear all ;
fm=0.5;
fc=2.5;
t=0:0.0001:4;

% message signal
mesaage=sin(2*pi*fm*t);

% carrier signal
carrier=sin(2*pi*fc*t);

%amplitude modualtion 
Ac=20;
Am=10;
Mindex = Am/Ac;
AM1=(1+Mindex.*mesaage).*(Ac.*carrier);
AM2=(1+3*Mindex.*mesaage).*(Ac.*carrier);
for i=1:length(AM1)
    if(AM1(i)<0)
        unbalenced(i) = AM2(i);
    else
        unbalenced(i)=AM1(i) ;
    end
end

%plotting unbalenced AM graph 
figure ;
subplot(1, 1, 1);
plot(unbalenced);
xlabel('Time');
ylabel('Amplitude');
title('Unbalanced Amplitude Modulator');