function [] = editConfigFile(file_name,varargin)
    
    nb_kwargs = numel(varargin);
    
    % Should be a text file
    if ~isfile(file_name)
        error("%s is not a file",file_name)
    end
    
    % Should be a multiple of 2
    if mod(nb_kwargs,2)~=0
        error("Arguments after file name should be paris of str, value",file_name)
    end
    
    % Read the previous config file
    config = readConfigFile(file_name);
    
    % Add/replace existing fields
    for i = 1:2:numel(varargin)
        key = varargin{i};
        value = varargin{i+1};
        config.(key) = value;
    end
    
    % Write the config file again
    writeConfigFile('dummy.txt',config)
    
end

