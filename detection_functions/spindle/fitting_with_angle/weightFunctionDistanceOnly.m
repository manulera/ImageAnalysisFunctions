function [weight] = weightFunctionDistanceOnly(xx,yy,pars,second_degree,method)
    
    % Rotation matrix
    theta = pars(1);
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    
    
    % Center at the point
    xx = xx-pars(2);
    yy = yy-pars(3);
    
    % Rotate
    coords = [xx yy] * R;
    
    xx = coords(:,1);
    yy = coords(:,2);
    
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

