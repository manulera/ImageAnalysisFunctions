function [xx,yy] = rotateNCenter(xx,yy,pars)
    
    % Add the values xp and yp from the x,y coordinates and apply a
    % rotation matrix with an angle.
    % Where angle is -pars(1), and the points xp, yp are pars(2:3)

    theta = -pars(1);
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    coords = [xx; yy]' * R;
    xx = coords(:,1);
    yy = coords(:,2);
    xx = xx+pars(2);
    yy = yy+pars(3);
    

    
end

