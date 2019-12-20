%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% EE511-FAll 2019
% Project #2
% Samples and Statistics
% Author: Sonali B Sreedhar
% Date:09/10/2019
% USC ID:1783668369
% Email ID: sbsreedh@usc.edu
%-------------------------------------------------------------------------%
%Simulate sampling uniformly (how many?) on the interval [-3,2]. 
% 1.	Generate a histogram of the outcomes. 
% 2.	Compute the sample mean and sample variance for your samples.
% .     How do these values compare to the theoretical values? 
% .     If you repeat the experiment will you compute a different 
%       sample mean or sample variance? 
% 3.	Compute the bootstrap confidence interval (what width?) 
%       for the sample mean and sample standard deviation. 
%--------------------------------------------------------------------------%
% Bootstrapping means random sampling with replacement.
% bootci - Bootstrap Confidence interval 
% bootstat = bootstrp(nboot,bootfun,d1,...) draws nboot bootstrap data samples,
% computes statistics on each sample using bootfun, and returns the results 
% in the matrix bootstat. nboot must be a positive integer. bootfun is a function
% handle specified with @. Each row of bootstat contains the results of applying 
% bootfun to one bootstrap sample. If bootfun returns a matrix or array, then this
% output is converted to a row vector for storage in bootstat.
% nboot is a positive integer indicating the no. of bootstrap data sample.
%

clear;
a=-3;
b=2;
n = input('Please enter the number of samples: ');
X = [];  % X stores the sample outcomes

for i = 1:n
    % Generate random number in [-3,2] and store in X
    X = [X 5*rand() - 3];   
end
%To plot the histogram for the samples
hist(X);
title(['n=',num2str(n)]);
xlabel('Value of samples');
ylabel('Number of samples');
% Theoritical Calculations through simulations of set of samples
disp(['The sample mean is: ',num2str(mean(X))]);
disp(['The sample variance is: ',num2str(var(X))]);

M = sort(bootstrp(n,@mean,X));
S = sort(bootstrp(n,@std,X));


xlabel('Mean of samples');
ylabel('Value of Samples');
E=(a+b)/2;
V=((b-a)^2)/12;
disp(['The theoretical  sample mean is:',num2str(E)]);
disp(['The theoretical  sample variance is:',num2str(V)]);
%disp(E);
% Get index of 2.5% point and 97.5% point
disp(['The bootstrap confidence interval for sample mean is: [',...
    num2str(M(ceil(n*0.025))),',',num2str(M(floor(n*0.975))),']']);
disp(['The bootstrap confidence interval ',...
    'for sample standard deviation is: [',...
    num2str(S(ceil(n*0.025))),',',num2str(S(floor(n*0.975))),']']);