%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gain_script.m
% DWM 
% 6/9/10
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

A     = 1;
w0    = 2*pi*10;
zeta  = 0.05;


decimatelogw    = (1:0.02:2.6);
logmeasuredmodG = gain_noisysd(A,w0,zeta,decimatelogw);

logw            = (1:0.005:2.6);
logmodG         = gain_sd(A,w0,zeta,logw);
BADlogmodG      = gain_sd(3*A,0.8*w0,5*zeta,logw);


hold off;
set(gca, 'FontSize', 18);
plot(decimatelogw, logmeasuredmodG, 'square', 'LineWidth',2, 'Color', [0 0 0.7]); hold on;
xlabel('log(omega)')
ylabel('log(|G|)')
set(gca, 'FontSize', 18);
% Save diagram as colour postscript
print -depsc gain_measurements.eps

hold off;
set(gca, 'FontSize', 18);
plot(decimatelogw, logmeasuredmodG, 'square', 'LineWidth',2, 'Color', [0 0 0.7]); hold on;
plot(logw, logmodG, '-', 'LineWidth',2, 'Color', [0.7 0 0]); hold on;
xlabel('log(omega)')
ylabel('log(|G|)')
set(gca, 'FontSize', 18);
% Save diagram as colour postscript
print -depsc gain_goodfit.eps

hold off;
set(gca, 'FontSize', 18);
plot(decimatelogw, logmeasuredmodG, 'square', 'LineWidth',2, 'Color', [0 0 0.7]); hold on;
plot(logw, BADlogmodG, '-', 'LineWidth',2, 'Color', [0.7 0 0]); hold on;
xlabel('log(omega)')
ylabel('log(|G|)')
set(gca, 'FontSize', 18);
% Save diagram as colour postscript
print -depsc gain_badfit.eps

