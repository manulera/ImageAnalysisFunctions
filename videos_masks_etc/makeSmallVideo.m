function [small_video,x_box,y_box,transposing] = makeSmallVideo(video,masks,expand)
    
    % Return a cropped version of the big video based on the masks
    [x_box,y_box] = expandBoundingBox(any(masks,3),expand);
    if numel(x_box)<numel(y_box)
        transposing=true;
    else
        transposing=false;
    end

    small_video = video(y_box,x_box,:);

    if transposing
        small_video = permute(small_video,[2,1,3]);
    end

end