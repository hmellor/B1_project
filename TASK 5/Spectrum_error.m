figure(101)
Pyyerr=Pyy(:,2:4);
Pyyd=Pyy(:,1);
Pyyd(89:end)=0;
for i=1:3
    %Pyyerr(:,i)=abs(Pyyerr(:,i)-Pyyd);
    %Ierr(:,i)=trapz(Pyyerr(1:257,i));
    %I(:,i)=simps(Pyy(1:88,1));
    %Iperc=Ierr./I;
    % Pass band
    Ierr(:,i)=simps(Pyyerr(1:89,i))
    I=simps(Pyy(1:89,1))
    Iperc=100* Ierr./I    
    %{
    % Stop band
    Ierr(:,i)=simps(Pyyerr(89:257,i))
    I=simps(Pyy(89:257,1))
    Iperc=100* Ierr./I
    %}
end
I;
Ierr;
Iperc;