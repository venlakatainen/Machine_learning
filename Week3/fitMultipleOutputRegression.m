function W = fitMultipleOutputRegression( X, Y )

    % << IMPLEMENT THE FUNCTION BODY! SAMPLE SOLUTION STRUCTURE SHOWN IN THE COMMENTS BELOW. >>

    % Initialize variables and set up the problem(s)
    % Create necessary problem variables, cost function(s), initial parameters etc.
    P = 100;
    C = 2;

    alphas = [10^(-2), 10^(-2)];
    iters = [2000, 2000];
   
    w0 = [1,1,1];
    X = [ones(P,1), X];
    cost = @(w,X,y) 1/length(y)*(sum(sum(abs(X*w' - y))));
    
    
    % Solve subproblems separately in a loop
    for i = 1:C
        
        y = Y(:,i);
        max_iter = iters(i);
        alpha = alphas(i);
        % Use gradientDescentAD for the subproblem i
        % [...] = gradientDescentAD( ... );
        g = @(w) cost(w,X,y);
        
        [gw, w, g_history, w_history] = gradientDescentAD(g, w0, alpha, max_iter );
        
        % Store the result in the corresponding column of the output weight matrix
        W(:,i) = w;

    end
    
    %  If necessary, define nested helper functions below   

end

% If necessary, define local helper functions below



