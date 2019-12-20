%function[stats,ci]=sampling(Num_of_samples,Num_of_resamples)

count = 1;
while (count < 10000)
y(count) = unifrnd(-3,2);
count = count + 1;
end
figure(1);
grid on;
hist(y);
stats = [mean(y) std(y) var(y)]
title('Histogram plot for the uniformly distributed samples');
xlabel('Value of the samples');
ylabel('Number of samples');
Means = bootstrp(1000,@mean,y);
CI_mean = sort(Means);
SD=bootstrp(1000,@std,y);
CI_SD=sort(SD);
disp(['The bootstrap confidence interval for sample mean is: [',...
    num2str(CI_mean(ceil(n*0.025))),',',num2str(CI_mean(floor(n*0.975))),']']);
disp(['The bootstrap confidence interval ',...
    'for sample standard deviation is: [',...
    num2str(CI_SD(ceil(n*0.025))),',',num2str(CI_SD(floor(n*0.975))),']']);




%return 
