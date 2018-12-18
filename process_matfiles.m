% Script for processing files
%
%data = TDTbin2mat('R:\DA_and_Reward\gc214\PPP3\tdtfiles\Giulia-180720-090328')
sigs{1} = 'D1B2'
sigs{2} = 'D2B2'

output.info = data.info

% Assigns processed data to new variables for easier referencing
output.blue = data.streams.(char(sigs{1})).data';
output.uv = data.streams.(char(sigs{2})).data';
output.fs = data.streams.(char(sigs{1})).fs;

output = FPfftfilt(output)




