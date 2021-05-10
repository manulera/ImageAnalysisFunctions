function [weight] = weightFunctionConstrainedIntensity(xx,yy,zz,distance2center,pars,settings)
    
    % All parabollas that pass the two points have this form:
    expected = -pars(1)/distance2center^2*xx.^2 + pars(1);
    
    intens_diff = zz;
    
    sign = (intens_diff>0)*2-1;
    weight = sign.*(intens_diff).^2.*(exp(-abs(expected-yy)/settings.decay_length));
    
    
    %     weight = (zz-bg).^2.*exp(-abs(expected-yy)/10);
%     weight = sign.*(intens_diff).^2;
    weight = -sum(weight)/(max(xx)-min(xx)) ;
end

