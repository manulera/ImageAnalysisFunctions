function [weight] = weightFunctionIntensity(xx,yy,zz,pars,second_degree,settings)
    
    [xx,yy]=centerThenRotate(xx,yy,pars(2),pars(3),pars(1));
    
    if second_degree
        expected = pars(4)*xx.^2;
    else
        expected = 0;
    end

    weight = abs(yy-expected).*(zz).^2 + abs(xx)*settings.weight_center;
    weight = sum(weight);
end

