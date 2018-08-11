

[folder, name, ext] = fileparts(which(mfilename('fullpath')));

folder = 'R:\DA_and_Reward\gc214\PPP3\'

% metafile = strcat(folder, 'PPP3_metafile.csv');
tankfolder = strcat(folder, 'tdtfile\');
logfile = strcat(tankfolder, 'test_log.txt');

fid = fopen(logfile, 'w');
fprintf(fid, '%s: %s\r\n', datestr(now, 0), 'Attempting to convert...');
fclose(fid)

fid = fopen(logfile, 'a');
fprintf(fid, '%s: %s\r\n', datestr(now, 0), 'will this be on a new poo?');
fclose(fid)


append2log(logfile, 'hey there')
append2log(logfile, 'will this be on a new poohead?')


R:\DA_and_Reward\gc214\PPP3\tdtfile\Giulia-180727-113015, PPP3-1
