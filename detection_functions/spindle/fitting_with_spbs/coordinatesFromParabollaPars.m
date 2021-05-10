function [x_out,y_out] = coordinatesFromParabollaPars(spb_1,spb_2,par,x_in)
    
    % This is correct
    y_in = evaluateOrthogonalParabolla(spb_1,spb_2,par,x_in);    
    
    center_spbs = (spb_1 + spb_2)/2;
    old_par = convertParabollaFit2OldFit(spb_1,spb_2,par);
    
    [x_out,y_out]=rotateThenShift(x_in,y_in,center_spbs(1),center_spbs(2),-old_par(1));
end

