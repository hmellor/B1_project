%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% func: arbitrary test function
%   Inputs:  t time 
%            f frequency
%   Outputs: function value r 
% DWM 14/9/11
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function r = func(t,f)
  v = 2*pi*f*t; 
  r = sin(0.1*v) + sin(0.2*v) + sin(0.3*v) + sin(0.4*v) + ...
        sin(0.5*v) + sin(0.6*v) + sin(0.7*v) + sin(0.8*v) + ...    
          sin(0.9*v) + sin(1.0*v);
