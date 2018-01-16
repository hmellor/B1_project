%% Spectrum Error
% Auxiliary script to be used alongside plot functions in order to
% calculate the percentage of power retained by each band
%%
figure(101)
% Import actual filtered power spectra
Pyyerr=Pyy(:,2:4);
% Create ideally filtered power spectrum
Pyyd=Pyy(:,1);
Pyyd(89:end)=0;
% Calculate power retained percentage
for i=1:3
    % Pass band
    Ierr(:,i)=simps(Pyyerr(1:89,i));     % original power
    I=simps(Pyy(1:89,1));                % filtered power
    Iperc(1,i)=100*Ierr./I;              % percentage retained

    % Stop band
    Ierr(:,i)=simps(Pyyerr(89:257,i));   % original power
    I=simps(Pyy(89:257,1));              % filtered power
    Iperc(2,i)=100*Ierr./I;              % percentage retained
end