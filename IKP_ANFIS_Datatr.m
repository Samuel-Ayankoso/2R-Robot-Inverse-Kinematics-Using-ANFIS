% function[] = IKP_Ass_Datatr(in1,Q5,Q6)
function[] = IKP_ANFIS_Datatr(x,y,Q5,Q6)
global s12 datatr1 datatr2;
s12=s12+1;
datatr1(s12,:)=[x' y' Q5];
datatr2(s12,:)=[x' y' Q6];