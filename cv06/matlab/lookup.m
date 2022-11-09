close all;
clear;

Ucc = 3.3;
R1 = 10;
%% CVS read
raw = csvread("ntc.csv")';
temp1 = raw(1,:);
r = raw(2,:);



ad = 3.3.*(r./(r+R1));
plot(ad,temp1, 'o');

ad = (r./(r+R1)).*2^10;

plot(ad,temp1, 'o');
grid on;
hold on;

p = polyfit(ad, temp1, 10);
ad2 = 0:1023;

t2 = round(polyval(p,ad2), 1);
figure;
plot(ad2, t2, 'r');
hold on;

dlmwrite('data.dlm', t2*10, ',')
