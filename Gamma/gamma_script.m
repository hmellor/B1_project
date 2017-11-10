%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gamma_script.m
% DWM 
% 6/9/10
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

a     = 600;
b     = -2;
c     = 0.01;

S     = 1300;
x0    = 500;
sigma = 3;

noisesigma=50;

mx    = (450:1:550);
background= gamma_count(a,b,c,0,x0,sigma,mx,noisesigma);
count     = gamma_count(a,b,c,S,x0,sigma,mx,noisesigma);

x     = (450:.1:550);
fitted= gamma_count(a,b,c,S,x0,sigma,x,0);


hold off;
set(gca, 'FontSize', 18);
plot(mx, background, 'x', 'LineWidth',2, 'Color', [0.7 0 0]); 
axis([450 550 300 2000]);
hold on;
xlabel('Energy (keV)')
ylabel('Count')
set(gca, 'FontSize', 18);
% Save diagram as colour postscript
print -depsc gamma_background.eps

hold off;
set(gca, 'FontSize', 18);
axis([450 550 300 2000]);
plot(mx, count, 'x', 'LineWidth',2, 'Color', [0.7 0 0]);
axis([450 550 300 2000]);
hold on;
xlabel('Energy (keV)')
ylabel('Count')
set(gca, 'FontSize', 18);
% Save diagram as colour postscript
print -depsc gamma_count.eps

hold off;
axis([450 550 300 2000]);
plot(mx, count, 'x', 'LineWidth',2, 'Color', [0.7 0 0]);
axis([450 550 300 2000]);
hold on;
plot(x, fitted, '-', 'LineWidth',2, 'Color', [0 0 0.7]);
axis([450 550 300 2000]);
hold on;
xlabel('Energy (keV)')
ylabel('Count')
set(gca, 'FontSize', 18);
% Save diagram as colour postscript
print -depsc gamma_fit.eps

