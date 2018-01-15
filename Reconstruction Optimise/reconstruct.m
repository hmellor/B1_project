%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reconstruct.m
% Script to reconstruct func using sincinterp
% DWM 15/9/11
% Inputs:  f - frequency of signal
%          bf - multiple of f to bandlimit at
%          sf - multiple of fm to sample at
%
% Outputs: I - integral of error squared
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function I = reconstruct(f,bf,sf)
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

% Determine times tr where you want reconstruction
  tstep = ts/10;              % say 10 per orig sample
  tr = tstart:tstep:tstop;
  
% Reconstruct at these times
  fr = sincinterpv(tr,fsample,tsample,ts,wm); % interpolate samples
  fo = func(tr,f);            % Find original func values
  err = fr-fo;                % Hence a vector of errors
  
% Quantify error
  errsq = err.^2;             % Square error values so no negative error
  I = trapz(tr,errsq);
%{
% Plot everything
  figure()
  hold off;
  subplot(3,1,1),plot(tr, fo, '-','LineWidth',2,'Color',[0 0 .7]);hold on;
  subplot(3,1,1),plot(tsample, fsample,'O','LineWidth',2,'Color',[.7 0 0]);
  title('Original function with samples')
  xlabel('Time (s)')
  ylabel('Amplitude')
  set(gca,'FontName','Arial')
  subplot(3,1,2),plot(tr, fr, '-','LineWidth',2,'Color',[0 0.7 0]);
  title('Reconstructed function')
  xlabel('Time (s)')
  ylabel('Amplitude')
  set(gca,'FontName','Arial')
  subplot(3,1,3),plot(tr, err,'-','LineWidth',2,'Color',[0.6 0 0.6]);
  title('Error')
  xlabel('Time (s)')
  ylabel('Amplitude')
  set(gca,'FontName','Arial')
  %}