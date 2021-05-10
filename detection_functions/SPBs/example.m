% open movie and mask

movie = readTiffStack('probs_multiplied.tif')/256;
mask = logical(~readTiffStack('mask.tif'));

% Do the analysis
[spb_1,spb_2]=findDotsInMovie(movie,mask);

figure
for i = 1:3:size(movie,3)
    cla
    imshow(movie(:,:,i),[0.05,0.5],'InitialMagnification','fit')
    hold on
    scatter(spb_1(i,2),spb_1(i,1))
    scatter(spb_2(i,2),spb_2(i,1))
    pause(0.05)
end

% SHould normalise the funciton by the number of points in the region!!