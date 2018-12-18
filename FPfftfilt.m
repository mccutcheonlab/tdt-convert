function [data] = FPfftfilt(data)
% First load all your data files into a structure of data(idx).__ where
% data(idx).sig is the 465nm signal and data(idx).baq is the 405nm signal
% and idx = number of data files to be processed

[c,d]=butter(9,0.012,'low');
    for idx = 1:size(data,2)
        pt = length(data(idx).blue); %length of data
        X = fft(data(idx).uv,pt); %405nm signal in freq domain
        Y = fft(data(idx).blue,pt); %465nm signal in freq domain
        Ynet = Y-X; %freq domain subtraction
        data(idx).bluefilt = detrend(double(real(ifft((Ynet))))); %inverse of real conjugates of fft to get back time domain of 465nm
        data(idx).uvfilt = detrend(double(real(ifft(X)))); %inverse of real conjugates of fft to get back time domain of 405nm
        data(idx).bluefilt = filtfilt(c,d,data(idx).bluefilt); %apply lowpass filter to get rid of high freq noise added by the subtraction
    end
end