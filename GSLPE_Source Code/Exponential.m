function g = Exponential(x,hdata)%x=[变程a 拱高c 块金c0]
    g = x(3) + x(2) - x(2) * exp(-3 * hdata / x(1));