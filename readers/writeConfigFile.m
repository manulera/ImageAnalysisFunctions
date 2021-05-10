function [] = writeConfigFile(filename,the_struct)
    
    if ~isstruct(the_struct)
        error('The variable is not a structure')
    end
    
    file_id = fopen(filename,'w');
    
    for ff = fieldnames(the_struct)'
        field_name = ff{1};
        fprintf(file_id,"%s: %s\n",field_name,the_struct.(field_name));
    end
    
end

