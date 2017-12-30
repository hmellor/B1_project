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
    % Generate Fourier filter
    cd ../;
    cd Fourier;
    fourierlowpass(N,(fp+fs)/2,n);
    load('hfourier.mat');
    % Generate least squares filter
    cd ../;
    cd LeastSq;
    lsqlowpass(N,fp,fs,wp,ws,n);
    load('hleastsq.mat');
    % Generate linear program filter
    cd ../;
    cd LinProg;
    linproglowpass(N,fp,fs,wp,ws,n);
    load('hlinprog.mat');
    % Return to original directory
    cd ../;
    cd(sourcefolder);
    % Close unwanted figures and output the filters
    close 1 2;
    filters = [hfourier,hleastsq,hlinprog];
end