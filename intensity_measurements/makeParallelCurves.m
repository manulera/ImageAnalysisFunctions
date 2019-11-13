function [xx,yy] = makeParallelCurves(x,y,pars,range,spacing)

% Write coordinates of the line defined in x,y in the alternative system of coords
    
    % Rotation matrix
    theta = pars(1);
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    
    
    % Center at the point
    x = x-pars(2);
    y = y-pars(3);
    
    % Rotate
    coords = [x(:) y(:)] * R;
    
    % Now we have the coordinates rotated
    x = coords(:,1);
    y = coords(:,2);
    
% Create lines paralel to the original curve in the current system

    nb_slices = range*2+1 ;
    nb_vals = numel(x);
    
    % We then add the slices
    xx = zeros(nb_slices,nb_vals);
    yy = xx;
    
    % disp is the displacement in the direction of the axis
    disp = -range*spacing:spacing:range*spacing;
    
    % Inverse rotation now
    theta = -pars(1);
    R = [cos(theta) -sin(theta); sin(theta) cos(theta)];
    
    for i = 1:nb_slices
        % Rotate
        coords = [x y+disp(i)]*R;
        % Substract
        xx(i,:) = coords(:,1) + pars(2);
        yy(i,:) = coords(:,2) + pars(3);
    end
    
    
end

