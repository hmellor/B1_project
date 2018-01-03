%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: reconstructed siglnal 
% Inputs: tr times at which reconstruction is wanted
%         fs vector of samples
%         ts vector of sample times
%         Ts sample period
%         wm bandlimit
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function reconstruction = sincinterpw(wt,M,tr,fs,ts,Ts,wm)
  for i=1:length(tr)  
    t = tr(i)*ones(length(ts),1);
    k = (0:1:length(ts)-1)';
    p = (wm/pi)*(t-k*Ts);
    pw = w(p);
    c = Ts*wm/pi;                      % useful constant
    reconstruction = c*fs(1:size(pw,1))*sinc(pw);
  end
  function pw = w(p)
      if wt > 1
          pw = find(abs(p)<M);
          if wt == 3
             pw = p 
          elseif wt == 4
              
          elseif wt == 5
              
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