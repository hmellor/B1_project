%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% springdampergain.m
% DWM 6/9/10
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function logmodG= springdampergain(A,w0,dampingfactor,logw)

% logw is a vector of log(omega) values

for i=1:1:length(logw)
  w = 10^logw(i);
  b = (1-(w/w0)^2)^2 + (2*dampingfactor*(w/w0))^2;
logmodG(i) = log( A/sqrt(b) );
end
