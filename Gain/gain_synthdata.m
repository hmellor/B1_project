%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gain_synthdata
%   generate gain in dB from decade below to decade above
%   resonance, equally spaced on log w scale. Add noise
%   
%   50 points per decade.
% DWM 29/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

  function gain_synthdata(A,w0,zeta,noisedB,prefix)
  logw0 = log10(w0);
  logw  = (logw0-1 : 1/100 : logw0+0.5);
  GdB   = gain_noisy_dB(A,w0,zeta,noisedB,logw);
  
% Write as rows of comma separated logw,gain
  datafile=sprintf('%s.dat',prefix);
  dlmwrite(datafile, [logw', GdB'], ',');

% Plot magnitude part of Bode
  hold off;
  set(gca, 'FontSize', 18);
  plot(logw, GdB, 'square', 'LineWidth',2, 'Color', [0 0 0.7]);
  xlabel('log(\omega)');
  ylabel('log(|G|)');

  plotfile=sprintf('%s_synthdata.eps',prefix);
  print('-depsc',plotfile);
