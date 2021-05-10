function [coord_max] = strongestDotInSquare(center,width,ima)
    % [coord_max] = strongestDotInSquare(center,width,ima)
    % Find the strongest intensity in the points in a square of side
    % 2*width+1
    center = round(center);
    x_coord = (center(2)-width):(center(2)+width);
    y_coord = (center(1)-width):(center(1)+width);
    
    % The cropped image
    small_ima=ima(x_coord,y_coord);
    [~,ii]=max(small_ima(:));
    [xx,yy]=ind2sub(size(small_ima),ii);
    coord_max= [xx,yy] + center;
    
end

