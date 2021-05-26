clc,clear all,close all;
x = input('Enter Digital Input Information = ');   %binary signal 0 or 1
bp=.000001;                                        % bit period
disp(' Binary information at Trans mitter :');
disp(x);
 
bit=[]; 
for n=1:1:length(x)
if x(n)==1;
y=ones(1,100);
else x(n)==0;
y=zeros(1,100);
end
bit=[bit y];
end
% Dispaly Transmitting Information As Digital Signal
t1=bp/100:bp/100:100*length(x)*(bp/100);
subplot(3,1,1);
plot(t1,bit,'lineWidth',2.5);grid on;
axis([ 0 bp*length(x) -.5 1.5]);
ylabel('Amplitude(volt)');
xlabel(' Time(sec)');
title('Transmitting information as digital signal');
 
% Binary PSK Modulation 
A=5;                                          % Amplitude of carrier signal 
br=1/bp;                                      % bit rate
Fc=br*2;                                      % carrier frequency 
t2=bp/99:bp/99:bp;                 
s=length(t2);
m=[];
for (i=1:1:length(x))
if (x(i)==1)
y=A*cos(2*pi*Fc*t2);
else
y=A*cos(2*pi*Fc*t2+pi);   
end
m=[m y];
end
t3=bp/99:bp/99:bp*length(x);
subplot(3,1,2);
plot(t3,m);
xlabel('Time(sec)');
ylabel('Amplitude(volt)');
title('Waveform for Binary PSK Modulation coresponding Binary Information');
 
%Binary PSK demodulation 
mn=[];
for n=s:s:length(m)
t=bp/99:bp/99:bp;
y=cos(2*pi*Fc*t);                                         
p=y.*m((n-(s-1)):n);
t4=bp/99:bp/99:bp;
z=trapz(t4,p);                                     
z=round((2*z/bp));                                    
if(z>0)                
a=1;
else
a=0;
end
mn=[mn a];
end
disp(' Binary information at Reciver :');
disp(mn);
 
%Representation of binary information as digital signal which achived after PSK demodulation 
bit=[];
for n=1:length(mn);
if mn(n)==1;
y=ones(1,100);
else mn(n)==0;
y=zeros(1,100);
end
bit=[bit y];
end
 
% Reieved Binary PSk Demodulated Signal
t4=bp/100:bp/100:100*length(mn)*(bp/100);
subplot(3,1,3)
plot(t4,bit,'LineWidth',2.5);grid on;
axis([0 bp*length(mn) -.5 1.5]);
ylabel('Amplitude(volt)');
xlabel('Time(sec)');
title('Recived Digital signal after binary PSK demodulation');

