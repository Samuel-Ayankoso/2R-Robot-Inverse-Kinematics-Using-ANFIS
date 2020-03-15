clc;
clear;
close all;
global s12 s13 datatr1 datatr2  datats1 datats2 

%s12,s13 is used to define the rows of the training and checking data 
s12=0;   
s13=0; 
qt1=0:1*pi/180:90*pi/180 ;    % change from 30 to 60 for faster training
qt2=0:1*pi/180:90*pi/180;      % range changed from (-180 to 180) to (0 to 90)
[QT1 QT2]=meshgrid(qt1,qt2);

%to the DK model
[as be]=size(QT1);      
for a=1:1:as
    for b=1:1:be
IKP_ANFIS_FKsys1(QT1(a,b),QT2(a,b))    %passing the data to the function containing the FK model
    end
end

% Checking points of the revolute angle 1 and 2
qs1= 0:2.5*pi/180:90*pi/180;
qs2 = 0:2.5*pi/180:90*pi/180;
[QS1 QS2]=meshgrid(qs1,qs2);
[cs de]=size(QS1);

for c=1:1:cs
    for d=1:1:de
IKP_ANFIS_FKsys2(QS1(c,d),QS2(c,d)) %passing the data to the function containing the FK model
    end
end

