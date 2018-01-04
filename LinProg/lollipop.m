%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lollipop - plots a lollipop graph
% Inputs:  fileprefix (a string)
%          eta, vector of tap coefficients
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function lollipop(fileprefix,eta)

% Generate (and save) h for plotting taps
  h = [fliplr(eta(2:end,1)')';eta];
  hlinprog=h; save('hlinprog','hlinprog')
  index = (1:1:length(h))-(length(h)+1)/2;

% Plot as lollipops
  figure(2)
  hold off;
  set(gca, 'FontSize', 18);
  plot(index, h, 'O','MarkerSize',5,'LineWidth',6,'Color',[0.7 0 0]); hold on;
  xlabel('k'); ylabel('Impulse response h[k]');
  for k=1:length(h)
    line([index(k),index(k)],[0,h(k)],'LineWidth',3,'Color',[0.7 0 0]);
  end
  line([min(index)-1,max(index)+1],[0,0],'LineWidth',2,'Color',[0 0 0]);
  axis( [min(index)-1,max(index)+1, min(h)-0.1,max(h)+0.1]);

% Save it for posterity in fileprefix.svg
  filename=sprintf('%s.fig',fileprefix);
  savefig([filename])
  fprintf('Lollipop saved to %s\n',filename);





 
