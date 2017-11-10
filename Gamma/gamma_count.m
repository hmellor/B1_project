%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% DWM 6/9/10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function count = gamma_count(a,b,c,S,x0,sigma,x,noisesigma)


noise = random('Normal',0.0, noisesigma, 1,length(x)) ;

for i=1:1:length(x)
    diff = x(i)-x0;
	count(i) = a + b*diff + c*diff^2 + S*exp( -( diff/sigma)^2);
end
count = count+noise;
