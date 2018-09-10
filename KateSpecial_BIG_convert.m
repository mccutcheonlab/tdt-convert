% TDT test convert - mini-script for testing TDT conversion scripts
% In general, a similar script should be stored for each set of conversions
% somewhere near the data folder

[folder, name, ext] = fileparts(which(mfilename('fullpath')));

folder = 'R:\DA_and_Reward\kp259\BIG CONVERSION 14 AUG 2018\';

skipfiles = 1;
processfiles = 0;
nboxes = 2;

metafile = strcat(folder,'KateSpecialBigConvert.xlsx');

% cTHPH1
tankfolder = 'R:\DA_and_Reward\kp259\cTHPH1\Tanks\';
savefolder = strcat(folder, 'cTHPH matfiles\');

sheet = 'cTHPH1_metafile';
[~,~,a] = xlsread(metafile,sheet);

TDTmasterconvert(a, tankfolder, savefolder,...
     skipfiles, processfiles, nboxes);

% NAPH1
tankfolder = 'R:\DA_and_Reward\kp259\NAPH1\TANKS\';
savefolder = strcat(folder, 'NAPH matfiles\');

sheet = 'NAPH1_metafile';
[~,~,a] = xlsread(metafile,sheet);

TDTmasterconvert(a, tankfolder, savefolder,...
     skipfiles, processfiles, nboxes);
 
% THPH1
tankfolder = 'R:\DA_and_Reward\kp259\THPH1\THPH1 Tanks\';
savefolder = strcat(folder, 'THPH matfiles\');

sheet = 'THPH1_metafile';
[~,~,a] = xlsread(metafile,sheet);

TDTmasterconvert(a, tankfolder, savefolder,...
     skipfiles, processfiles, nboxes);
 

% THPH2
tankfolder = 'R:\DA_and_Reward\kp259\THPH2\Tanks\';
savefolder = strcat(folder, 'THPH matfiles\');

sheet = 'THPH2_metafile';
[~,~,a] = xlsread(metafile,sheet);

TDTmasterconvert(a, tankfolder, savefolder,...
     skipfiles, processfiles, nboxes);
 

% 
% tank = 'R:\DA_and_Reward\kp259\THPH2\Tanks\Kate-170811-093622';
% data = TDTbin2mat(tank);
