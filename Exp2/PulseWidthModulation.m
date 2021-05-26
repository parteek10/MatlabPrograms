close all;
F2=input('Message frequency=');
F1=input('Carrier Sawtooth frequency=');
A=5;
t=0:0.001:1;

%Message amplitude must be less than Sawtooth
m=0.75*A.*sin(2*pi*F2*t);
subplot(3,1,1);
plot(t,m);
xlabel('Time');
ylabel('Amplitude');
title('Message Signal');
grid on;

%Carrier sawtooth
c=A.*sawtooth(2*pi*F1*t);
subplot(3,1,2);
plot(t,c);hold on ; 
plot(t,m);
xlabel('time');
ylabel('Amplitude');
title('Carrier sawtooth wave');
grid on;

%Length of carrier sawtooth 
n=length(c);

%Comparing Message and Sawtooth amplitudes
for i=1:n
    if (m(i)>=c(i))
        pwm(i)=1;
    else
        pwm(i)=0;
    end
end

%Pulse width modulation wave
subplot(3,1,3);
plot(t,pwm);
xlabel('Time');
ylabel('Amplitude');
title('plot of PWM');
axis([0 1 0 2]);
grid on;

