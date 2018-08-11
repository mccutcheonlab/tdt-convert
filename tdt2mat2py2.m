function [output] = tdt2mat2py2(tank, rat, session, sigs, ttls, savefilename)

% clear all; close all 
% rat = 'thph2.2';
% session = 's1';
% tank = 'R:\DA_and_Reward\gc214\PPP3\tdtfile\Giulia-180709-100216';
% blueName = 'Dv1B'
% uvName = 'Dv2B'
% licksName = 'LiA_'
% savefolder = 'R:\DA_and_Reward\kp259\THPH2\TestSave\'

%% Extracts photometry data and fits signal FROM MULTIPLE BOXES (if there are multiple)
% Reads in TDT data into structured array using TDT function
fileinfo = strcat({'Rat '},rat,{': Session '}, session);
data = TDTbin2mat(tank);

%% Puts info into output file
output.info = data.info

% Assigns processed data to new variables for easier referencing
output.blue = data.streams.(char(sigs{1})).data';
output.uv = data.streams.(char(sigs{2})).data';
output.fs = data.streams.(char(sigs{1})).fs;
    
%% Gets TTLs
% This short code ensures that illeagal characters, such as underscores,
% aren't included
try
    output.tick = data.epocs.Tick.onset;
catch
    output.tick = data.scalars.Pars.ts(1:2:end)
end
    
for x = 1:size(ttls,2)
    try
        output.(char(ttls{x})) = data.epocs.(char(ttls{x}));
    catch
        sprintf('TTL %s not found in data structure', char(ttls{x}))
    end
end


%% Save file with appropriate name

save(savefilename, 'output', '-v6');