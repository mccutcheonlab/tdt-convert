function TDTquickprocess(metadata, matfiles)

dirListing = dir(matfiles);

for d = 3:length(dirListing)
    if strcmp(regexp(dirListing(d).name, 'mat', 'match'), 'mat');
        fileName = fullfile(matfiles,dirListing(d).name);
        load(fileName)
        if isfield(output, 'bluefilt') ~= 1
            output = FPfftfilt(output);
            length(output.bluefilt)
            save(fileName, 'output', '-v6');
        end
    end
end





