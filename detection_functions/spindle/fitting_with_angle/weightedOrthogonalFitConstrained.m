function [result] = weightedOrthogonalFitConstrained(ima,mask,bg,spb_1,spb_2,mode,sugg)

if nargin<7||isempty(sugg)
    sugg = 10;
end

[xx,yy,zz] = coordinatesAndValuesInMask(mask & ~isnan(ima),ima);

centering_point = (spb_1+spb_2)/2;
angle=angle2Points(spb_1,spb_2);
distance_center_points = distancePoints(spb_1,spb_2)/2;
[xx,yy]=centerThenRotate(xx,yy,centering_point(1),centering_point(2),angle);

switch mode
    case 1
        settings.decay_length = 5;
        settings.weight_center=0.001;
        fun = @(pars) weightFunctionConstrainedIntensity(xx,yy,zz-bg,distance_center_points,pars,settings);
end

opts = optimset('MaxFunEvals',5000, 'MaxIter',1000);

% Try -50:50

p_try = -50:50;
weight = zeros(size(p_try));

for i = 1:numel(p_try)
    weight(i) = fun(p_try(i));
end

[~,chosen] = min(weight);

result = fminsearch(fun, p_try(chosen), opts);
end

