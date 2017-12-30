%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reconstruct.m
% Script to reconstruct func using sincinterp
% DWM 15/9/11
% Inputs:  f - frequency of signal
%          ccoeff - multiple of f to cut off at
%          scoeff - multiple of fm to sample at
%
% Outputs: I - integral of error squared
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function I = reconstruct(f,ccoeff,scoeff)

  fm     = ccoeff*f;          % chose frequency above f to cut off at
  wm     = 2*pi*fm;           % bandlimit in radians
  tstart = 0;                 % start time: arbitrary
  tstop  = 30/f;              % stop time: arbitrary

% Choose sampling frequency
  fs = scoeff*fm;             % close to the minimum allowed
  ts = 1/fs;                  % Hence sampling period

% Sample the function
  tsample = tstart:ts:tstop;
  fsample = func(tsample,f);
  nsamples = length(fsample);

% Determine times tr where you want reconstruction
  tstep = ts/10;              % say 10 per orig sample
  tr = tstart:tstep:tstop;
  
% Reconstruct at these times  % Ugly code warning
  for n=1:length(tr)
    fr(n) = sincinterp(tr(n),fsample,tsample,ts,wm,1,nsamples);
  end;
  fo = func(tr,f);            % Find original func values
  err = fr-fo;                % Hence a vector of errors
  
% Quantify error
  errsq = err.^2;             % Square error values so no negative error
  I = trapz(tr,errsq);