function [samples] = sample(sc)
% SAMPLE - Outputs an nx2 matrix of samples and their
% respective times
% 
% Inputs:  sc, multiple of max frequency to sample at
%
% Outputs: samples, column1=times column2=amplitudes

f=1000;% Frequency of function
fm = func_bandlimit(f); % Maximum frequency in bandlimited sample
tstop = 30/f; % Stop time
fs = sc*fm; % Sampling frequency
ts = 1/fs; % Sampling period
tsample = 0:ts:tstop; % Sample time vector
fsample = func(tsample,f);
samples = [tsample',fsample'];
end

