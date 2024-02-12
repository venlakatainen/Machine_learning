function W = trainMultiClassPerceptron(X,y,C)

   % << COMPLETE THE FUNCTION BODY! TYPICAL SOLUTION STEPS ARE GIVEN IN COMMENTS. >>

    % Initialize variables
    [P, N] = size(X);
    
    X0 = [ones(P,1) X];
    w0 = randn(1,C*(N+1));

    alpha = 10;
    max_iter = 3000;
    
    % Perform gradient descent on the cost_perceptron function
    [gw, w, gw_history, w_history] = gradientDescentAD( @cost_perceptron, w0, alpha, max_iter);
    
    % Return the best weight vector but in matrix form
    
    min_w = min(w_history);
    
    W = reshape(min_w',C,N+1);
    
    % Nested cost function
    function c = cost_perceptron(w)

         % For computations, transform w into matrix form
        new_W = reshape(w, C, N+1);
        % Evaluate the Multi-Class Perceptron cost
       
        maxi = max(X0*new_W', [], 2);
        
        wy = new_W(y+1,:);
 
        xpwy = sum(X0.*wy,2);
       
        subs = maxi-xpwy;
    
        c = sum(subs)/P;    % Complete the formula

    end

end
