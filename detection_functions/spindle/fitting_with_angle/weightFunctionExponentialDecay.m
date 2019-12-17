function [weight] = weightFunctionExponentialDecay(xx,yy,zz,pars,second_degree,settings)
    

    [xx,yy]=centerThenRotate(xx,yy,pars(2),pars(3),pars(1));
    
    if second_degree
        expected = pars(4)*xx.^2;
    else
        expected = 0;
    end
    intens_diff = zz;
    
    sign = (intens_diff>0)*2-1;
    weight = sign.*(intens_diff).^2.*(exp(-abs(expected-yy)/settings.decay_length) -settings.weight_center*abs(xx));
%     weight = (zz-bg).^2.*exp(-abs(expected-yy)/10);
    weight = -sum(weight) ;
end

