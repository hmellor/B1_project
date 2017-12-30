%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% fourierlowpass
% Inputs: N, number (odd) of taps
%       : fc,  cutoff freq as fraction of pi
%       : nsteps, number of divisions 0 to pi
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function fourierlowpass(N,fc,nsteps)
% Really should check that 
% (1) N is odd and (2) fc is in proper range
% but skip for now ...

% Step (1) Theta values
  thetac = pi*fc;                      % cut off
  theta = [0:1:nsteps]'*(pi/nsteps);   % COLUMN theta vector

% Step (2) get the eta values and actual filter
  eta = etacoeffs(N,thetac);    
  g   = gactual(eta,theta);     % actual filter

% Step (3) get the desired filter values
  gd  = gdesired(theta,thetac); % desired filter

% Step (4) Plot the actual and desired filter
  figure(1)
  hold off;
  set(gca, 'FontSize', 18);
  plot(theta, gd, '-','LineWidth',2,'Color',[0 0 0]); hold on;
  plot(theta, g,  '-','LineWidth',2,'Color',[1 0 0]); 
  axis( [0,3.2,-0.1,1.1]);
  xlabel('\theta'); ylabel('Filter response G(\theta)');
% Get a meaningful filename
  num  = floor(fc);
  frac = floor(100*(fc-num)); %two dec places
  fr_file = sprintf('fourierlowpass_fr_%d_%dp%d.fig',N,num,frac);
  fprintf('Frequency response saved to %s\n',fr_file);
% Save plot as colour postscript
  savefig([fr_file])

% Step (5) Save plot of impulse response as a lollipop plot
  ir_prefix = sprintf('fourierlowpass_ir_%d_%dp%d',N,num,frac);
  lollipop(ir_prefix,eta);
