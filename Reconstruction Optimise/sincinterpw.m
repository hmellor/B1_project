%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: reconstructed siglnal 
% Inputs: wt - type of sinc windowing to use
%          M - window limit (multiples of Ts)
%         tr - times at which reconstruction is wanted
%         fs - vector of samples
%         ts - vector of sample times
%         Ts - sample period
%         wm - bandlimit
% UNFINISHED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function reconstruction = sincinterpw(wt,M,tr,fs,ts,Ts,wm)
  t=ones(length(ts),1);
  k = (0:1:length(ts)-1)';
  for i=1:length(tr)  
    t = tr(i)*t;
    p = (wm/pi)*(t-k*Ts);
    p = w(p);
    reconstruction = Ts*wm/pi*fs(1:size(p,1))*sinc(p);
  end
  function pw = w(p)
      if wt > 1
          pw = find(abs(p)<M);
          if wt == 3
              pw = 1-pw/M;
          elseif wt == 4
              pw = 1-(pw/M).^2;
          elseif wt == 5
              pw = cos(pi*p/(2*M));
          end
      else
          pw = p;
      end
      %{
      if p > M && wt > 1
          window = 0;
      elseif wt == 3
          window = 1 - p/M;
      elseif wt == 4
          window = 1 - (p/M)^2;
      elseif wt == 5
          window = cos(pi*p/(2*M));
      else
          window = 1;
      end
      %}
  end
end