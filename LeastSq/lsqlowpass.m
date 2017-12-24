%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lsqlowpass
% Inputs:  N number (odd) of taps
%       :  fp,fs pass,stop band freq: frac of pi
%       :  Wp,Ws weights in pass,stop
%       :  nsteps, gives integration step
%                  size as pi/nsteps
% DWM 26/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function lsqlowpass(N,fp,fs,Wp,Ws,nsteps)

% Should check (1) N is odd 
% Skip for now (2) fp,fs are in proper range
%              (3) weights are >= 0
  thetap = pi*fp;               % cut off
  thetas = pi*fs;               % cut off

% theta vectors over range and bands
  dtheta = pi/nsteps;
  theta  = (0:dtheta:pi)';         % theta vector for entire range
  thetapass = (0:dtheta:thetap)';  % for pass band
  thetastop = (thetas:dtheta:pi)'; % for stop band

% desired values
  gdpass = ones(length(thetapass),1); % desired g in pass
  gdstop = zeros(length(thetastop),1);% ditto in stop

% base the initial guess for the coefficients on
% truncated Fourier with cut off midway into transition band
  initialeta = etacoeffs(N,0.5*(thetap+thetas)); % get the eta values


% Optimize the parameters by minimizing the cost function
% There are other matlab minimizers that could be used!!
  cost = @(eta)costfunction(eta,thetapass,gdpass,Wp,thetastop,gdstop,Ws);
  options = optimset('MaxFunEvals',10e10,'MaxIter',10e10);
  finaleta = fminsearch(cost,initialeta,options);
  
% Work out the response values over all the range
  g   = gactual(finaleta,theta);

% Plotting stuff
  figure(1)
  hold off;
  set(gca, 'FontSize', 18);
  plot(thetapass, gdpass, '-','LineWidth',4,'Color',[0 0.7 0]); hold on;
  plot(thetastop, gdstop, '-','LineWidth',4,'Color',[0.7 0 0]); hold on;
  plot(theta,  g  , '-','LineWidth',2,'Color',[0 0 0.7]); hold on;
  axis( [0,3.2,-0.1,1.1]);
  xlabel('\theta'); ylabel('Filter response G(\theta)');

% Save plot as colour postscript
  fracp = floor(100*(fp-floor(fp))); %two dec places
  fracs = floor(100*(fs-floor(fs))); %two dec places
  fr_file = sprintf('lsqlp_fr_%d_%d-%d.svg',N,fracp,fracs);
  fprintf('Frequency response saved to %s\n',fr_file);
  print('-dsvg', fr_file);

% Save plot of impulse response
  ir_fileprefix = sprintf('lsqlp_ir_%d_%d-%d',N,fracp,fracs);
  lollipop(ir_fileprefix,finaleta);



