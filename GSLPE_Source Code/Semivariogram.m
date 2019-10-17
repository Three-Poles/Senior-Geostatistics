function [x, y, ae] = Semivariogram(v, h, to, radius)
%ADDRES Summary of this function goes here
%   Detailed explanation goes here
% 计算变异函数  目前只考虑10cm

%节点坐标信息
Colid = 1;
Collon = 2;
Collat = 3;
ColX = 4;
ColY = 5;

ColTime = 1;
ColVal = 2;

%变程
x = [h: h: radius*2];
%x = [h: h/2: radius radius+h: h: radius*2];
y = zeros(1,size(x,2));
ycount = zeros(1,size(x,2));

sum = 0.0;
for i = 1 : size(v, 1) - 1
    Xi = v(i, ColX);
    Yi = v(i, ColY);
    Vi = v(i, ColVal);
    
    for j = i + 1 : size(v, 1)
        Xj = v(j, ColX);
        Yj = v(j, ColY);
        Vj = v(j, ColVal);
        
        d = sqrt((Xi - Xj)^2 + (Yi - Yj)^2);
        re = roundn(mod(d, h), -4);
        if re >= (h-to) || re <= to
        %if re >= (h-to) || re <= (h+to)
            idx = round(d / h);
            if idx <= numel(y) && idx > 0
                y(idx) = y(idx) + (Vi - Vj)^2;
                ycount(idx) = ycount(idx) + 1;
            end
        end
    end
end

y = y ./ ycount;

% for i = 1 : size(y, 2)
%     if isnan(y(i))
%         y(i) = 1.2;
%     end
% end

ys = size(y, 2);
for i = ys : -1 : 1
    if isnan(y(i)) || (i > ys / 2 && mod(i, 4) ~= 1)
        y(i) = [];
        x(i) = [];
    end
end


x0 = [1 1 1] ;
%x0 = [0.5 110 110];%1.0524
%x0 = [0.5 5 5];
ae = lsqcurvefit('Exponential', x0, x, y);
fe = Exponential(ae, x);
% ae = lsqcurvefit('Gaussian', x0, x, y);
% fe = Gaussian(ae, x);

% plot(x, y, 'b*')
% hold on
% plot(x, fe, 'r-')
% hold on
% ae1 = [9 0.8 0.2];
% fe1 = Exponential(ae1, x);
% plot(x, fe1, 'b-')
% ae =ae1 + 0.2;


end

