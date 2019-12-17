function [x,y] = resamplePolylineXY(x,y,N)
    
    if nargin<3||isempty(N)
        N = sum(sqrt(diff(x).^2+diff(y).^2));
    end
    
    coords = resamplePolyline([x(:) y(:)],round(N));
    x = coords(:,1);
    y = coords(:,2);
    
end

