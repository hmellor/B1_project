%% Generate Filters - Generates Fourier, LeastSq and LinProg filters
% 
% Inputs:  N - Number of taps
%          fp - Pass band frequency (fraction of pi)
%          fs - Stop band frequency (fraction of pi)
%          wp - Pass band weight
%          ws - Stop band weight
%          n - integration steps
% Outputs: filters - Matrix containing all 3 filters
%%
function filters = generate_filters(N,fp,fs,wp,ws,n)
    sourcefolder = pwd;
    cd 'Filter Figures';
    delete *.fig
    filterfolder = pwd;
    cd ../;
    % Generate Fourier filter
    cd ../;
    cd Fourier;
    delete *.fig
    fourierlowpass(N,(fp+fs)/2,n);
    load('hfourier.mat');
    copyfile('*.fig',filterfolder)
    % Generate least squares filter
    cd ../;
    cd LeastSq;
    delete *.fig
    lsqlowpass(N,fp,fs,wp,ws,n);
    load('hleastsq.mat');
    copyfile('*.fig',filterfolder)
    % Generate linear program filter
    cd ../;
    cd LinProg;
    delete *.fig
    linproglowpass(N,fp,fs,wp,ws,n);
    load('hlinprog.mat');
    copyfile('*.fig',filterfolder)
    % Return to original directory
    cd ../;
    cd(sourcefolder);
    % Close unwanted figures and output the filters
    close 1 2;
    filters = [hfourier,hleastsq,hlinprog];
end