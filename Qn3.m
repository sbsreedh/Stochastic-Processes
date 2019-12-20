%-------------------------------------------------------------------------%
% Problem 3                                                               %
%-------------------------------------------------------------------------%
clc;
n =1000; %input('Please enter the number of samples: ');
M = 10;
A = randi([0 M-1],1,n);     % A is the randaom number from 0,1,...,9

hist(A)
title(['n=',num2str(n)])

X = hist(A);
xlabel('The range of samples');
ylabel('Frequency of samples');
X_theo = repmat(n/M,1,M);   % Expected number of samples
ChisquaredTest = sum((X-X_theo).^2./X_theo);
ChisquaredThreshold_95 = chi2inv(0.95,M-1);

disp(['ChisquaredTest = ',num2str(ChisquaredTest), ...
    ',	ChisquaredThreshold_95 = ',num2str(ChisquaredThreshold_95)]);

X2 = [X(2:10) 0];           % The data in the range 1,2,...,10
ChisquaredTest = sum((X2-X_theo).^2./X_theo);
ChisquaredThreshold_95 = chi2inv(0.95,M-1);

disp(['ChisquaredTest = ',num2str(ChisquaredTest), ...
    ',	ChisquaredThreshold_95 = ',num2str(ChisquaredThreshold_95)]);
%-------------------------------------------------------------------------%