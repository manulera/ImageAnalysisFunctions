function [weight] = weightFunctionIntensity(xx,yy,zz,pars,second_degree,settings)
    
    % Rotation matrix
    theta = pars(1);
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    
    
    % Center at the point
    xx = xx-pars(2);
    yy = yy-pars(3);
    
    % Rotate
    coords = [xx yy] * R;
    
    if second_degree
        expected = pars(4)*xx.^2;
    else
        expected = 0;
    end
    
    xx = coords(:,1);
    yy = coords(:,2);
    
    weight = abs(yy-expected).*(zz).^2 + abs(xx)*settings.weight_center;
    weight = sum(weight);
end

