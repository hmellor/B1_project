%% Window Optimiser
% A script for evaluating the most compute efficient method of placing a
% window on the sinc function used in reconstruction.
%%

% Set variables for use in later code
f=1000;                                 % function frequency (arbitrary)
sc=2.4;                                 % sample frequency coefficient
bc=1.3;                                 % bandlimit frequency coefficient
M=5:1:100;                            % sincinterp max window limit
r=31;                                    % repeats for timing

% Initialise matrices and figure
E=zeros(2,length(M));                   % preallocate error matrix
T=zeros(2,length(M));                   % preallocate time matrix
close all                               % close all figures
figure()                                % open new figure
grid on                                 % turn on grid for figure
type = ["Matrix Method" "Windowed"]; % plot titles
  
% Evaluate calculation & and error for each window for range of cut offs
for i = 1:2                             % iterate through each filter
    for j = 1:length(M)                 % iterate through window limits
        j
        E(i,j) = reconstructw(i,M(j),f,bc,sc); % evaluate error
        if i==2
            timed=zeros(1,r);
            for run = 1:r
                tic
                reconstructw(i,M(j),f,bc,sc);
                timed(run)=toc;
            end
        else
            tic
            reconstructw(i,M(j),f,bc,sc);
            timed=toc;
        end
        T(i,j) = median(timed);         % measure time to reconstruct
    end
end
T(1,:)=mean(T(1,:));
% Plot the data
hold on
yyaxis right
plot(M,T(1,:),'--','LineWidth',1)
plot(M,T(2,:),'','LineWidth',1)
ylabel('Recontruction time')
axis([0 M(end) 0 inf])
yyaxis left
plot(M,E(1,:),'--','LineWidth',1)
plot(M,E(2,:),'','LineWidth',1)
ylabel('Reconstruction error')
axis([0 M(end) 0 inf])
legend('Matrix Method Error','Window Method Error'...
    ,'Matrix Method Time','Window Method Time')