%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% etacoeffs
% Inputs  N       (odd) number of taps
%         thetac  cutoff frequency (0 to pi)
% Outputs eta COLUMN Vector of 0.5(N+1) h coeffs
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function eta = etacoeffs(N,thetac)
% These are the Fourier coefficients for the taps
  eta(1) = **FIXME**;      % Central value
%
  for k=1:(N-1)/2
    eta(k+1) = **FIXME**;  % One side
  end
  eta=eta';                % Make it a COLUMN vector
