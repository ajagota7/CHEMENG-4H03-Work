% function that creates a loadings bar plot

% Jake Nease
% Chemical Engineering
% McMaster University

% Pass in the appropriate loading
% Pass in the tag of the loading (1, 2, 3 etc)
% Pass in the names of the data labels

function [F] = loading_plot(p,number,Dataset)

switch nargin
    case 3
        D = categorical(Dataset); % <-- needed for bar plot
    otherwise
        Dataset = {};
        for i = 1:length(p)
            Dataset = [Dataset, ['Var ',num2str(i)]];
        end
        D = categorical(Dataset); % <-- needed for bar plot
end

% Make the actual loadings plot
F = figure;
hold on;

bar(D,p','FaceColor','red','EdgeColor','black');
grid on;
box on;
ylabel(['Loadings for Component ' num2str(number)]);
title(['Loadings bar plot of Component ' num2str(number)]);
xlabel('Variables');

hold off;

end