function TDTmasterconvert(metadata, tankfolder, savefolder,... 
                            skipfiles, processfiles, nboxes)
% Initialize log file

logfile = strcat(savefolder, 'conversion_log.txt');
fid = fopen(logfile, 'w');
fprintf(fid, '%s: %s\r\n', datestr(now, 0), 'Attempting to convert...');
fclose(fid)

% Checks to make sure user wants to overwrite and value in skipfiles is
% valid

if skipfiles == 0
    prompt = 'Are you sure you want to overwrite old files? Y/N [N]: ';
    str = input(prompt,'s');
    if isempty(str)
        str = 'N';
    end
    if str ~= 'Y'
        append2log(logfile, 'User did not want to overwrite files so exited program.')
        msgbox('No problem. Exiting program.')
        return
    end
elseif skipfiles ~= 1
    append2log(logfile, 'The value in skipfiles was not valid so exited program.')
    msgbox('The value in skipfiles is not valid. Must be 0 or 1.')
    return
end

% Checks that processFiles input is valid
if processfiles ~= 0 & processfiles ~= 1
    append2log(logfile, 'The value in processfiles was not valid so exited program.')
    msgbox('The value in processfiles is not valid. Must be 0 or 1.')
    return
end

% Checks that folder locations are valid
if exist(tankfolder, 'dir') ~= 7
    append2log(logfile, 'The Tank Folder does not appear to exist so exited program.')
    msgbox('Tank folder does not appear to exist. Exiting.')
    return
end

if exist(savefolder, 'dir') ~= 7
    append2log(logfile, 'The Save Folder does not appear to exist so exited program.')
    msgbox('Save folder does not appear to exist. Exiting.')
    return
end

% Open metafile
try
    if ismatrix(metadata) == 1
        header = metadata(1,:);
        C = metadata(2:end,:);
    else
        append2log(logfile, 'The Metafile could not be read so exited program.');
        msgbox('Metafile could not be read.')
        return
    end
    
    ncols = size(C,2);
    nrows = size(C{1},1);
    
    msg = sprintf('Input file detected with %d columns and %d rows.', ncols, nrows)
    append2log(logfile, msg);

    rat_index = strfind(header, 'rat');
    rat_col = find(not(cellfun('isempty', rat_index)));
    
    session_index = strfind(header, 'session');
    session_col = find(not(cellfun('isempty', session_index)));
    
    include_index = strfind(header, 'include-mat');
    include_col = find(not(cellfun('isempty', include_index)));
    
    sig_index = strfind(header, 'sig-');
    sig_cols = find(not(cellfun('isempty', sig_index)));

    ttl_index = strfind(header, 'ttl-');
    ttl_cols = find(not(cellfun('isempty', ttl_index)));
    
catch
    append2log(logfile, 'The Metafile could not be read so exited program.');
    msgbox('Metafile could not be read.')
    return
end

% Loop through rows in metafile
for i = 1:size(C,1)
    if C{i,include_col} == 1 % checks to see if Row is to be included or not

        TDTfile = char(strcat(tankfolder,C{i,1}));      
        rat = strrep(char(C{i,rat_col}), '.', '-'); % Extracts rat and removes period
        
        if ischar(C{i,session_col}) == 1
            session = C{i,session_col};
        else
            session = strcat('s',num2str(C{i,session_col}));
        end
        
        sigs = {C{i,sig_cols(1)} C{i,sig_cols(2)}};
        for x = 1:size(ttl_cols,2)
            ttls{x} = C{i,ttl_cols(x)};
        end
        
        savefilename = char(strcat(savefolder,rat,'_',session,'.mat'))

        try
            if skipfiles == 0
                tdt2mat2py2(TDTfile,rat,session,sigs,ttls,savefilename);
            else
                if exist(savefilename) == 0
                    tdt2mat2py2(TDTfile,rat,session,sigs,ttls,savefilename);
                    msg = strcat('Rat ',rat,'_',session,' converted successfully (I think).')
                    append2log(logfile, msg); 
                else
                    msg = strcat('Skipping Rat ',rat,'_',session)
                    append2log(logfile, msg);
                end
            end
        catch
            msg = strcat('Rat ',rat,'_',session,' could not be read. May be corrupted.')
            append2log(logfile, msg);
        end
    end
end

