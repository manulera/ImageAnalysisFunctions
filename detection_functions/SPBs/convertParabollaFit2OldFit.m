function [old_par] = convertParabollaFit2OldFit(spb_1,spb_2,par)
    
    centering_point = (spb_1 + spb_2)/2;
    angle=angle2Points(spb_1,spb_2);
    norm_vector = (spb_2-spb_1)/norm(spb_2-spb_1);
    distance2center = distancePoints(spb_1,spb_2)/2;
    
    ortho_vector = norm_vector([2,1]) .* [1,-1];
    new_centering = centering_point - ortho_vector*par;
    
    old_par = [angle new_centering -par/distance2center^2];
    
end

