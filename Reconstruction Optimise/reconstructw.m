%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reconstruct.m
% Script to reconstruct func using sincinterp
% DWM 15/9/11
% Inputs:  wt - type of sinc windowing to use
%           M - window limit (multiples of Ts)
%           f - frequency of signal
%          bf - multiple of f to bandlimit at
%          sf - multiple of fm to sample at
%
% Outputs: I - integral of error squared
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function I = reconstructw(wt,M,f,bf,sf)
  fm     = bf*f;          % chose frequency above f to cut off at
  wm     = 2*pi*fm;           % bandlimit in radians
  tstart = 0;                 % start time: arbitrary
  tstop  = 30/f;              % stop time: arbitrary

% Choose sampling frequency
  fs = sf*fm;             % close to the minimum allowed
  ts = 1/fs;                  % Hence sampling period

% Sample the function
  tsample = tstart:ts:tstop;
  fsample = func(tsample,f);
  nsamples = length(fsample);

% Determine times tr where you want reconstruction
  tstep = ts/10;              % say 10 per orig sample
  tr = tstart:tstep:tstop;
  
% Reconstruct at these times
  fr = sincinterpw(wt,M,tr,fsample,tsample,ts,wm); % interpolate samples
  fo = func(tr,f);            % Find original func values
  err = fr-fo;                % Hence a vector of errors
  
% Quantify error
  errsq = err.^2;             % Square error values so no negative error
  I = trapz(tr,errsq);