function [p] = defaultSpindleParameters()
    % Create the default parameters used in spindleLineScan
    p.total_width = 9;
    p.center_line =p.total_width+1;
    p.signal_width = 3;
    p.background_width = 3;
end

