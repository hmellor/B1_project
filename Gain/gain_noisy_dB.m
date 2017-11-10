%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gain_noisy_dB()
% Inputs: A       gain 
%         w0      natural ang freq
%         zeta    damping factor
%         dBnoise dB noise added normally
%         logw is a vector of log(omega) values
% Output: GdB,  the gain in dB, ie 20logmod(G)
% DWM 26/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function GdB= gain_noisy_dB(A,w0,zeta,dBnoise,logw)

  noise = random('Normal',0.0, dBnoise, 1,length(logw)) ;
  GdB   = gain_dB(A,w0,zeta,logw) + noise;
