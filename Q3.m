clear;
n = input('Please enter the number of samples: ');
X = [];               % X stores the sample outcomes
M=10;
A=randi([0,M-1],1,n);
hist(A);
title('n=',num2str(n));
xlabel('Value of Samples');
ylabel('Number of Samples');
