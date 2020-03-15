function [] = IKP_ANFIS_FKsys2(q5,q6)
% DK means the forward kinematics
l_1= 5;
l_2= 3;

xs= l_1 *cos(q5)+ l_2* cos(q5+q6);
ys= l_1 *sin(q5)+ l_2* sin(q5+q6);

% The matrix of the training data and expected outputs
IKP_Ass_Datats(xs,ys,q5,q6)