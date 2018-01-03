%% Window Optimiser
% A script for evaluating the most compute efficient method of placing a
% window on the sinc function used in reconstruction.
%%

% Set variables for use in later code
f=1000;                                 % function frequency (arbitrary)
sc=2.4;                                 % sample frequency coefficient
bc=1.3;                                 % bandlimit frequency coefficient
M=0:1:90;                               % sincinterp max window limit

% Initialise matrices and figure
E=zeros(5,length(M));                   % preallocate error matrix
T=zeros(5,length(M));                   % preallocate time matrix
close all                               % close all figures
figure()                                % open new figure
grid on                                 % turn on grid for figure
type = ["No window" "Rectangular window" "Linear window"...
      "Quadratic window" "Cosine window"]; % plot titles
  
% Evaluate calculation & and error for each window for range of cut offs
for i = 1:5                             % iterate through each filter
    for j = 1:length(M)                 % iterate through window limits
        E(i,j) = reconstructw(i,M(j),f,bc,sc); % evaluate error
        timer = @()reconstructw(i,M(j),f,bc,sc); % set handle with no args
        T(i,j) = timeit(timer);         % measure time to reconstruct
    end
    % Plot the data
    subplot(1,5,i)
    hold off
    yyaxis right
    plot(M,T(i,:))
    ylabel('Recontruction time')
    axis([M(1) M(end) 0 inf])
    hold on
    yyaxis left
    plot(M,E(i,:))
    ylabel('Reconstruction error')
    %axis([M(1) M(end) 0 inf])
    title(type(i))
    drawnow
end