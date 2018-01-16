%% Plot Functions
% A script that samples func(), filters it with all the filters,
% reconstructs each set of filtered samples and calculates the power spectrum
% of each reconstruction.
%%

% Set variables for use in later code
f=1000;                                 % function frequency (arbitrary)
N=51;                                   % Number of taps
fp=0.31;                                % pass frequency (as multiple of pi)
fs=0.37;                                % stop frequency (as multiple of pi)
wp=1;                                   % pass band weight
ws=1;                                   % stop band weight
bc=1.3;                                 % bandlimit frequency coefficientg
sc=2.4;                                 % sample frequency coefficient
n=1000;                                 % integration steps
samplefreq=f*bc*sc;                     % sample frequency
sampleperiod=1/samplefreq;              % sample period

filters = plot_filters(N,fp,fs,wp,ws,n);% generate and plot all filters
samples=sample(bc,sc,f);                % sample function

% Create array of filtered and unfiltered samples
for n=1:3
    filtered(:,1)=samples(:,2);
    filtered(:,n+1)=conv(samples(:,2),filters(:,n),'same');
end

% Create arrays of reconstructed samples and power spectra
for n=1:4
    [tr,recon(:,n)]=reconstruct(filtered(:,n)',sampleperiod,f,bc);
    [freq,Pyy(:,n)]=spectrum(filtered(:,n),samplefreq);
end

% Plot all of the created arrays
figure(100)
titles=["Sampled Function","Reconstructed Function","Power Spectrum"...
    ,"Fourier Filtered Samples","Reconstructed Filtered Samples","Power Spectrum"...
    ,"Least Squares Filtered Samples","Reconstructed Filtered Samples","Power Spectrum"...
    ,"Linear Program Filtered Samples","Reconstructed Filtered Samples","Power Spectrum"];

for n=[1 4 7 10]
    subplot(4,3,n)
    plot(samples(:,1),filtered(:,(n+2)/3))
    title(titles(n))
    xlabel('Time (s)')
    ylabel('Amplitude')
end

for n=[2 5 8 11]
    subplot(4,3,n)
    plot(tr,recon(:,(n+1)/3))
    title(titles(n))
    xlabel('Time (s)')
    ylabel('Amplitude')
end

for n=[3 6 9 12]
    subplot(4,3,n)
    plot(freq,Pyy(1:257,(n/3)))
    title(titles(n))
    xlabel('Frequency (Hz)'); ylabel('Power')
    axis( [0,max(freq),0,max(Pyy(1:257))] );
end