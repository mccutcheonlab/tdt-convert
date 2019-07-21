function TDTquickprocess(matfiles)

dirListing = dir(matfiles);

for d = 3:length(dirListing)
    if strcmp(regexp(dirListing(d).name, 'mat', 'match'), 'mat');
        fileName = fullfile(matfiles,dirListing(d).name);
        [path, name, ext] = fileparts(fileName);
        fileOut = strcat(path, '\', name, '_proc.mat')
        load(fileName);
        if isfield(output, 'bluefilt') ~= 1
            output = FPfftfilt(output);
            length(output.bluefilt)
            save(fileOut, 'output', '-v6');
        end
    end
end





