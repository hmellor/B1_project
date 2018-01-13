%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: reconstructed siglnal 
% Inputs: tr times at which reconstruction is wanted
%         fs vector of samples
%         ts vector of sample times
%         Ts sample period
%         wm bandlimit
% Outputs: I - integral of error squared
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fr = sincinterpv(tr,fs,ts,Ts,wm)
  k=(0:1:length(ts)-1)';    % k values of sum
  p = (wm/pi)*(tr-k*Ts);    % columns - pk values for 1 summation
  fr = Ts*wm/pi*fs*sinc(p); % reconstruc to single vector
end