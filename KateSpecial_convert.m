% TDT test convert - mini-script for testing TDT conversion scripts
% In general, a similar script should be stored for each set of conversions
% somewhere near the data folder

[folder, name, ext] = fileparts(which(mfilename('fullpath')));

folder = 'R:\DA_and_Reward\kp259\CONVERSION_14th Aug\';

skipfiles = 1;
processfiles = 0;
nboxes = 2;

metafile = strcat(folder,'KateSpecialConvert.xlsx');


% tankfolder = strcat(folder, 'cTHPH Lick and Dis tanks\');
% savefolder = strcat(folder, 'cTHPH matfiles\');
% 
% sheet = 'cTHPH1_metafile';
% [~,~,a] = xlsread(metafile,sheet);
% 
% TDTmasterconvert(a, tankfolder, savefolder,...
%      skipfiles, processfiles, nboxes);

 
%  
% tankfolder = strcat(folder, 'NAPH Habituation tanks\');
% savefolder = strcat(folder, 'NAPH matfiles\');
% 
% sheet = 'NAPH1_metafile';
% [~,~,a] = xlsread(metafile,sheet);
% 
% TDTmasterconvert(a, tankfolder, savefolder,...
%      skipfiles, processfiles, nboxes);
 
 
tankfolder = strcat(folder, 'THPH1 Habituation tanks\');
savefolder = strcat(folder, 'THPH1 matfiles\');

sheet = 'THPH1_metafile';
[~,~,a] = xlsread(metafile,sheet);

TDTmasterconvert(a, tankfolder, savefolder,...
     skipfiles, processfiles, nboxes);
 
% tank = 'R:\DA_and_Reward\kp259\CONVERSION_14th Aug\THPH1 Habituation tanks\Kate-170622-132308';
% data = TDTbin2mat(tank);
