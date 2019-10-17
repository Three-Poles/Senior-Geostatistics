GSLPE Version 1.0

Name: GeoStatistical Least Power Estimation

Developer: Feng Liu and Xin Li

Email: liufeng@lzb.ac.cn (Feng Liu), xinli@itpcas.ac.cn (Xin Li)

Required hardware: Any computer that runs the Windows (7 or higher) and Matlab (R2010 or higher). 

Required software: Matlab (R2010 or higher). 

Components libraries include Matlab Toolbox of Cokriging (ref: COKRIGING WITH MATLAB denis marcotte).

Cost: GSLPE is freely available and can be downloaded from the GitHub repository (https://github.com/uniliufeng/LPE-based-upscaling-algorithms).

References:
Feng Liu, Xin Li, 2017, New spatial upscaling methods for multi-point measurements: from normal to p-normal, Computers & Geosciences, 109: 247-257, doi: 10.1016/j.cageo.2017.08.001

Introducation:
GSLPE (GeoStatistical Least Power Estimation) is a series of upscaling methods based on Geostatistics (such as Ordinary Kriging) and Generalized Gaussian distribution. GSLPE can be universally used to multi-point heterogeneous measurements upscaling studies due to its robustness and no limit to the raw measurements.

Examples:

1. Add the toolbox of cokriging in your Matlab.

2.  Add all the m-file of GSLPE in your work folder of Matlab.

3. Define all the parameters in advance.

4. Run the following commond in your Matlab.

	GSLPE [Y, A] = UniPKModel(v, h, to, radius, Xc, Yc); 
	xlpk = UniPKLPE2(Y, A, Pow, Var, Dis, VID, SID, xls, 4);
