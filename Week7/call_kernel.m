% Create four samples of six dimensional data
X = reshape( 1:24, 4, 6 );

% Get the first column of kernel matrix
h_1 = kernel( X, X(1,:), 'polynomial', 3 );

% Get the full kernel matrix
H = kernel( X, X, 'polynomial', 3 );

% Kernelization of a random 6D-point
y = randn(1,6);
hy = kernel( X, y, 'polynomial', 3 );

% Kernelization of 20 random points for simultanous model evaluation
Y = randn(20,6);
Hx = kernel( X, Y, 'polynomial', 3 );

