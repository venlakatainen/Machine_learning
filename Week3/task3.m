% Load the data set from the file 'student_debt_data.csv'
A = load('student_debt_data.csv');

% Construct the design matrix X with augmented ones
X = [ones(40,1) A(:,1)];

% Construct the expected outcome vector y
y = A(:,2);


% Construct the cost function
g = @(w) 1/length(y)*transpose(sum((X*transpose(w)-y).^2)); % << COMPLETE THE ANONYMOUS FUNCTION! >>


% Set the step size
ALPHA = 10^(-8);

% Set the upper limit of iterations
MAX_ITER = 200;


% Set the starting point of iteration
w0 = [1, 1];


% Solve the weights using GD with AD
[gw, w, g_history, w_history] = gradientDescentAD( g, w0, ALPHA, MAX_ITER );

% Plot the result (not mandatory, but beneficial)
figure
subplot(211)
plot( g_history )
title('Cost history', 'r' )
xlabel('Iteration number')
ylabel('Cost (g(w))')
set(gca, 'XScale', 'log')
set(gca, 'YScale', 'log')

subplot(212)
f = @(x,y) g([x y]); 
fcontour(@(x,y) arrayfun(f,x,y), [-1000 1000 -100 100])
hold on
plot( w_history(:,1), w_history(:,2), 'r' )
xlabel('w_1')
ylabel('w_2')
title('Cost contour and weight history')