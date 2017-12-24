%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% reconstruct.m
% Script to reconstruct func using sincinterp
% DWM 15/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function reconstruct(f,prefix)

  fm     = func_bandlimit(f); % approx bandlimit
  wm     = 2*pi*fm;           % bandlimit in radians
  tstart = 0;                 % start time: arbitrary
  tstop  = 30/f;              % stop time: arbitrary

% Choose sampling frequency
  fs = 2.1*fm;                % close to the minimum allowed
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

% Plotting stuff
  figure()
  hold off;
  subplot(3,1,1),plot(tr, fo, '-','LineWidth',2,'Color',[0 0 .7]);hold on;
  subplot(3,1,1),plot(tsample, fsample,'O','LineWidth',2,'Color',[.7 0 0]);
  subplot(3,1,2),plot(tr, fr, '-','LineWidth',2,'Color',[0 0.7 0]);
  subplot(3,1,3),plot(tr, err,'-','LineWidth',2,'Color',[0.6 0 0.6]);
  filename=sprintf('%s.eps',prefix);
  print('-depsc', filename);  % Save as colour postscript
