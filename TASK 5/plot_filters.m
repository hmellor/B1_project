%% Plot Filters
%
%%
function filters = plot_filters(N,fp,fs,wp,ws,n)

filters = generate_filters(N,fp,fs,wp,ws,n);
N=num2str(N);
pb=[num2str((fp+fs)/2) '\pi'];
tb=[num2str(fp) '\pi-' num2str(fs) '\pi'];
titles = {['Fourier Filter (pass band: ' pb ')']...
    ,['Least Squares Filter (taps: ' N ', transition: ' tb ')']...
    ,['Linear Program Filter (taps: ' N ', transition: ' tb ')']};
titles = [titles titles];
cd 'filter figures'
files = dir('*.fig');
fig=gobjects(1,6);
for i=1:length(files)
    [filepath,name,ext] = fileparts(files(i).name);
    fig(i) = openfig([name ext]);
    figure(99)
    j = [1 4 3 6 2 5];
    s = subplot(2,3,j(i));    
    copyobj(allchild(get(fig(1,i),'CurrentAxes')),s);
    
    if mod(i,2)== 0
        xlabel('k');
        ylabel('Impulse response h[k]');
    else
        xlabel('\theta');
        ylabel('Filter response G(\theta)');
    end
    title(titles(j(i)))
end
for i=1:6
    close(intersect(findall(0,'type','figure'),i))
end
cd ../