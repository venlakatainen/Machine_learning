function w = trainPerceptronNormalized(X,y)

    % Initialize variables and set up the problem
    
    [rows, cols] = size(X);
    P = rows;
    N = cols;

    % Use normalized data instead of the original one
    X = normalize(X);
    X0 = [ones(P,1), X];
    w0 = randn(N+1,1)';
    
    ALPHA = 10^(-1);
    MAX_ITER = 3000;
    
    % Solve the problem using gradientDescentAD
    
    [cost_min, w_min, cost_history, w_history] = gradientDescentAD(@cost_perceptron, w0, ALPHA, MAX_ITER);
    
    w = w_min;
    
    
    function c = cost_perceptron(w)
        xow = X0*w';
        u = y.*xow;
        v = exp(-u);
        s = log(1+v);
        c = sum(s)/P;
    end

end


