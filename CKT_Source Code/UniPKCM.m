function [yo] = UniPKCM(lag, Var1, Var2, L1, L2, path, x, eCoor,model,c,itype,avg,block,nd,ival,nk,rad,ntok,b)

%   Y: Observation vector. A: Parameter Matrix with fields of lambda weight and calculated value like (0.038, 20.01).
%   Pow: p vector. Var: variance vector. y0: initial estimator (from least square estiamtion)

%   Computation of Cokriging Multiscale Data (Neuman, S.P., M. Riva, and A. Guadagnini (2008), On the geostatistical characterization of hierarchical media, Water Resour. Res.)

%   1. 通过lag算出H，通过Var1, Var2算出A, mu
%   x(1)=H; x(2)=A; x(3)=mu;
%   2. 将H,A和mu保存在path的cm.txt文件中
%   3. 修改cokri2中的Gam变量，令Gam(18)为truncated power variogram
%   4. 利用cokri2计算yo

%   c = [0.5 1.45 1]; s = [1 1 1] ; 1.1873




x0 = [0.5 1.45 10000000000];
x0 = [0.5 1.45 1];

[para, fval] = fsolve(@(x) TruncatedPower(x, L1, L2, lag, Var1, Var2), x0);

A = para(2);
para(1) = real(para(1));
if para(1)>=0.5
    para(1)=0.49;
end
if para(1)<=0
        para(1) = 0.01;
end
para(2) = A*gamma(1-2*para(1))/(2*para(1));

%path = 'D:\WORK\Lp-Upscaling\Res\';
SaveMat(strcat(path,  'TP.txt'), para);

%计算Circle的Ordinary Kriging
[x0s,s,sv,id,l]=cokri(x,eCoor,model,c,itype,avg,block,nd,ival,nk,rad,ntok,b);

yo = x0s;
end