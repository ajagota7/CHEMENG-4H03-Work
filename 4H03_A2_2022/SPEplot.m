% function that creates a SPE plot

% Jake Nease
% Chemical Engineering
% McMaster University

% Pass in the residuals

function [F] = SPEplot(res)

% calculate SPE
N = size(res,1);
SE = res.^2;
SPE = sum(SE,2);

% get degrees of freedom
v = std(SPE)^2;
m = mean(SPE);
df = (2*m^2)/v;

% calculate SPE limits
SPE95lim = (v/(2*m))*chi2inv(0.95,df);
SPE99lim = (v/(2*m))*chi2inv(0.99,df);

% plot SPE along with confidence limits
F = figure;
x = 1:N;
y95 = ones(1,N)*SPE95lim;
y99 = ones(1,N)*SPE99lim;

plot(x,SPE,'ko-')
hold on
plot(x,y95,'--r')
plot(x,y99,'-r')

box on;
grid on;

xlabel('Observation')
ylabel('Squared Prediction Error')
legend('SPE Values','95% Limit','99% Limit')


hold off;

end