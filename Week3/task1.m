% Load the data from 'regression_outliers.csv' using the load function
A = load('regression_outliers.csv');

% Load the weights from 'problem1.mat' using the load function
load('problem1.mat');

x = A(1,:);
y = A(2,:);

% Construct the Least Squares cost function
cost_LS = @(w) LS_cost(w,x,y);  % Complete the anonymous function

% Construct the Least Absolute Deviations cost function
cost_LAD = @(w) LAD_cost(w,x,y); % Complete the anonymous function


% Compute the LS cost on weights w_LS and w_LAD
cost_LS_wLS = cost_LS(w_LS);  % Evaluate cost_LS at w_LS
cost_LS_wLAD = cost_LS(w_LAD); % Evaluate cost_LS at w_LAD



% Compute the LAD cost on weights w_LS and w_LAD
cost_LAD_wLS = cost_LAD(w_LS); % Evaluate cost_LAD at w_LS
cost_LAD_wLAD = cost_LAD(w_LAD); % Evaluate cost_LAD at w_LAD



% Create 100 evenly spaced grid of points between -2 and 2 (inclusive) for model evaluation and plotting. Create a column vector
x = transpose(linspace(-2,2)); % [-2.0000;   -1.9596;   -1.9192; ...; 2.0000]
    


% Evaluate the LS model at x, i.e. use w_LS to calculate output at the points in x. Create a column vector of results
y_LS = model(x, w_LS);

% Evaluate the LAD model at x, i.e. use w_LAD to calculate output at the points in x.  Create a column vector of results
y_LAD = model(x, w_LAD);

% Plot the result
figure
scatter( A(1,:), A(2,:) )
hold on
plot( x, y_LS )
plot( x, y_LAD, '--' )
legend('data','Least Squares', 'Least Absolute Deviations','Location','NorthWest')
axis([-2 2 -5 12 ])
xlabel('x')
ylabel('y')

function at = model(C,D)
    
    a = D(1) + transpose(C).*D(2);
    at = transpose(a);

end

function cost_ls = LS_cost(w,A,B)
    
    cost_sum = sum((model(A,w) - B).^2);

    cost_ls = cost_sum/length(B);
    
end


function cost_lad = LAD_cost (w,A,B)
    
    
    cost_sum = sum(abs(model(A,w) - B));

    cost_lad = cost_sum/length(B);

end


