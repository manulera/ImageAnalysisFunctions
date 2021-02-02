function [xx,yy,values] = coordinatesAndValuesInMask(mask,ima)
    % Returns the coordinates of pixels of a mask, and their value in the
    % image ima
    
    if any(size(ima)~=size(mask))
        error('mask and ima should have the same dimensions');
    end
    
    pixel_index=find(mask);
    [yy,xx]=ind2sub(size(mask),pixel_index);
    values=ima(pixel_index);
    
end

