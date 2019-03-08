%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gactual
% Inputs    eta, COLUMN vector of h values
%           theta, COLUMN vector of theta values
% Outputs   g, COLUMN vector of g values
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function g = gactual(eta,theta)
% fancy matrix vector way
  n    = length(theta);
  kmax = length(eta)-1;
  A    = ones(n,1);      % 1st column of matrix
  for k=1:kmax
     A =[A, 2*cos(k*theta) ]; % Add another COLUMN to right of A
  end
  g = A*eta;         % Matrix vector multiplication
