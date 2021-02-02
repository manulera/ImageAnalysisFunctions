function [] = calculateDriftWithMax(movie_file,mask_file,time_start,time_finish)
% Make a drift file from the movie file tracking the max intensity point
% inside the mask from time_start to time_finish
    
    movie = readTiffStack(movie_file);
    mask = logical(readTiffStack(mask_file));
    movie_size=size(movie(:,:,1));
    figure
    imshow(movie(:,:,time_start).*mask,[]);
    hold on
    
    x_vals=zeros(size(movie,3),1);
    y_vals=zeros(size(movie,3),1);
    z_vals=zeros(size(movie,3),1);
    
    
    for i = time_start:time_finish
        % This coudl be more efficient, but works well enough
        ima = movie(:,:,i).*mask;
        [~,max_ind] = max(ima(:));
        [x,y] = ind2sub(movie_size,max_ind);
        scatter(y,x);
        x_vals(i)=x-x_vals(time_start);
        y_vals(i)=y-y_vals(time_start);
    end
    % Make this negative and add the weird lines
    x_vals(time_finish:end)=x_vals(time_finish);
    y_vals(time_finish:end)=y_vals(time_finish);
    dlmwrite('drift.txt',[x_vals y_vals z_vals],'\t');
    
end

