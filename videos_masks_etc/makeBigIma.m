function [big_ima,sizes] = makeBigIma(video,rows,cols)
    sizes= size(video);
    big_ima = zeros(rows*sizes(1),cols*sizes(2));

    for i = 1:sizes(3)
        ima = video(:,:,i);
        [ro,co] = ind2sub([rows,cols],i);
        xx = ((ro-1)*sizes(1)+1):(ro*sizes(1));
        yy = ((co-1)*sizes(2)+1):(co*sizes(2));
        big_ima(xx,yy) = ima;
    end
end

