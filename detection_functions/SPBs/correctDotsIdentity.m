function [ coords_1,coords_2 ] = correctDotsIdentity( dot_coords,movie )
    
    nb_frames = size(movie,3);
    coords_1 = zeros(nb_frames,2);
    coords_2 = zeros(nb_frames,2);

    coords_1(1,:) = dot_coords{1}(1,:);
    coords_2(1,:) = dot_coords{1}(2,:);

    for i = 2:nb_frames
        dot_1 = dot_coords{i}(1,:);
        dot_2 = dot_coords{i}(2,:);

        dot_1_prev = coords_1(i-1,:);
        dot_2_prev = coords_2(i-1,:);
        
        % In case they have been swapped, we find the minimum
        
        total_distance_non_swapped = distancePoints(dot_1,dot_1_prev) + distancePoints(dot_2,dot_2_prev);
        total_distance_swapped = distancePoints(dot_1,dot_2_prev) + distancePoints(dot_2,dot_1_prev);
          
        if total_distance_non_swapped>total_distance_swapped
            coords_1(i,:) = dot_2;
            coords_2(i,:) = dot_1;
        else
            coords_1(i,:) = dot_1;
            coords_2(i,:) = dot_2;
        end
        
    end

    

    end

