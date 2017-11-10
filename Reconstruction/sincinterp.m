%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: function value at time t by sinc interpolation 
% Inputs: t time at which reconstruction is wanted
%         fs vector of samples
%         ts vector of sample times
%         m, n indices of first,last samples to be used
%         Ts sample period
%         wm bandlimit
% DWM 15/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function sum = sincinterp(t, fs,ts,Ts,wm, m,n)
  c = Ts*wm/pi;                      % useful constant
  sum = 0 ;                          % initialize the summation
  for k=m:1:n                        % loop over the samples
     p = (wm/pi)*(t-ts(m)-(k-m)*Ts);                  % look at the def of sinc(x)  
     sum = sum + fs(k)*c*sinc(p);                % actually doing it
  end;
