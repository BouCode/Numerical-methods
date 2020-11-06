%PROGRAMA PARA REALIZAR LA MODULACION Y DEMODULACION DE UNA SEÑAL
close all
clear all
fm=input('Introduzca Frecuencia de Muestreo:_');
fs=input('Introduzca Frecuencia de la Señal:_');
fc=input('Introduzca Frecuencia de la Señal Portadora:_');
%MODULACION
t=0:1/fm:5; %definiendo el tiempo real
L=length(t); %sacando la longitud del vector tiempo
f1=sin(2*pi*fs*t); %señal de informacion
subplot(2,2,1);plot(t(1:500),f1(1:500),'r');title('Señal de Entrada'),grid on,xlabel('Tiempo'),ylabel('m(t)')
f2=cos(2*pi*fc*t);%creando cosenoidal para lograr la modulacion
subplot(2,2,2);plot(t(1:100),f2(1:100));title('Señal Portadora'),grid
on,xlabel('Tiempo'),ylabel('p(t)')
f3=f1.*f2; %multiplicaciones de las dos funciones
subplot(2,2,3:4),plot(t(1:500),f3(1:500));title('señal modulada'),grid
on,xlabel('tiempo'),ylabel('m(t)*p(t)')
hold on
plot (t(1:500),f1(1:500),'r')
pause
g1=abs(fftshift(fft(f1)))/L; %transformado en frecuencia f1
k=[(-L/2)+1:L/2];
k1=(1/(0.795*2*pi))*k;
figure
subplot(3,1,1),plot(k1,g1),title('Espectro de Magnitud de la Señal de Entrada'),grid on,xlabel('frecuencia'),ylabel('m(f)')
g2=abs(fftshift(fft(f2)))/L; %transformado en frecuencia f2
subplot(3,1,2);plot(k1,g2),title('Espectro de Magnitud de la Señal Portadora'),grid on,xlabel('frecuencia'),ylabel('p(f)')
g3=abs(fftshift(fft(f3)))/L; %transformado en frecuencia f3
subplot(3,1,3);plot(k1,g3),title('Espectro de Magnitud de la Señal Modulada'),grid on,xlabel('frecuencia'),ylabel('m(f)conv p(f)')
pause
%DEMODULACION
%asumiendo cero perdidas en el medio
f4=f3.*f2;%demodulando
figure
subplot(2,2,1:2);plot(t(1:500),f4(1:500)),title('Señal Demodulada'),grid
on,xlabel('Tiempo'),ylabel('R(t)')
g4=abs(fftshift(fft(f4)))/L;%transformando en frecuencia de la señal
modulada
subplot(2,2,3:4);plot(k1,g4),title('Espectro de Magnitud de la Señal Demodulada'),grid on,xlabel('Frecuencia'),ylabel('R(f)=m(f) conv p(f)')
pause
%FILTRO
[b,a]=butter(15,3*fs/(fc/2)); %Se genera los parámetros del filtro
Fx=filtfilt(b,a,f4); %Creando el filtro pasabanda
[H,W]=freqz(b,a,15);
figure
plot(abs(H),'r'),grid
on,xlabel('Frecuencia'),ylabel('Magnitud'),title('Filtro'); %Graficando
el filtro
pause
figure
plot(t(1:1000),Fx(1:1000)),title('Comparación entre la senal Filtrada y Original (m(t)'),grid on,xlabel('Tiempo'),ylabel('Amplitud')
hold on
plot(t(1:1000),f1(1:1000),'r'),legend('Senal filtrada','Senal Original')
%Se Grafican la senal Original y recuperada
% Se ha modulado y demodulado una senal.