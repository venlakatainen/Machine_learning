% The cost function
g = @(w) (1/50) * ( w.^4 + w.^2 + 10*w ) + 0.5;

% The derivative of the cost function
g_grad = @(w) (1/50) * ( 4*w.^3 + 2*w + 10 );

% The second derivative of the cost function
g_hessian = @(w) (1/50) * ( 12*w.^2 + 2 );

% Initial point
w0 = 2.5;

% Upper limit for iterations after the initial point
MAX_ITER = 4;

% Regularization parameter
EPSILON = 1e-7;

% Call newtonsMethod
[gw, w, g_history, w_history] = newtonsMethod(g, g_grad, g_hessian, w0, MAX_ITER, EPSILON )

% Plot result (not mandatory, but beneficial)
figure;

subplot(411)
x = -3:0.1:3;
plot(x, g(x), x, g_grad(x), x, g_hessian(x) )
legend('g', 'g''', 'g''''');
xlabel('w')
ylabel('function value')

subplot(412)
plot(g_history)
xlabel('Iteration #')
ylabel('g(w)')

subplot(413)
plot( w_history  )
xlabel('Iteration #')
ylabel('w')

subplot(414)
plot( x, g(x), w_history, g_history, 'd' )
text( w_history+0.05, g_history-0.15, cellfun(@(x) ['#' num2str(x)], num2cell(1:length(w_history)), 'UniformOutput', false))
xlabel('w')
ylabel('g(w)')
legend('g', 'Newton steps', 'Location', 'NorthWest');
