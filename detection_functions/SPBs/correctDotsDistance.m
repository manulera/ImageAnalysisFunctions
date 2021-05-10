function [smooth_coords] = correctDotsDistance(coords)
    
    % First smooth coords (this should remove most outliers)
    smooth_coords = movmedian(coords,20,1);

    % Calculate the kind of center of mass
    center_mass=median(smooth_coords);
    
    % Calculate the squared distance between points and center of mass
    dist = distancePoints(center_mass,smooth_coords);
    
    deviation=dist-movmedian(dist,20);
    err = deviation>5;
    
    % Correct edges
    true_vals = find(~err);
    if err(1)
        for i = 1:true_vals(1)
            smooth_coords(i,:) = smooth_coords(true_vals(1),:);
        end
    end
    if err(end)
        for i = true_vals(end):numel(err)
            smooth_coords(i,:) = smooth_coords(true_vals(end),:);
        end
    end
end

