% template_convert

% Rename this script for each separate project or cohort of files that need
% converting

% Change folder to master folder for the project
folder = 'R:\DA_and_Reward\es334\PPP1\'

tankfolder = strcat(folder, 'tdtfiles\');
savefolder = strcat(folder, 'matfiles\');

% If you want to reconvert files rather than skipping set skipfiles to 0
skipfiles = 1;
processfiles = 0;

% Change xlfile to name of file that contains metadata and change sheet
% appropriately
xlfile = strcat(folder,'template.xlsx');
sheet = 'metafile';
[~,~,a] = xlsread(xlfile,sheet);

TDTmasterconvert(a, tankfolder, savefolder,...
     skipfiles, processfiles);

%%%
% lines for for testing
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

% 
% tank = 'R:\DA_and_Reward\Shared\Scripts\THPH Tanks\Kate-170810-072909';
% data = TDTbin2mat(tank);
% 
% tank = 'R:\DA_and_Reward\gc214\PPP3\tdtfiles\Giulia-180709-083142';
% data = TDTbin2mat(tank);
% 
% tank = 'R:\DA_and_Reward\gc214\PPP3\tdtfiles\Giulia-180709-100216';
% data = TDTbin2mat(tank);
