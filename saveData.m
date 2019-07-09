function saveData(prefix, variablesToSave, varargin)
    filename = makeFilename(prefix, varargin{:});
    save(filename, variablesToSave{:});
end