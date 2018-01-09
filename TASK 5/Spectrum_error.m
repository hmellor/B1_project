figure(101)
Pyyerr=Pyy(:,2:4);
Pyyd=Pyy(:,1);
Pyyd(89:end)=0;
for i=1:3
    Pyyerr(:,i)=abs(Pyyerr(:,i)-Pyyd);
    Ierr(:,i)=trapz(Pyyerr(1:257,i));
    I(:,i)=trapz(Pyy(1:88,1));
    Iperc=Ierr./I;
    %{
    for j=1:3
        Pyyerr(:,j)=Pyyerr(:,j)./Pyy(:,1)
    end
    %}
    subplot(1,3,i);
    plot(freq,Pyyerr(1:257,i));
end
I
Ierr
Iperc