% TDT test convert - mini-script for testing TDT conversion scripts
% In general, a similar script should be stored for each set of conversions
% somewhere near the data folder

[folder, name, ext] = fileparts(which(mfilename('fullpath')));

metafile = strcat(folder, '\test_metafile_2boxes.csv');
tankfolder = 'C:\Users\James Rig\Documents\Test data\';
savefolder = 'C:\Users\James Rig\Documents\Test data\';

txtfileformat = '%s %s %s %d %s %d %d %d %d %f %s %s %s %s %s %s %s %d';

TDTmasterconvert(metafile, tankfolder, savefolder, 1, 0, 2, txtfileformat, 6, 3, 5);


%%%
% for testing
% tic
% clear all; close all;
% tank = 'R:\DA_and_Reward\Shared\Scripts\THPH Tanks\Kate-170810-072909'
% data = TDTbin2mat(tank);
% toc
% 
% tic
% clear all; close all;
% tank = 'C:\Users\James Rig\Documents\Test data\Kate-170810-072909'
% data = TDTbin2mat(tank);
% toc