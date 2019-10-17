function g = Gaussian(x,hdata)%x=[变程a 拱高c 块金c0]
    g = x(2) - x(2) * exp(-3 * power(hdata, 2) / (x(1) * x(1))) + x(3);