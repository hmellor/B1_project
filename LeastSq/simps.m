function I = simps(f)
%SIMPS Numerical integration by Simpsons Rule
% Input:  f - vector of function to be integrated
% Output: I - value of numerical integration
if mod(length(f),2)==1 && length(f)>1
    I=(1/3)*(f(1)+4*sum(f(1:2:end))+2*sum(f(2:2:end))+f(end));
end
end