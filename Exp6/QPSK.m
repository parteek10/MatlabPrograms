clc, clear all, close all;
% Generate Quadrature Carrier Signal
Tb=1;
t=0:Tb/100:Tb;
fc=1;
c1=sqrt(2/Tb)*cos(2*pi*fc*t); %First Carrier Signal
c2=sqrt(2/Tb)*sin(2*pi*fc*t); %Second Carrier Signal
 
% Plot Carrier Signal
subplot(3,2,1);
plot(t,c1);
title('Carrier Signal-1');
xlabel('t----->');
ylabel('c1(t)');
grid on;
subplot(3,2,2);
plot(t,c2);
title('Carrier Signal-2');
xlabel('t----->');
ylabel('c2(t)');
grid on
 
% Generate message Signal
N=16;
m=rand(1,N);
 
% Generation of Modulated signal with QPSK
t1=0;
t2=Tb;
for i=1:2:(N-1);
t=[t1:Tb/100:t2];
if m(i)>0.5
m(i)=1;
m_s=ones(1,length(t));
else
m(i)=0;
m_s=-1*ones(1,length(t));
end
% Odd Bit Modulated Signal
odd_sig(i,:)=c1.*m_s;
if m(i+1)>0.5
     m(i+1)=1;
m_s=ones(1,length(t));
else
m(i+1)=0;
m_s=-1*ones(1,length(t));      
end
% Even bits modulated Signal
even_sig(i,:)=c2.*m_s;
%QPSK Signal
qpsk=odd_sig+even_sig;
subplot(3,2,3);
stem(m);
title('Binary Bits of Message Signal');
xlabel('n----->');
ylabel('b(n)');
grid on
%PLot QPSK Modulated Signal
subplot(3,2,4);
plot(t,qpsk(i,:));
title('QPSK Signal');
xlabel('t----->');
ylabel('s(t)');
grid on;
hold on;
t1=t1+(Tb+.01);
t2=t2+(Tb+.01);
end
hold off
% QPSK Demodulation
t1=0;
t2=Tb;
for i=1:N-1
t=[t1:Tb/100:t2];
x1=sum(c1.*qpsk(i,:));
x2=sum(c2.*qpsk(i,:));
%Decision Device
if (x1>0&&x2>0)
demod(i)=1;
demod(i+1)=1;
elseif (x1>0&&x2<0)
demod(i)=1;
demod(i+1)=0;
elseif (x1<0&&x2<0)
demod(i)=0;
demod(i+1)=0;
elseif (x1<0&&x2>0)
demod(i)=0;
demod(i+1)=1;
end
t1=t1+(Tb+.01);t2=t2+(Tb+.01);
end
subplot(3,2,5);
stem(demod);
title('QPSK Demodulation Bits');
xlabel('n----->');
ylabel('b(n)');
grid on;
