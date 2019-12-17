function [] = writeTiffStack(stack,output_file)
    % writeTiffStack(stack,output_file)
    % Write a stack of 3 dimensions into a tiff file using imwrite.
    
    % Delete the file if it exists, since we are writing in appending mode.
    if isfile(output_file)
        delete(output_file);
    end
    
    for t=1:size(stack,3)
        imwrite(stack(:,:,t),output_file, 'WriteMode', 'append','Compression','none')
    end
end

