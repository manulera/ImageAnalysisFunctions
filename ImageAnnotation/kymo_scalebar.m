function [ima] = kymo_scalebar(image,contrast,x_res,t_res,only_scalebar)
    
    if nargin<5||isempty(only_scalebar)
        only_scalebar = false;
    end
    
    ima=imread(image);
    figure
    imshow(ima,contrast,'InitialMagnification','fit')
    if only_scalebar
        return
    end
    hold on

    t_start = 12;
    t_end = t_start + 5/t_res;
    plot([12 12],[t_start t_end],'y','lineWidth',3)

    x_start = 12;
    x_end = x_start + 2/x_res;
    plot([x_start x_end],[12 12],'y','lineWidth',3)


end

