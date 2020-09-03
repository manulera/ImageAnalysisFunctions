function [] = kymo_scalebar(image,contrast,x_res,t_res)
    if nargin<3||isempty(x_res)
        x_res = 0.0658683;
    end
    if nargin<4||isempty(t_res)
        t_res = 4./60;
    end
    
    ima=imread(image);
    figure
    imshow(ima,contrast)

    hold on

    t_start = 15;
    t_end = t_start + 5/t_res;
%     plot([5 5],[t_start t_end],'y','lineWidth',1)

    x_start = 8;
    x_end = x_start + 2/x_res;
%     plot([x_start x_end],[12 12],'y','lineWidth',1)


end

