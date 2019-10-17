function x = LaplacePDF(a,b,m,n)
% Reference: http://en.wikipedia.org/wiki/Laplace_distribution
% a: location parameter b¡Ý0: scale parameter (m, n): the col and row of Matrix
    u = rand(m,n)-0.5;
    x = a - b*sign(u).*log(1-2*abs(u));
end