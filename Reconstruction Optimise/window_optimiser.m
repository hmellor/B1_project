%% Window Optimiser
% A script for evaluating the most compute efficient method of placing a
% window on the sinc function used in reconstruction.
%%

% Set variables for use in later code
f=1000;                                 % function frequency (arbitrary)
sc=2.4;                                 % sample frequency coefficient
bc=1.3;                                 % bandlimit frequency coefficient
M=10:100:1100;                           % sincinterp max window limit
r=3;                                    % repeats for timing
run=0;                                  % resets run iterator
% Initialise matrices and figure
E=zeros(2,length(M));                   % preallocate error matrix
T=zeros(2,length(M));                   % preallocate time matrix
close all                               % close all figures
figure()                                % open new figure
grid on                                 % turn on grid for figure
type = ["No window" "Rectangular window" "Linear window"...
      "Quadratic window" "Cosine window"]; % plot titles
type = ["Matrix Method" "My window" " George window"...
      "Quadratic window" "Cosine window"]; % plot titles
  
% Evaluate calculation & and error for each window for range of cut offs
for i = 1:2                             % iterate through each filter
    for j = 1:length(M)                 % iterate through window limits
        j
        E(i,j) = reconstructw(i,M(j),f,bc,sc); % evaluate error
        timer = @()reconstructw(i,M(j),f,bc,sc); % set handle with no args
        for run = 1:r
            timed(run)=timeit(timer);
        end
        T(i,j) = median(timed);         % measure time to reconstruct
    end
end
% Plot the data
hold on
yyaxis right
plot(M,T(1,:))
plot(M,T(2,:))
ylabel('Recontruction time')
axis([M(1) M(end) 0 inf])
yyaxis left
plot(M,E(1,:))
plot(M,E(2,:))
ylabel('Reconstruction error')
axis([M(1) M(end) 0 inf])