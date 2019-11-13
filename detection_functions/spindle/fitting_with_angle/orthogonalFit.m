function [result] = orthogonalFit(x,y,sugg,second_degree,mode)
    
    fun = @(pars) weightFunctionDistanceOnly(x,y,pars,second_degree,mode);

    opts = optimset('MaxFunEvals',5000, 'MaxIter',1000);

    result = fminsearch(fun, sugg, opts);
    
    if ~second_degree
        result(4)=0;
    end
end