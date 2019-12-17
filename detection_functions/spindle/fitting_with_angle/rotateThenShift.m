function [x,y] = rotateThenShift(x,y,x0,y0,angle)
    % [xx,yy] = rotateThenShift(x,y,x0,y0,angle)
    % Apply a rotation to the coordinates [x,y] with angle, and then
    % shift the coordinates -> [x+x0,y+y0]
    
    % Rotation matrix    
    R = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    coords = [x(:) y(:)] * R;
    x = coords(:,1);
    y = coords(:,2);
    
    % Center at the point x0,y0

    x = x+x0;
    y = y+y0;
    
end

