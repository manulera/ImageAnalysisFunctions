function [perif] = matrixPerifery(xx)
    
    % Returns the values at the perifery of a matrix as a linear array,
    % starting by (1,1) and going towards the right, it contains (1,1) at
    % the end as well

    perif = [xx(1,:) xx(2:end-1,end)' xx(end,end:-1:1) xx(end-1:-1:1,1)'];
    
    
end

