function [xx,yy] = centerThenRotate(xx,yy,x0,y0,angle)
    % [xx,yy] = centerThenRotate(xx,yy,angle,x0,y0)
    % Do [xx,yy]-[x0,y0], then rotate with angle
    
    % Center at the point
    xx = xx-x0;
    yy = yy-y0;
    
    
    % Rotation matrix
    R = [cos(angle) -sin(angle); sin(angle) cos(angle)];
    
    % Rotate
    coords = [xx(:) yy(:)] * R;
    
    xx = coords(:,1);
    yy = coords(:,2);
end

