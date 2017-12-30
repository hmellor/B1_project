%% Plot Functions
%
%%
f=1000;
N=51;
fp=0.317;
fs=0.36;
wp=4;
ws=1;
blcoeff=1.3;
fscoeff=2.5;
n=1000;
samplefreq=f*blcoeff*fscoeff;
sampleperiod=1/samplefreq;

filters = plot_filters(N,fp,fs,wp,ws,n);
samples=sample(blcoeff,fscoeff,f);

for n=1:3
    filtered(:,1)=samples(:,2);
    filtered(:,n+1)=conv(samples(:,2),filters(:,n),'same');
end

for n=1:4
    [tr,recon(:,n)]=reconstruct(filtered(:,n),sampleperiod,f,blcoeff);
    [freq,Pyy(:,n)]=spectrum(filtered(:,n),samplefreq);
end

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