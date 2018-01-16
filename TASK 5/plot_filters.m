%% Plot Filters - Runs generate_filters() but also plots it
% Inputs:   N - Number of taps
%          fp - Pass band frequency (fraction of pi)
%          fs - Stop band frequency (fraction of pi)
%          wp - Pass band weight
%          ws - Stop band weight
%           n - integration steps
% Outputs: filters - Matrix containing all 3 filters
%%
function filters = plot_filters(N,fp,fs,wp,ws,n)
% Generate filters
filters = generate_filters(N,fp,fs,wp,ws,n);
% Initiate plot metadata
N=num2str(N);
pb=[num2str((fp+fs)/2) '\pi'];
tb=[num2str(fp) '\pi-' num2str(fs) '\pi'];
titles = {['Fourier Filter (taps: ' N ', pass band: ' pb ')']...
    ,['Least Squares Filter (taps: ' N ', transition: ' tb ')']...
    ,['Linear Program Filter (taps: ' N ', transition: ' tb ')']};
titles = [titles titles];
cd 'filter figures'
files = dir('*.fig');
% Initiage figure array
fig=gobjects(1,6);
% Open figures from filter figures directory and plot them as subplots
for i=1:length(files)
    [filepath,name,ext] = fileparts(files(i).name);
    fig(i) = openfig([name ext]);
    figure(99)
    j = [1 4 3 6 2 5];
    s = subplot(2,3,j(i));    
    copyobj(allchild(get(fig(1,i),'CurrentAxes')),s);
    % Title and label plots
    if mod(i,2)== 0
        xlabel('k');
        ylabel('Impulse response h[k]');
    else
        xlabel('\theta');
        ylabel('Filter response G(\theta)');
    end
    title(titles(j(i)))
end
% Close the unnecessary plots (if they exist)
for i=1:6
    close(intersect(findall(0,'type','figure'),i))
end
cd ../