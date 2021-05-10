function [y] = evaluateOrthogonalParabolla(spb_1,spb_2,par,x)
    
    distance2center = distancePoints(spb_1,spb_2)/2;
    
    y = -par/distance2center^2*x.^2 + par;
    
%     plot(x,y)
%     scatter(distance2center,0)
%     scatter(-distance2center,0)
end

