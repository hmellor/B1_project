%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Output: reconstructed siglnal 
% Inputs: wt - type of sinc windowing to use
%          M - window limit (multiples of Ts)
%         tr - times at which reconstruction is wanted
%         fs - vector of samples
%         ts - vector of sample times
%         Ts - sample period
%         wm - bandlimit
% Output: fr - reconstructed signal
% UNFINISHED
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function fr = sincinterpw(wt,M,tr,fs,ts,Ts,wm)
if wt == 1
  k=(0:1:length(ts)-1)';    % k values of sum
  p = (wm/pi)*(tr-k*Ts);    % columns - pk values for 1 summation
  fr = Ts*wm/pi*fs*sinc(p); % reconstruc to single vector
elseif wt == 2
  fr = zeros(1,length(tr));          	    % preallocate fr
  trm = 10*M;
  for k=0:length(ts)-1                    % loop through each sample
      trindex = (k+1)*10-9;    % centre index value, fix (round) becase can calculate as 0.00…1
      upperindex = trindex + trm;
      lowerindex = trindex - trm;     
      if lowerindex < 1
          lowerindex = 1;
      end
      if upperindex > length(tr)
          upperindex = length(tr);
      end
      p = (wm/pi)*( tr(1, lowerindex: upperindex)-k*Ts);% vector of p values (width of window)
      wsinc = Ts*wm/pi *fs(k+1)*sinc(p);                     % creates a vector which represents the sinc over tr
      fr(1, lowerindex: upperindex) = fr(1, lowerindex: upperindex) + wsinc; 
      % sums the sinc on windowed part of reconstructed curve
  end
end
end
%{
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
%}
%}