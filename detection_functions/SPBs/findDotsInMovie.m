function [coords_1,coords_2] = findDotsInMovie(movie,mask,apply_spb_mask)
    
    if nargin<2||isempty(mask)
        mask=1;
    end
    
    if nargin<3||isempty(apply_spb_mask)
        apply_spb_mask=false;
    end
    
    %% Iterate through image
    nb_frames = size(movie,3);
    dot_coords = cell(1,nb_frames);
    for i = 1:nb_frames
        dot_coords{i} = findDotsInImage(movie(:,:,i).*mask);
    end

    %% Assign identity to points

    [ coords_1,coords_2 ] = correctDotsIdentity( dot_coords,movie );

    %% Correct outliers
    coords_1=correctDotsDistance(coords_1);
    coords_2=correctDotsDistance(coords_2);
    
    % identity can be messed up at this step
    rebuild_dot_coords = cell(1,nb_frames);
    for i = 1:nb_frames
        rebuild_dot_coords{i} = [coords_1(i,:);coords_2(i,:)];
    end
    [ coords_1,coords_2 ] = correctDotsIdentity( rebuild_dot_coords,movie );
    
    %% Set it such that x is the first coordinate
    coords_1 = coords_1(:,[2,1]);
    coords_2 = coords_2(:,[2,1]);
    coords_1=correctDotsDistance(coords_1);
    coords_2=correctDotsDistance(coords_2);
end

