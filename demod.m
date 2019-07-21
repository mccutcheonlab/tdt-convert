clear all; close all;

% Load in data
file = 'R:\\DA_and_Reward\\es334\\PPP1\\tdtfiles\\Eelke-171103-094134'

file = 'R:\\DA_and_Reward\\fn55\\TQP1\tdtfiles\\Fabien-190308-104143'
data = TDTbin2mat(file, 'T2', 240);

% Extract already demodulated signal from file
t_blue_fs = data.streams.D1B2.fs;
t_blue = 0:(1/t_blue_fs):240;
blue = data.streams.D1B2.data;

% Specify start and stop of analysis window and plot demodulated signal
t_start = 150;
t_length = 20;

f_online = figure()
plot(t_blue(150000:170000), blue(150000:170000))

% Calculate length of raw signal to extract
rawfs = data.streams.Fi2r.fs;
sample_0 = t_start*rawfs;
sample_end = sample_0 + rawfs*t_length;

% Extract raw and ref signals
raw = double(data.streams.Fi2r.data(5,sample_0:sample_end));
ref = double(data.streams.Fi2r.data(1,sample_0:sample_end));

raw = double(data.streams.Fi2r.data(5,:));
ref = double(data.streams.Fi2r.data(1,:));

% To generate simulated reference signal - not needed if using signals from
% data file

% f=211.0;
% Amp=1;
ts = 1/rawfs;
t = 0:ts:t_length; 
% y1=sin(2*pi*f*t);
% y2=cos(2*pi*f*t);

% To extract reference signal from data file and create 90 degree shifted
% copy

y1 = ref;
y2 = imag(hilbert(y1));

% Multiply raw signal by reference signals
z1 = y1 .* raw;
z2 = y2 .* raw;

% Create low pass filter (15 Hz) and apply to signals
fc = 15;

[b,a] = butter(6,fc/(rawfs/2));
z1_filt = filter(b,a,z1);
z2_filt = filter(b,a,z2);

% Alternative filter options
% z1_filt = lowpass(z1,15,rawfs);
% z2_filt = lowpass(z2,15,rawfs);

% Combine signals in quadrature
z_total = 2 * sqrt(z1_filt.^2 +z2_filt.^2);

% Resample at ~1 kHz and lowpass filter
resample_fs = t_blue_fs;
[z_y, z_t] = resample(z_total, t, resample_fs);

fc = 6; % Change this for different low pass filter options
[b,a] = butter(6,fc/(resample_fs/2));
z_y_filt = filter(b,a,z_y);

% Plot demodulated signal
f_demod = figure()
plot(z_t, z_y_filt)

