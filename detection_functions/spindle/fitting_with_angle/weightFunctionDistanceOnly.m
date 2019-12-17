function [weight] = weightFunctionDistanceOnly(xx,yy,pars,second_degree,method)
    
    [xx,yy]=centerThenRotate(xx,yy,pars(2),pars(3),pars(1));
    
    if second_degree
        expected = pars(4)*xx.^2;
    else
        expected = 0;
    end
    switch method
        case 'robust'
            weight = abs(expected-yy) + abs(xx);
        case 'least-squares'
            weight = (expected-yy).^2 + abs(xx).^2;
    end
    weight = sum(weight);
end

