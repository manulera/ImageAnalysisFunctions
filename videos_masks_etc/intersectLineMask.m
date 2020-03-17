function [keep_polygon,keep_mask] = intersectLineMask(x,y,mask)
    % Inputting a polyline (x,y), keep the parts of the mask that intersect
    % with this polyline. Returns:
    % keep_polygon : a logical vector of the same length as the polyline,
    % where positions inside the mask are true.
    % keep_mask : intersection of mask and line.
    
    [cont,mask_pieces] = bwboundaries(mask);
    keep_polygon = false(size(x));
    keep_mask = false(size(mask));
    for j = 1:numel(cont)
        in_polygon_j=inpolygon(x,y,cont{j}(:,2),cont{j}(:,1));
        keep_polygon = keep_polygon | in_polygon_j;
        if any(in_polygon_j)
            keep_mask = keep_mask | mask_pieces==j;
        end
    end
    
end

