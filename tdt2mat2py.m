function [output] = tdt2mat2py(tank, rat, session, dataToOutput, savefolder)


clear all; close all;
% Options
skipFiles = 1;
processFiles = 0;

% Checks to make sure user wants to overwrite
if skipFiles == 1
    prompt = 'Are you sure you want to overwrite old files? Y/N [Y]: ';
    str = input(prompt,'s');
    if isempty(str)
        str = 'Y';
    end
    if str ~= 'Y'
        msgbox('No problem. Exiting program.')
        return
    end
elseif skipFiles ~= 1
    msgbox('The value in skipFiles is not valid. Must be 0 or 1.')
    return
end

% Checks that processFiles input is valid
if processFiles ~= 0 & processFiles ~= 1
    msgbox('The value in processFiles is not valid. Must be 0 or 1.')
    return
end

% Folder locations
metafileFolder = 'C:\Users\James Rig\Dropbox\Python\photometry\';
metafile = strcat(metafileFolder,'thph1-forMatPy.txt');
dataFolder = 'R:\DA_and_Reward\kp259\THPH1\THPH1 Tanks\';
saveFolder = 'C:\Users\James Rig\Dropbox\Python\matlab files\';

% Open metafile
fid = fopen(metafile);
C = textscan(fid, '%s %s %s %d %f %d %s %s %s','Delimiter','\t','HeaderLines',1);
fclose(fid);

% Loop through rows in metafile
for i = 1:size(C{1,1},1)
    if C{1,6}(i) == 1 % checks to see if Row is to be included or not
        TDTfile = char(strcat(dataFolder,C{1,1}(i)));
        rat = char(C{1,3}(i));
        session = strcat('s',num2str(C{1,5}(i)));
        
        if skipFiles == 0
            if processFiles == 0
                tdt2mat2py(TDTfile,rat,session,0,saveFolder)
            else
                tdt2mat2py(TDTfile,rat,session,1,saveFolder)
            end
            
        else
            if processFiles == 0
                if exist(strcat(saveFolder,rat,session,'.mat')) == 0
                    tdt2mat2py(TDTfile,rat,session,0,saveFolder)
                end
            else
                if exist(strcat(saveFolder,rat,session,'-p.mat')) == 0
                    tdt2mat2py(TDTfile,rat,session,1,saveFolder)
                end
            end                     
        end
    end
end
        

    
    
