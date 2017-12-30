%% SAMPLE - Outputs sampled data of func()
% 
% Inputs:  Bandlimit coefficient
%          Sample frequency coefficient
% Outputs: samples - column1=times 
%                    column2=amplitudes
%%
function [samples] = sample(blcoeff,fscoeff,f)
    fm = blcoeff*f;                 % Maximum frequency in bandlimited sample
    tstop = 30/f;                   % Stop time (arbitraty)
    fs = fscoeff*fm;                % Sampling frequency
    ts = 1/fs;                      % Sampling period
    tsample = 0:ts:tstop;           % Sample time vector
    fsample = func(tsample,f);      % Function samples
    samples = [tsample',fsample'];  % Time and Function output
end

