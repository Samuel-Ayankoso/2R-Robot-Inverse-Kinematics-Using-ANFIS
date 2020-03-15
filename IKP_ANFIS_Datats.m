function[] = IKP_ANFIS_Datats(x,y,Q5,Q6)
global s13 datats1 datats2;
s13=s13+1;
datats1(s13,:)=[x' y' Q5];
datats2(s13,:)=[x' y' Q6];