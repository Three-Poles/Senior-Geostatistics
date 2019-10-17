function g = Inverse(x,hdata)
    g = x(1) + 1 ./ (x(2) * power((hdata+ x(4)), x(3)));