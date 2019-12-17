function [mask] = paralellCurves2Mask(xx,yy,siz)
    
    x_perif = matrixPerifery(xx);
    y_perif = matrixPerifery(yy);
    mask = poly2mask(x_perif,y_perif,siz(1),siz(2));
end

