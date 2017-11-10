%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gain_diff
% DWM 29/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
function diff = gain_diff(params,logwmeas,GdBmeas)

% For clarity
  A=10^params(1);  w0 = 10^params(2);  zeta = 10^params(3);

% Work out (1) the fitted values of gain using given params
%          (2) vector of differences twixt fit and measurements
%          (3) sum over vector of squared differences

  GdBfit  = gain_dB(A,w0,zeta,logwmeas);
  diff    = GdBfit - GdBmeas;

