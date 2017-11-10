%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gain_dB()
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function GdB= gain_dB(A,w0,zeta,logw)
  % This could be done using vectors ...
  for i=1:1:length(logw)
    w     = 10^logw(i);
    b     = (1-(w/w0)^2)^2 + (2*zeta*(w/w0))^2;
    GdB(i) = 20*log10(A/sqrt(b));
  end
