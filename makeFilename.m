function filename = makeFilename(prefix, varargin)
    filename = [prefix, cellfun(@string,varargin,'UniformOutput',false)];
    filename = strjoin(filename,'-');
    filename = replace(filename, '.', '_');
end