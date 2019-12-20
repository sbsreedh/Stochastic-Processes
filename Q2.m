%-------------------------------------------------------------------------%
% Problem 2                                                               %
%-------------------------------------------------------------------------%
n = input('Please enter the number of samples: ');
Xk = rand(1,n);               % Xk is X_k
Xk1 = circshift(Xk,1,2);      % Xk1 is X_k+1 by shift array circularly
Xk1(1) = 0;                   % Set the first element to 0 to get X_k+1
Cov_a = cov(Xk,Xk1)           % Get covariance matrix

disp(['Cov[X_k, X_k+1] is: ',num2str(Cov_a(2,1))]);

Yk = [];                      % Create Yk

for k =4:n
Yk(k)= Xk(k) - 2*Xk(k - 1) + 0.5*Xk(k - 2) - Xk(k - 3);
end

Cov_b = cov(Xk,Yk)

disp(['Cov[X_k, Y_k] is: ',num2str(Cov_b(2,1))]);