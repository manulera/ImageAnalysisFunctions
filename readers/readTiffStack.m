function [video] = readTiffStack(tif_file)
    % Read a tiff stack and return a video array
    
    im_info=imfinfo(tif_file);
    ima_width=im_info(1).Width;
    ima_height=im_info(1).Height;
    number_images=length(im_info);
    video=zeros(ima_height,ima_width,number_images,'uint16');
    
    tif_link = Tiff(tif_file, 'r');
    barry = waitbar(0,'Reading extra tiff file');
    
    for i=1:number_images
        waitbar(i/number_images);
        tif_link.setDirectory(i);
        video(:,:,i)=tif_link.read();
    end
    close(barry);
    tif_link.close();
end

