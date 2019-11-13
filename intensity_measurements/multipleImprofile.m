function [ints] = multipleImprofile(xx,yy,ima,method)
    % For a series of lines in the format xx(n,:), yy(n,:), returns an array
    % that contains the intensity int(n,:) calculated using 'method' in
    % improfile
    
    ints = zeros(size(xx));
    nb_vals = size(xx,2);
    nb_slices = size(xx,1);
    for i =1:nb_slices
        ints(i,:) = improfile(ima,xx(i,:),yy(i,:),nb_vals,method);
    end
    
end

