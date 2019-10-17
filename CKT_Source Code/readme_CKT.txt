CKT Version 1.0

Name: CoKriging with Truncated power variogram

Authors: Riva, M., S.P. Neuman, and A. Guadagnini

Developer: Feng Liu

Email: liufeng@lzb.ac.cn (Feng Liu)

Required hardware: Any computer that runs the Windows (7 or higher) and Matlab (R2010 or higher). 

Required software: Matlab (R2010 or higher). 

Cost: CKT is freely available and can be downloaded from the GitHub repository (?).

References:
Riva, M., S.P. Neuman, and A. Guadagnini (2015), New scaling model for variables and increments with heavy-tailed distributions, Water Resour. Res., 51, 4623-4634, doi:10.1002/2015WR016998
Neuman, S.P., M. Riva, and A. Guadagnini: On the geostatistical characterization of hierarchical media, Water Resour. Res., 44, 252-261., doi:10.1029/2007WR006228, (2008).
Feng Liu, Xin Li, 2017, New spatial upscaling methods for multi-point measurements: from normal to p-normal, Computers & Geosciences, 109: 247-257, doi: 10.1016/j.cageo.2017.08.00

Introducation:
CKT (CoKriging with Truncated power variogram) is a multi-scale non-Gaussian method based on truncated power variogram. CKT can be used to upscaling studies in the period of environmental emergency (such as soil moisture estimate during the irrigation or precipitation period ) since it requires heavy-tailed sample distribution and is no limit to the supports of measurements.

Examples:

1. Add the toolbox of cokriging in your Matlab.

2.  Add all the m-file of CKT in your work folder of Matlab.

3. Define all the parameters in advance.

4. Run the following commond in your Matlab.

	model = [18 ae(1)];
	xtp = UniPKCM( ae(1), VarP, VarF, L1, L2, path, x, [Xc Yc],model,c,itype,avg,block,nd,ival,nk,rad,ntok,b);
