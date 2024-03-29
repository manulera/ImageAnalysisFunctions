function [result] = weightedOrthogonalFit(ima,mask,bg,sugg,second_degree,mode)
if nargin<6 ||isempty(mode)
    mode = 1;
end
% sugg(1)=atan(sugg(1));

% lis = regionprops(mask & ~isnan(ima),ima,'PixelList','PixelValues');
% xx = lis.PixelList(:,1);
% yy = lis.PixelList(:,2);
% zz = lis.PixelValues;

[xx,yy,zz] = coordinatesAndValuesInMask(mask & ~isnan(ima),ima);

switch mode
    case 1
        settings = struct();
        settings.weight_center=0.001;
        settings.decay_length = 5;
        fun = @(pars) weightFunctionExponentialDecay(xx,yy,zz-bg,pars,second_degree,settings);
    case 2
        settings = struct();
        settings.weight_center=10;
        fun = @(pars) weightFunctionIntensity(xx,yy,zz-bg,pars,second_degree,settings);
    case 3
        fun = @(pars) weightFunctionDistanceOnly(xx,yy,pars,second_degree,'robust');
    case 4
        fun = @(pars) weightFunctionDistanceOnly(xx,yy,pars,second_degree,'least-squares');
end

opts = optimset('MaxFunEvals',5000, 'MaxIter',1000);

result = fminsearch(fun, sugg, opts);
if ~second_degree
    result(4)=0;
end
end

