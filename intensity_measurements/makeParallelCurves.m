function [xx,yy] = makeParallelCurves(x,y,pars,range,spacing)

% Write coordinates of the line defined in x,y in the alternative system of coords
    
    [x,y] = centerThenRotate(x,y,pars(2),pars(3),pars(1));
    
% Create lines paralel to the original curve in the current system

    nb_slices = range*2+1 ;
    nb_vals = numel(x);
    
    % We then add the slices
    xx = zeros(nb_slices,nb_vals);
    yy = xx;
    
    % disp is the displacement in the direction of the axis
    disp = -range*spacing:spacing:range*spacing;

    for i = 1:nb_slices
        [xx(i,:),yy(i,:)]=rotateThenShift(x,y+disp(i),pars(2),pars(3),-pars(1));
    end
    
    
end

