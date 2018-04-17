function [output] = tdt2mat2py(tank, rat, session, dataToOutput, savefolder)

% dataToOutput = 0 to get raw signals (no suffix)
% dataToOutput = 1 to get processed signals ("-p" suffix)

% clear all; close all
% 
% rat = 'cas22';
% session = 's1';
% tank = 'D:\Photometry\MCH6\Jaime-170512-120654\';
% process = true

tankfile = char(tank)

%% Extracts photometry data and fits signal

% Reads in TDT data into structured array using TDT function
% fileinfo = strcat({'Rat '},num2str(rat),{': Session '},num2str(session));
data = TDTbin2mat(tankfile);

%% Puts info into output file
output.info = data.info

% Assigns processed data to new variables for easier referencing
sigBlue = data.streams.Dv1A.data';
sigUV = data.streams.Dv2A.data';
output.fs = data.streams.Dv1A.fs;

if dataToOutput == 1
    range = (10000:length(sigBlue-10000)); %chooses range of photometry data to perform the fit over,
    f = fittype('poly1'); % this chooses the fit model, use command cftool to open toobox and check goodness of fit
    
    fit1 = fit(sigBlue(range),sigUV(range),f,'Robust','on');
    
    % Subtracts UV signal from blue signal
    output.result = fit1(sigBlue) - sigUV;
    output.resultUV = sigUV
else
    output.result = sigBlue
    output.resultUV = sigUV
end
    
%% Gets TTLs
% This short code ensures that illeagal characters, such as underscores,
% aren't included

epocs = fieldnames(data.epocs);
for i = 1:length(epocs)
    newName = epocs{i};
    newName = newName(isstrprop(newName,'alphanum'));
    output.(newName) = data.epocs.(epocs{i});
end

%% Save file with appropriate name

if dataToOutput == 1
    savefilename = strcat(savefolder,rat,session,'-p.mat');
else
    savefilename = strcat(savefolder,rat,session,'.mat');
end

save(savefilename, 'output');

    
    
