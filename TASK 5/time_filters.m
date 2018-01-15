%% Generate Filters - Generates Fourier, LeastSq and LinProg filters
% 
% Inputs:   N - Number of taps
%          fp - Pass band frequency (fraction of pi)
%          fs - Stop band frequency (fraction of pi)
%          wp - Pass band weight
%          ws - Stop band weight
%           n - integration steps
% Outputs:  T - vector of filter creation times
%%
function T = time_filters(N,fp,fs,wp,ws,n)
    T = 1:10;
    sourcefolder = pwd;
    cd 'Filter Figures';
    delete *.fig
    cd ../;
    % Generate Fourier filter
    cd ../;
    cd Fourier;
    delete *.fig
    for r=1:10
        tic
        fourierlowpass(N,(fp+fs)/2,n);
        T(1,r)=toc;
    end
    % Generate least squares filter
    cd ../;
    cd LeastSq;
    delete *.fig
    for r=1:10
        tic
        lsqlowpass(N,fp,fs,wp*2.03,ws,n);
        T(2,r)=toc;
    end
    % Generate linear program filter
    cd ../;
    cd LinProg;
    delete *.fig
    for r=1:10
        tic
        linproglowpass(N,fp,fs,wp,ws,n);
        T(3,r)=toc;
    end
    T = median(T,2);
    % Return to original directory
    cd ../;
    cd(sourcefolder);
    % Close unwanted figures and output the filters
    close 1 2;
end