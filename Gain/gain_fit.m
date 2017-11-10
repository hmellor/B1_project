%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gain_fit
%   Inputs: A, w0, zeta: initial guesses for params
%           prefix: prefix for .dat file
% DWM 29/911
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function fit_gain(A,w0,zeta,prefix)
% read the data from file
  datafile=sprintf('%s.dat',prefix);
  logwGdB  = dlmread(datafile,',');
  logwmeas = logwGdB(:,1)';  GdBmeas  = logwGdB(:,2)';

% Because A, w0 and zeta might range widely, and MUST be >0
% we'll use log10() values in the optimization
% Here are the initial parameters in a vector
  initialparams = [log10(A),log10(w0),log10(zeta)];

% THE MAIN LINE %%%%%
% Optimize the parameter by minimizing cost function
  finalparams = fminsearch(@gain_cost,initialparams,[],logwmeas,GdBmeas);

% Restore the values of A, etc, by raising 10 to the power ...
  A=10^finalparams(1); w0=10^finalparams(2); zeta=10^finalparams(3);

% Print out results, and plot
  fprintf('Fit results: Gain=%f, w0=%f, zeta=%f\n',A,w0,zeta);

% Plot results. For smooth curve use 200 equally spaced points
  logwfit = linspace(min(logwmeas),max(logwmeas),200);
  GdBfit  = gain_dB(A,w0,zeta,logwfit);
  hold off;
  plot(logwmeas,GdBmeas,'square','LineWidth',2,'Color',[0 0 0.7]);hold on;
  plot(logwfit, GdBfit, '-',     'LineWidth',2,'Color',[0.7 0 0]);
  set(gca, 'FontSize', 18);
  xlabel('log(\omega)');  ylabel('log(|G|)');
% Save the plot
  plotfile=sprintf('%s_fitted.eps',prefix);
  print('-depsc',plotfile);


