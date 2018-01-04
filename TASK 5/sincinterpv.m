%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: reconstructed siglnal 
% Inputs: tr times at which reconstruction is wanted
%         fs vector of samples
%         ts vector of sample times
%         Ts sample period
%         wm bandlimit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function reconstruction = sincinterpv(tr,fs,ts,Ts,wm)
  t=ones(length(ts),1)*tr; % meshgrid of ts and tr
  k=(0:1:length(ts)-1)'*ones(1,length(tr)); 
  p = (wm/pi)*(t-k*Ts);    % columns - pk values for 1 summation
  c = Ts*wm/pi;            % useful constant
  reconstruction = c*fs*sinc(p); % reconstruc to single vector
end