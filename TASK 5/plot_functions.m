%% Plot Functions
%
%%
f=1000;
N=51;
fp=0.327;
fs=0.35;
wp=1;
ws=1;
blcoeff=1.3;
fscoeff=2.5;
n=1000;
samplefreq=f*blcoeff*fscoeff;
sampleperiod=1/samplefreq;

filters = generate_filters(N,fp,fs,wp,ws,n);
samples=sample(blcoeff,fscoeff,f);

for n=1:3
    filtered(:,1)=samples(:,2);
    filtered(:,n+1)=conv(samples(:,2),filters(:,n),'same');
end

for n=1:4
    [tr,recon(:,n)]=reconstruct(filtered(:,n),sampleperiod,f,blcoeff);
end

for n=1:4
    [freq,Pyy(:,n)]=spectrum(filtered(:,n),samplefreq);
end

figure(12)
titles=[" ","Sampled Function","Reconstructed Function","Power Spectrum"...
    ,"Fourier Filter","Fourier Filtered Samples","Reconstructed Filtered Samples"...
    ,"Power Spectrum","Least Squares Filter","Least Squares Filtered Samples"...
    ,"Reconstructed Filtered Samples","Power Spectrum","Linear Program Filter"...
    ,"Linear Program Filtered Samples","Reconstructed Filtered Samples","Power Spectrum"];

for n=[5 9 13]
    subplot(4,4,n)
    plot([1:N]-ones(1,N)*(N+1)/2,filters(:,(n-1)/4))
    title([titles(n)])
    xlabel('k')
    ylabel('Impulse response h[k]')
end

for n=[2 6 10 14]
    subplot(4,4,n)
    plot(samples(:,1),filtered(:,(n+2)/4))
    title(titles(n))
    xlabel('Time (s)')
    ylabel('Amplitude')
end

for n=[3 7 11 15]
    subplot(4,4,n)
    plot(tr,recon(:,(n+1)/4))
    title(titles(n))
    xlabel('Time (s)')
    ylabel('Amplitude')
end

for n=[4 8 12 16]
    subplot(4,4,n)
    plot(freq,Pyy(1:257,(n/4)))
    title(titles(n))
    xlabel('Frequency (Hz)'); ylabel('Power')
    axis( [0,max(freq),0,max(Pyy(1:257))] );
end