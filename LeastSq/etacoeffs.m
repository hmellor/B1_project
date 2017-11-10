%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% etacoeffs
% Inputs  N       (odd) number of taps
%         thetac  cutoff frequency (0 to pi)
% Outputs eta Vector of 0.5(N+1) h coeffs
% DWM 26/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function eta = etacoeffs(N,thetac)
% These are the Fourier coefficients for the taps
% Central value
  eta(1) = thetac/pi; 
% One side 
  for k=1:(N-1)/2
	eta(k+1) = sin(k*thetac)/(pi*k);
  end
  eta=eta';
