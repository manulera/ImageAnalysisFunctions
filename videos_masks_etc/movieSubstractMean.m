function [movie_sub,background] = movieSubstractMean(movie)
    % Substract the mean for each of the frames in a movie, and return the 
    % substracted movie and the mean of each frame
    nb_frames = size(movie,3);
    background = zeros(1,nb_frames);

    movie_sub = movie;
    for i = 1:nb_frames
        d = movie(:,:,i);
        background(i) = mean(d(:));
        movie_sub(:,:,i) = d-background(i);
    end
end

