% function that creates a basic score plot, including T2 limits
% Jake Nease
% Chemical Engineering
% McMaster University

% Pass in any two score vectors t1 and t2

function [F] = scoreplot(t1,t2, time)

% Make the actual score plot

F = figure;
hold on;
%plot(t1,t2,'ko')

%modified plot to have time accounted for
scatter(t1, t2, 20, time)
a = colorbar;
ylabel(a,'time (s)', 'Rotation',0)
title('Score Plot of Principal Components 1 and 2')

box on;
grid on;

xlabel('First Score t_1');
ylabel('Second Score t_2');


% Plot the T2 elipses
N = length(t1);
a = (std(t1))^2;
b = (std(t2))^2;

% calculate T2 limits
A = 2;
Flim95 = finv(0.95,A,(N-A));
Flim99 = finv(0.99,A,(N-A));
T2lim95 = ((N-1)*(N+1)*A*Flim95)/(N*(N-A));
T2lim99 = ((N-1)*(N+1)*A*Flim99)/(N*(N-A));

% (t1/s1)^2 + (t2/s2)^2 = T2lim
% t1 is x and t2 is y
% parametric eqn for an elipse (RHS needs to be 1): (x,y) =
% (a*cos(theta),b*sin(theta)) for 0 <= theta <= 2*pi
% eqn becomes t1^2/(T2lim*s1^2) + t2^2/(T2lim*s2^2) = 1

% calculate elipse distances
theta = linspace(0,2*pi,50);
x95 = sqrt(a*T2lim95)*cos(theta);
y95 = sqrt(b*T2lim95)*sin(theta);
x99 = sqrt(a*T2lim99)*cos(theta);
y99 = sqrt(b*T2lim99)*sin(theta);

% plot elipse
plot(x95, y95, '--r')
hold on
plot(x99, y99, '-r')

if max(x99) > max(abs(t1))
    plot([-max(x99)*1.25 max(x99)*1.25], [0 0],'k-','LineWidth',2)
    xlim = [-max(x99)*1.25 max(x99)*1.25];
else
    plot([-max(abs(t1))*1.25 max(abs(t1))*1.25], [0 0],'k-','LineWidth',2)
    xlim = [-max(abs(t1))*1.25 max(abs(t1))*1.25];
end

if max(y99) > max(abs(t2))
    plot([0 0], [-max(y99)*1.25 max(y99)*1.25], 'k-','LineWidth',2)
    ylim = [-max(y99)*1.25 max(y99)*1.25];
else
    plot([0 0], [-max(abs(t2))*1.25 max(abs(t2))*1.25], 'k-','LineWidth',2)
    ylim = [-max(abs(t2))*1.25 max(abs(t2))*1.25];
end

axis([xlim ylim])


hold off;

end