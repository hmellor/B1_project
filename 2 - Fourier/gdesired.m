%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gdesired
% Inputs theta COLUMN vector of theta vals 0 to pi
%        thetac cutoff value
% Outputs gd vector of desired g values
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function gd = gdesired(theta,thetac)
% Tricksy! Because the values are 1 and 0 we can 
% use the outputs from a logical test!
  gd  = abs(theta) <= abs(thetac);
