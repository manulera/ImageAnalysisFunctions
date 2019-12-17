function [ints,tot_int] = spindleLinescan(x,y,fit,ima)
    
    p = defaultSpindleParameters();
    [xx,yy]=makeParallelCurves(x,y,fit,p.total_width,1);
    % We store the whole image profile
    ints = multipleImprofile(xx,yy,ima,'bicubic');
    single_profile = multiple2SingleImprofile(ints,p);
    tot_int = sum(single_profile);
    
end

