clear
clc
%Q2
%importing data
distillation = readtable('distillation.csv');
%time 
time = distillation(:,1);
time = table2array(time);
%extracting features from data 
dist_features = distillation(:,2:width(distillation));
%convert table to array
dist_features = table2array(dist_features);
dist_features(:,8:9)=[];

%computing NIPALS PCA using different numbers of PCs
[t_3,p_3,R2_3] = nipalspca(dist_features,3);
[t_4,p_4,R2_4] = nipalspca(dist_features,4);
[t_5,p_5,R2_5] = nipalspca(dist_features,5);

bar(R2_4);
xlabel('Principal Component');
ylabel('Cumulative Variance');
title('Bar plot of Cumulative Variance of each Principal Component')

%scores 1 and 2 
t1 = t_3(:,1);
t2 = t_3(:,2);



%plotting score plot
scoreplot(t1,t2,time);


%Extracting categories from distillation
dataset = distillation.Properties.VariableNames;

%Extracting only categories that are features 
dataset_features = dataset(:,2:width(distillation));
dataset_features(:,8:9) = []; 

%loadings 1 and 2
p1 = p_3(:,1);
p2 = p_3(:,2);

%plotting loading plot for 1st PC
loading_plot(p1,1,dataset_features);

%plotting loading plot for 2nd PC
loading_plot(p2,2,dataset_features);

%score loading plot
score_loading_plot(t1,t2,p1,p2,dataset_features);