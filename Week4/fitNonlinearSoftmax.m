function theta = fitNonlinearSoftmax( X, y )

    % Initialize variables
    [rows, cols] = size(X);
    P = rows;
    N = cols;

    X0 = [ones(P,1), X];
    w0 = randn(N+1,1)';
    
    ALPHA = 10;
    MAX_ITER = 3000;
    
    % Solve the problem using gradientDescentAD
    
    [cost_min, w_min, cost_history, w_history] = gradientDescentAD(@cost, w0, ALPHA, MAX_ITER);
    
    theta = w_min;

   
    
    % This function computes the Softmax cost function on nonlinear model
    
    function c = cost(theta)
        model_xp_theta = model(X0, theta);
        u = y.*model_xp_theta;
        v = exp(-u);
        s = log(1+v);
        c = sum(s)/P; 

    end

end

% Local helper functions below

% This function transforms the features X non-linearly using the parameters v
function z = feature_transform( X, v )
    z = X.^(2);
end

% This function applies the model specified by the parameters theta to the data X
function y = model(X, theta)
    f0 = feature_transform(X);
    y = f0*theta';   
end
