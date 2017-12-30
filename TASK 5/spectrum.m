%% Spectrum - Plots power spectrum of input
%   
%   Inputs:  Sampled function
%            Sample frequency
%   Outputs: Frequencies
%            Power at respective frequencies
%%
function [freq,Pyy]=spectrum(fsample,fs)
    Y=fft(fsample,512);   % Fast Fourier Transform of signal
    Pyy = Y.*conj(Y)/512; % Evaluate power spectrum
    freq=fs*(0:256)/512;  % Jig up one-sided frequencies only
end