%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% costfunction
% Inputs eta: a set of parameters
%        thetapass: vector of theta values for pass band
%        gdpass:    vector of corresponding desired values
%        Wp:        scalar weight for all values in pass band
%        Then Ditto of the stop band
% DWM 1/11/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function cost =costfunction(eta,thetapass,gdpass,Wp,thetastop,gdstop,Ws)

% Step 1.1
% Use the eta values to calculate the vector of actual response
% in the pass band using the vector of theta values
  g_pass =     **FIXME**;

% Step 1.2
% Work out the vector of squares-of-the-error at each theta value
  errsq_pass = **FIXME**;

% Step 1.3
% Integrate using (for example!) the trapezium rule
  integral_pass = trapz( **FIXME** );

% Step 2.1, 2.2 and 2.3
% Do exactly the same, but now for the stop band
  g_stop =        **FIXME**;
  errsq_stop =    **FIXME**;
  integral_stop = **FIXME**;

% Step 3
% Weighted sum of integrals is the cost
  cost = Wp*integral_pass + Ws*integral_stop;
