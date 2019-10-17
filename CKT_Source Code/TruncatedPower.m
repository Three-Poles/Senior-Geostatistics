function f = TruncatedPower( x, L1, L2, lag, VarP, VarF )
%	Truncated power variogram 
%   Neuman, S.P., M. Riva, and A. Guadagnini (2008), On the geostatistical characterization of hierarchical media, Water Resour. Res
%	f1: Eq. 11 and 34   f2:Eq. 35   f3: Eq. 8 and 36
%   x(1)=H; x(2)=A; x(3)=mu;


f1 = 2*x(1)*x(3)*L2/(1+2*x(1))-lag;
f2 = x(2)*power(x(3)*L2, 2*x(1))/(2*x(1))-VarP;
f3 = x(2)*(power(x(3)*L1, 2*x(1))-power(x(3)*L2, 2*x(1)))/(2*x(1))-(VarF-VarP);

f = [f1; f2; f3];
end