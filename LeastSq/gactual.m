%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gactual
% Inputs    eta, vector of h values
%           theta, vector of theta values
% Outputs   g, vector of g values
% DWM 26/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function g = gactual(eta,theta)
% fancy matrix vector way
  n    = length(theta);
  kmax = length(eta)-1;
  A = ones(n,1);            % 1st column of matrix
  for k=1:kmax
     A =[A,2*cos(k*theta)]; % Add another column to right of A
  end
  g = A*eta;
