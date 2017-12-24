%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% spectrum
%   Plots power spectrum of function in func()
%   Inputs: frequency (Hz)
%           file prefix
% DWM 31/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function spectrum(f,prefix)

  fm     = func_bandlimit(f); 
  tstart = 0; 
  nperiods = 200;       
  tstop  = nperiods/f;   
% Choose sampling frequency
  fs = 2.1*fm;             % close to the minimum allowed
  ts = 1/fs;               % Hence sampling period
% Sample the function
  tsample = tstart:ts:tstop;
  fsample = func(tsample,f);
  nsamples = length(fsample);

% Fast Fourier Transform of signal
  Y=fft(fsample,512); 
% Evaluate power spectrum
  Pyy = Y.*conj(Y)/512;
% Jig up one-sided frequencies only
  freq=fs*(0:256)/512;

% Plot the spectrum
  hold off;
  set(gca, 'FontSize', 18);
  plot(freq,Pyy(1:257), '-','LineWidth',2,'Color',[0 0.4 0.7]);
  axis( [0,max(freq),0,max(Pyy(1:257))] );
  xlabel('Frequency (Hz)'); ylabel('Power');
  filename = sprintf('%s.eps',prefix);
  print ('-depsc', filename);
