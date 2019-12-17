function [x,y] = orthogonalPolyEval(x,pars)
    % [x,y] = orthogalPolyEval(x,pars)
    % Evaluate the orthogonal polynomium described in pars, for the values in x
    % x (in the rotated axes), and return x,y coordinates in the non-rotated
    % system.

    y = pars(4)*x.^2;
    [x,y]=rotateThenShift(x,y,pars(2),pars(3),-pars(1));


end

