% TDT test convert - mini-script for testing TDT conversion scripts
% In general, a similar script should be stored for each set of conversions
% somewhere near the data folder

[folder, name, ext] = fileparts(which(mfilename('fullpath')));

metafile = strcat(folder, '\test_metafile_2boxes.txt');
tankfolder = 'R:\DA_and_Reward\Shared\Scripts\THPH Tanks\';
savefolder = 'R:\DA_and_Reward\Shared\Scripts\Matlab Files\test_output\';

txtfileformat = '%s %s %s %d %s %d %d %d %d %f %s %s %s %s %s %s %s %d';

TDTmasterconvert(metafile, tankfolder, savefolder, 1, 0, 2, txtfileformat, 6, 3, 5);
