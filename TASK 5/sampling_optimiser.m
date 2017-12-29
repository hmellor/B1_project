%% Sampling Optimiser
% A script for visualising and finding the highest sampling and cut off
% frequencies that minimise error and avoid diminishing returns. 
%%

% Set variables for use in later code
f=1000;                                    % function frequency (arbitrary)
dc = 1;                                    % size of steps in coefficient
sc = 2:dc:10;                               % sample frequency coefficients
cc = 1:dc:10;                               % cut off frequency coefficients
[X,Y] = meshgrid(sc,cc);                   % 2D mesh of the 2 variables
err=zeros(length(cc),length(sc));          % preallocate error matrix

% Calculate area of error in reconstruction for each value in mesh
for i = 1:length(cc)
    for j = 1:length(sc)
        err(i,j) = reconstruct(f,cc(i),sc(j));
        figure(1)
        surf(X,Y,err)                      % plot the surface
        set(gca,'xdir','reverse')          % flip axis for better view
        set(gca,'ydir','reverse')          % flip axis for better view
        set(gca,'Zscale','log')            % log - data spans large range
        xlabel('Sample Coefficients')
        ylabel('Cut off Coefficients')
        zlabel('Integral of square error')
        drawnow;                           % realtime addition to figure
    end
end

% Save the error surface as an svg for later viewing
filename=sprintf('%s.svg','Error');
print('-dsvg', filename);

% Calculate absolute gradient of error surface
figure(2)
graderr = abs(gradient(err,dc,dc));
surf(X,Y,graderr)                          % plot the surface
set(gca,'xdir','reverse')                  % flip axis for better view
set(gca,'ydir','reverse')                  % flip axis for better view
set(gca,'Zscale','log')                    % log - data spans large range
xlabel('Sample Coefficients')
ylabel('Cut off Coefficients')
zlabel('Absolute gradient of integral of square error')

% Save the error gradient surface as an svg for later viewing
filename=sprintf('%s.svg','Error Gradient');
print('-dsvg', filename);  % Save as colour postscript