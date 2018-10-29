% This script is for just trying tro reconvert single sessions that might
% have gone worng or for testing

[folder, name, ext] = fileparts(which(mfilename('fullpath')));

folder = 'R:\DA_and_Reward\es334\PPP1\'

tankfolder = strcat(folder, 'tdtfiles\');
savefolder = strcat(folder, 'matfiles\');

skipfiles = 0;
processfiles = 0;
nboxes = 2;

metafile = strcat(folder,'PPP1.xlsx');
sheet = 'metafile';
[~,~,a] = xlsread(metafile,sheet);

header = a(1,:);
input = a(50,:);

b = cat(1,header,input);
TDTmasterconvert(b, tankfolder, savefolder,...
     skipfiles, processfiles, nboxes);

 
%%%
% for testing
% tic
% clear all; close all;
% tank = 'R:\DA_and_Reward\es334\PPP1\tdtfiles\Eelke-171024-101252'
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
