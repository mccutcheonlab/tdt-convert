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
    header = strsplit(fgetl(fid), ',')
    C = textscan(fid, txtfileformat,'Delimiter',',','HeaderLines',0);
    fclose(fid);

    ncols = size(C,2);
    nrows = size(C{1},1);
    
    sprintf('Input file detected with %d columns and  %d rows.', ncols, nrows)

    rat_index = strfind(header, 'rat');
    rat_col = find(not(cellfun('isempty', rat_index)));
    
    session_index = strfind(header, 'session');
    session_col = find(not(cellfun('isempty', session_index)));
    
    sig_index = strfind(header, 'sig');
    sig_cols = find(not(cellfun('isempty', sig_index)));

    ttl_index = strfind(header, 'ttl');
    ttl_cols = find(not(cellfun('isempty', ttl_index)));
    
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
        
        rat = strrep(char(C{1,rat_col}(i)), '.', '-'); % Extracts rat and removes period
        
        if iscellstr(C{1,session_col}(i)) == 1
            session = C{1,session_col}(i);
        else
            session = strcat('s',num2str(C{1,session_col}(i)));
        end
        
        sigs = {C{1,sig_cols(1)}(i) C{1,sig_cols(2)}(i)}
        for x = 1:size(ttl_cols,2)
            ttls{x} = C{1,ttl_cols(x)}(i)
        end
        
        savefilename = char(strcat(savefolder,rat,'_',session,'.mat'))
        
        if skipfiles == 0
            tdt2mat2py2(TDTfile,rat,session,sigs,ttls,savefilename)
        else
            if exist(savefilename) == 0
                msgbox(savefilename)
                tdt2mat2py2(TDTfile,rat,session,sigs,ttls,savefilename)
            end
        end
    end
end

