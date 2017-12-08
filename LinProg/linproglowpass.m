%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% linproglowpass
% Inputs:  N number (odd) of taps
%       :  fp,fs pass,stop band freq: frac of pi
%       :  Wp,Ws weights in pass,stop
%       :  nsteps, gives integration step
%                  size as pi/nsteps
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function linproglowpass(N,fp,fs,Wp,Ws,nsteps)

% Should check (1) N is odd 
% Skip for now (2) fp,fs are in proper range
%              (3) weights are >= 0

  thetap = pi*fp;               % cut off
  thetas = pi*fs;               % cut off

% theta COLUMN vectors over range and bands
  dtheta = pi/nsteps;
  theta  = [0:dtheta:pi]';         % theta vector for entire range
  thetapass = [0:dtheta:thetap]';  % for pass band
  thetastop = [thetas:dtheta:pi]'; % for stop band

% desired values, to make column vector gd
  gdpass  = ones(length(thetapass),1); % desired g in pass
  gdstop  = zeros(length(thetastop),1);% ditto in stop
  gd      = [gdpass;gdstop];                 % combined column vector

% inverse weight values, to make vector m
  inversewpass  = (1/Wp)*ones(length(thetapass),1); % in pass
  inversewstop  = (1/Ws)*ones(length(thetastop),1); % in pass
  m = [inversewpass;inversewstop];

% Construct the matrix C (we did this earlier as part of gactual.m)!
% Remember to use all theta values in pass and stop bands
  C = buildCmatrix(N, [thetapass;thetastop]);

% Now build the A,b and c for linprog
  A = [C -m;-C -m];
  b = [gd;-gd];
  c = [zeros(0.5*(N+1),1);1];

% Now use linprog!
  x = linprog(c,A,b);

% Cream off the eta values, and eps0
  kmax = (N+1)/2;
  eta = x(1:kmax);
  eps0 = x(kmax+1)

% Work out the response values over all the range
  g   = gactual(eta,theta);

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
  fr_file = sprintf('linprog_fr_%d_%d-%d.eps',N,fracp,fracs);
  fprintf('Frequency response saved to %s\n',fr_file);
  print('-depsc', fr_file); 

% Save plot of impulse response
  ir_fileprefix = sprintf('linprog_ir_%d_%d-%d',N,fracp,fracs);
  lollipop(ir_fileprefix,eta);



