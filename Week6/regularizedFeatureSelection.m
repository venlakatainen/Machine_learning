function [W, cost_history] = regularizedFeatureSelection(X,y,lambdas)

    % Initialize variables
    [rows, cols] = size(X);
    P = rows;
    N = cols;
    w0 = randn(N+1,1)';
    
    
    % Number of regularization parameters lambda to test
    L = length( lambdas );
    
    % Go through all the lambdas
    for i = 1:L
        
        lambda = lambdas(i);
        
        % Call the local function
        [w, cost] = trainPerceptronL1(X,y,lambda, w0);
        
        % Return trained weights in the matrix W
        W(i,:) = w;
        
        % Return the training cost in the cost_history
        cost_history(i) = cost;
    end

end

function [w, cost] = trainPerceptronL1(X,y,lambda, w0)
    
    % Initialize problem
    [rows, cols] = size(X);
    P = rows;
    N = cols;
    X0 = [ones(P,1), X];
    ALPHA = 10^(-1);
    MAX_ITER = 1000;
    
    
    % Perform gradient descent
    [cost_min, w_min, cost_history, w_history] = gradientDescentAD(@cost_softmax, w0, ALPHA, MAX_ITER);

    % Return the best weights and the associated regularized cost
    [best_val, best_ind] = min(cost_history);
    %cost = best_val;
    %w = w_history(best_ind,:);
    w = w_min;
    cost = cost_min;
    
    % L1-regularized Softmax cost function
    function c = cost_softmax(w)
        
        %sums = sum(abs(w));

        xow = X0*w';
        u = y.*xow;
        v = exp(-u);
        s = log(1+v);
        c = (sum(s)/P)+(lambda*sum(abs(w))); % Compute
    end

end
