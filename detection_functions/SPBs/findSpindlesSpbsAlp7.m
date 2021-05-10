function [linear_fits,spb_1,spb_2] = findSpindlesSpbsAlp7(movie,mask,background,parabolla_frame,spb_mask)
    
    nb_frames = size(movie,3);
    do_parabolla=true;
    if parabolla_frame==inf
        do_parabolla=false;
        parabolla_frame = nb_frames;
    end
    [spb_1,spb_2]=findDotsInMovie(movie,mask.*spb_mask);
    
    figure; imshow(mask.*spb_mask)
    linear_fits = linearFitsSpbsOnly(spb_1(1:parabolla_frame-1,:),spb_2(1:parabolla_frame-1,:));
    
    figure;imshow(max(movie,[],3),[]);hold on;scatter(spb_1(:,1),spb_1(:,2)) ; scatter(spb_2(:,1),spb_2(:,2))
    
    if do_parabolla
        pp = parabolla_frame:nb_frames;
        parab_fits = strongestLinesWithSpbs(movie(:,:,pp),mask,background(pp),spb_1(pp,:),spb_2(pp,:));
        linear_fits = [linear_fits;parab_fits];
    end
    
    
end

