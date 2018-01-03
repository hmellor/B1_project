%% Sampling Optimiser
% A script for visualising and finding the highest sampling and bandlimit
% frequencies that minimise error and avoid diminishing returns. 
%%

% Set variables for use in later code
f=1000;                                    % function frequency (arbitrary)
dc = 0.1;                                  % size of steps in coefficient
sc = 2:dc:5;                               % sample frequency coefficient
bc = 1:dc:3;                               % bandlimit frequency coefficient
[X,Y] = meshgrid(sc,bc);                   % 2D mesh of the 2 variables
err=zeros(length(bc),length(sc));          % preallocate error matrix

% Calculate area of error in reconstruction for each value in mesh
for i = 1:length(bc)
    for j = 1:length(sc)
        err(i,j) = reconstruct(f,bc(i),sc(j));
        figure(1)
        subplot(1,2,1)
        surf(X,Y,err)                      % plot the surface
        set(gca,'xdir','reverse')          % flip axis for better view
        set(gca,'ydir','reverse')          % flip axis for better view
        set(gca,'Zscale','log')            % log - data spans large range
        title('Integral of error^2 from Reconstruction')
        xlabel('Sample Coefficient')
        ylabel('Bandlimit Coefficient')
        zlabel('I_{error} = \int error^2 dt')
        colorbar;
        drawnow;                           % realtime addition to figure
    end
end

% Calculate absolute gradient of error surface
graderr = abs(gradient(err,dc,dc));
subplot(1,2,2)
surf(X,Y,graderr)                          % plot the surface
set(gca,'xdir','reverse')                  % flip axis for better view
set(gca,'ydir','reverse')                  % flip axis for better view
set(gca,'Zscale','log')                    % log - data spans large range
title('Absolute gradient of integral of error^2')
xlabel('Sample Coefficients')
ylabel('Cut off Coefficients')
zlabel('abs(grad(I_{error}))')
colorbar;

% Save the error gradient surface as a figure for later viewing
savefig('Reconstruction Error.fig');