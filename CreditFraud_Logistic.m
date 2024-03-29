%Fraud prediction%

data = csvread('CreditFraud.csv');
X = data(:,[1,2]); 
y = data(:,3);

%plot
figure; hold on;
pos = find(y==1); neg = find(y == 0);
% Plot Examples
plot(X(pos, 1), X(pos, 2), 'k+','LineWidth', 2, ...
     'MarkerSize', 7);
plot(X(neg, 1), X(neg, 2), 'ko', 'MarkerFaceColor', 'y', ...
     'MarkerSize', 7);

% Put some labels 
hold on;
% Labels and Legend
xlabel('No.of Attempt')
ylabel('Transfer amount')

% Specified in plot order
legend('Fraud', 'Not Fraud')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;

%cost and gradient

%setting initial parameters
[m,n] = size(X);
X = [ones(m,1) X];
initial_theta = zeros(n + 1, 1);
m = length(y)
J = 0;

%cost and gradient for theta zero
grad = zeros(size(initial_theta));

h_of_x = 1./(1+exp(-(X * initial_theta)));

J = 1 / m * sum( -1 * y' * log(h_of_x) - (1-y') * log(1 - h_of_x) );

grad = 1 / m * (X' * (h_of_x - y));

fprintf('Cost at initial theta (zeros): %f\n', J);
fprintf('Gradient at initial theta (zeros): \n');
fprintf(' %f \n', grad);

%Appying gardient descend to find optimal theta using fminunc
%  Set options for fminunc
options = optimset('GradObj', 'on', 'MaxIter', 400);

%  Run fminunc to obtain the optimal theta
%  This function will return theta and the cost 
[theta, cost] = ...
	fminunc(@(t)(costFunction(t, X, y)), initial_theta, options);

% Print theta to screen
fprintf('Cost at theta found by fminunc: %f\n', cost);
fprintf('theta: \n');
fprintf(' %f \n', theta);

% Plot Boundary
figure;
plotDecisionBoundary(theta, X, y);

% Put some labels 
hold on;
% Labels and Legend
xlabel('No.of Attempt')
ylabel('Transfer Amount')

% Specified in plot order
legend('Fraud', 'Not Fraud')
hold off;

fprintf('\nProgram paused. Press enter to continue.\n');
pause;


%prediction and accuracy

prob = sigmoid([1 111 650] * theta);
fprintf(['For a person with attempt 111 and 650, we predict fraud transaction ' ...
         'probability of %f\n'], prob);

% Compute accuracy on our training set
p = predict(theta, X);

fprintf('Train Accuracy: %f\n', mean(double(p == y)) * 100);
fprintf('\n');
