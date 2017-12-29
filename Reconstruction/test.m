clear
scoeff=2:0.1:5;
for n=1:length(scoeff)
    err(n)=reconstruct(n,1000,'test');
end
semilogy(scoeff,err)