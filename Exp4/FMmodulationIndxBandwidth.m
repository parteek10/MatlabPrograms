clc
clear all

% Message frequency
fm=input('Enter the frequency of modulating signal :');
Am=input('Enter the amplitude of modulating signal :');

% Frequency proportionality constant
kf=100;
% Calculating Modulation Index
M=(kf*Am)/fm;
% Frequency deviation
df=kf*Am;
% Calcualting Bandwidth of signal
if (M>1.57)
dw=2*(fm+df);
end
if (M<1.57)
dw=2*(fm);
end;

% Displaying Modulation Index and Bandwidth
disp(['Modulation index and Bandwidth are : ', num2str(M),' and ',num2str(dw)]);
t=0:0.0001:0.5;

% Message Signal
m=Am*cos(2*pi*fm*t);
subplot(3,1,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;

% Carrier signal 
fc=400;
Ac = 3 ; 
c=Ac*cos(2*pi*fc*t);
subplot(3,1,2);
plot(t,c);
xlabel('Time');
ylabel('Amplitude');
title('Carrier Signal');
grid on;

% FM wave
y=2*cos(2*pi*fc*t+(M*sin(2*pi*fm*t)));
subplot(3,1,3);
plot(t,y);
xlabel('Time');
ylabel('Amplitude');
title("Frequency modulated Wave " ) ; 
grid on;