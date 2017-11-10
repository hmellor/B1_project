%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% lollipop - plots a lollipop graph
% Inputs:  fileprefix (a string)
%          eta, vector of tap coefficients
% DWM 30/10/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  function lollipop(fileprefix,eta)

% Fix up left side --- there is a nicer way
  kmax = length(eta);
  % fix up the left hand 
  for k=1:kmax-1
	  h(k) = eta(kmax+1-k);
  end
% Fix up right side 
  h = [h,eta'];  % ROW VECTOR
  index = [-kmax+1:1:kmax-1];

% Plot as lollipops
  hold off;
  set(gca, 'FontSize', 18);
  plot(index, h, 'O','MarkerSize',7,'LineWidth',6,'Color',[0.7 0 0]); hold on;
  xlabel('k'); ylabel('Impulse response h[k]');
  for k=1:length(h)
    line([index(k),index(k)],[0,h(k)],'LineWidth',3,'Color',[0.7 0 0]);
  end
  line([min(index)-1,max(index)+1],[0,0],'LineWidth',2,'Color',[0 0 0]);
  axis( [min(index)-1,max(index)+1, min(h)-0.1,max(h)+0.1]);

% Save it for posterity in fileprefix.eps
  filename=sprintf('%s.eps',fileprefix);
  print('-depsc', filename); 
  fprintf('Lollipop saved to %s\n',filename);





 
