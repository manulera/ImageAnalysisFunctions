function [centered_kymo] = kymo_scalebar_centered(image,mat_file,contrast,x_res,t_res,only_scalebar,extra)
    
    if nargin<6||isempty(only_scalebar)
        only_scalebar = false;
    end
    t_start = 12;
    x_start = 12;
    if nargin<7||isempty(extra)
        extra = [];
    end
    if endsWith(mat_file,'mat') 
        data = load(mat_file);
        data = data.out;
        right_edge = data.right_edge.x;
        left_edge = data.left_edge.x;
    elseif endsWith(mat_file,'csv')
        data = csvread(mat_file);
        left_edge = data(:,1);
        right_edge = data(:,3);
    end
    if ~isempty(extra)
        if isfield(extra,'t_start')
            t_start = extra.t_start;
        end
        if isfield(extra,'x_start')
            x_start = extra.x_start;
        end
    end
    
    ima=imread(image);
    
    % Number of timepoints in the original kymo
    original_tpts = size(ima,1);
    original_width = size(ima,2);
    centered_kymo = zeros(original_tpts,original_width*2);
    
%     figure()
%     imshow(ima,contrast,'InitialMagnification','fit');
%     hold on
%     plot(data.left_edge.x,data.left_edge.y);
%     plot(data.right_edge.x,data.right_edge.y);
    for i = 1:original_tpts
        center = round((right_edge(i) + left_edge(i))/2);
        start = original_width-center;
        finish = start + original_width-1;
        centered_kymo(i,start:finish) = ima(i,:);
    end
    centered_kymo = centered_kymo(:,original_width/2:original_width*1.5);
    
    figure
    imshow(centered_kymo,contrast,'InitialMagnification','fit')
    if only_scalebar
        return
    end
    hold on

    
    t_end = t_start + 5/t_res;
    plot([x_start x_start],[t_start t_end],'y','lineWidth',3)

    
    x_end = x_start + 2/x_res;
    plot([x_start x_end],[t_start t_start],'y','lineWidth',3)


end

