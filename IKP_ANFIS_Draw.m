% Solving Inverse Kinematics Problem with ANFIS
% By Samuel Ayankoso
% The American Univerisity in Cairo

% Animation code

clc;clear;close all;
l_1= 5;l_2=3;
hold on
axis(gca,'equal') % Aspect ratio
axis([-15 15 -4 16]) % limits of the x and y axes
% Training points of the revolute angle 1 and 2
qt1= 0:1*pi/180:90*pi/180;
qt2 = 0:1*pi/180:90*pi/180;
[Qt1 Qt2]=meshgrid (qt1,qt2);
Qtr1=[reshape(Qt1,1,[])]';
Qtr2=[reshape(Qt2,1,[])]';
% The training positions at varying revolute angles 
xt= l_1 *cos(Qtr1)+ l_2* cos(Qtr1+Qtr2);
yt= l_1 *sin(Qtr1)+ l_2* sin(Qtr1+Qtr2)
plot (xt,yt,'oc')
% Read values of x and y from matlab GUI
n = 10
coordinates = zeros(n,2);
hold on
for i=1:n
[xin, yin] = ginput(1);
coordinates(i,:) = [xin, yin];
h2=viscircles([coordinates(i,1) coordinates(i,2)], 0.2,'Color','g');
fis1= readfis('Sys1_IKP_2R')
fis2= readfis('Sys2_IKP_2R')
E_theta1= evalfis ([xin yin],fis1)
E_theta2= evalfis ([xin yin],fis2)

%Define Links
l1=5;l2=3;
link1x = l1*cos(E_theta1);
link1y = l1*sin(E_theta1);
link2x = l2*cos(E_theta1+E_theta2)+l1*cos(E_theta1);
link2y = l2*sin(E_theta1+E_theta2)+l1*sin(E_theta1);
Error_x=abs(coordinates(i,1)-link2x)
Error_y=abs(coordinates(i,2)-link2y)
% % Plotting
h3= viscircles([0 0], 0.1);
% Texts to be displayed
h4=text(-12, 15, ['x input:', num2str(coordinates(i,1))]);
h5=text(-12, 14, ['y input:', num2str(coordinates(i,2))]);
h6=text(-4, 15, ['Error x:', num2str(Error_x)]);
h7=text(-4,14, ['Error y:', num2str(Error_y)]);
h8=plot([0,link1x],[0,link1y],'b','linewidth',2);
h9= viscircles([link1x,link1y], 0.1);
h10=plot([link1x,link2x],[link1y,link2y],'r','linewidth',2)
pause(2)
delete(h2)
delete(h3)
delete(h4)
delete(h5)
delete(h6)
delete(h7)
delete(h8)
delete(h9)
delete(h10)
end

