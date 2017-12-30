%% Reconstruct - Reconstructs sampled function using sincinterp
% 
% Inputs:  Sampled Function
%          Sample Period
%          Frequency of function
%          Band limit coefficient
% Outputs: Times of reconstruction
%          Reconstructed function
%%
function [tr,fr]=reconstruct(fsample,ts,f,blcoeff)
    tstart = 0;                          % Start time
    tstop  = 30/f;                       % Stop time (arbitrary)
    tsample = tstart:ts:tstop; % Times to sample at
    wm     = 2*pi*f*blcoeff;             % bandlimit in radians
    nsamples = length(fsample);

    % Determine times tr where you want reconstruction
    tstep = ts/10;              % say 10 per orig sample
    tr = tstart:tstep:tstop;

    % Reconstruct at these times  % Ugly code warning
    fr=zeros(length(tr),1);
    for n=1:length(tr)
        fr(n) = sincinterp(tr(n),fsample,tsample,ts,wm,1,nsamples);
    end
end