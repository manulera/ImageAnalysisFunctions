function [profile,local_background] = multiple2SingleImprofile(ints,p)
    
    signal = false(1,p.total_width*2+1);
%     p.signal_width = 1;
    signal(p.center_line-p.signal_width:p.center_line+p.signal_width)=true;
    background = false(1,p.total_width*2+1);
    bg1 = p.center_line-p.signal_width-1;
    bg2 = p.center_line+p.signal_width+1;
    background([bg1-p.background_width:bg1 bg2:bg2+p.background_width])=true;

    local_background = ints(background,:);
    local_background = median(local_background(:));
    
    profile = sum(ints(signal,:)-local_background);
end

