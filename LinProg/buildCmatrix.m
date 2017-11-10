%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% buildCmatrix
% Inputs    N, number of taps
%           theta, COLUMN vector of theta values
% Outputs   C, matrix as per notes
% DWM 26/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function C = buildCmatrix(N,theta)
% fancy matrix vector way
  n    = length(theta);
  C = ones(n,1);            % 1st column of matrix
  for k=1:(N-1)/2
     C =[C, **FIXME**]; % Add another column to right of C
  end
