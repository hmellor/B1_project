function I = simps(f)
%% SIMPS Numerical integration by Simpsons Rule
% Input:  f - vector of function to be integrated
% Output: I - value of numerical integration
%%
% If number of elements is odd and has more than 1 element
if mod(length(f),2)==1 && length(f)>1
    % Integration as specific sum of all elements
    I=(1/3)*(f(1)+4*sum(f(2:2:end))+2*sum(f(3:2:end-1))+f(end));
else 
    % Even number of integration elements exception
    ['Odd number of integration points required']
end
end