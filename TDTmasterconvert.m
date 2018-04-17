function TDTmasterconvert(metafile, tankfolder, savefolder,... 
                            skipfiles, processfiles, nboxes,...
                            txtfileformat, includecol, ratcol, sessioncol)

% Checks to make sure user wants to overwrite and value in skipfiles is
% valid

if skipfiles == 0
    prompt = 'Are you sure you want to overwrite old files? Y/N [N]: ';
    str = input(prompt,'s');
    if isempty(str)
        str = 'N';
    end
    if str ~= 'Y'
        msgbox('No problem. Exiting program.')
        return
    end
elseif skipfiles ~= 1
    msgbox('The value in skipfiles is not valid. Must be 0 or 1.')
    return
end

% Checks that processFiles input is valid
if processfiles ~= 0 & processfiles ~= 1
    msgbox('The value in processfiles is not valid. Must be 0 or 1.')
    return
end

% Checks that folder locations are valid
if exist(tankfolder, 'dir') ~= 7
    msgbox('Tank folder does not appear to exist. Exiting.')
    return
end

if exist(savefolder, 'dir') ~= 7
    msgbox('Save folder does not appear to exist. Exiting.')
    return
end

% Open metafile
try
    fid = fopen(metafile);
    C = textscan(fid, txtfileformat,'Delimiter','\t','HeaderLines',1);
    fclose(fid);

    ncols = size(C,2);
    nrows = size(C{1},1);
    
    sprintf('Input file detected with %d columns and  %d rows.', ncols, nrows)
catch
    msgbox('Metafile could not be read.')
    return
end

% Checks columns are OK
if includecol > ncols | ratcol > ncols | sessioncol > ncols
    msgbox('Check column inputs, not enough columns in metafile.')
    return
end

% Loop through rows in metafile
for i = 1:size(C{1,1},1)
    if C{1,includecol}(i) == 1 % checks to see if Row is to be included or not
        TDTfile = char(strcat(tankfolder,C{1,1}(i)));
        
        rat = strrep(char(C{1,3}(i)), '.', '-'); % Extracts rat and removes period
        
        if iscellstr(C{1,5}(i)) == 1
            session = C{1,5}(i);
        else
            session = strcat('s',num2str(C{1,5}(i)));
        end
        
        savefilename = char(strcat(savefolder,rat,'_',session,'.mat'))
        
        if skipfiles == 0
            tdt2mat2py(TDTfile,rat,session,0,savefolder)
        else
            if exist(savefilename) == 0
                msgbox(savefilename)
%                 tdt2mat2py(TDTfile,rat,session,0,savefolder)
            end
        end
    end
end


msgbox('Hey hey')
