function append2log(file, msg)

fid = fopen(file, 'a');
fprintf(fid, '%s: %s\r\n', datestr(now, 0), msg);
fclose(fid);
