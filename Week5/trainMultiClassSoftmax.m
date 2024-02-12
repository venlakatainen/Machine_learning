function W = trainMultiClassSoftmax(X,y,C)

    % << COMPLETE THE FUNCTION BODY! TYPICAL SOLUTION STEPS ARE GIVEN IN COMMENTS. >>

    % Initialize variables
    
    [P, N] = size(X);
    
    X0 = [ones(P,1) X];
    w0 = randn(1,C*(N+1));

    alpha = 10;
    max_iter = 300;
    
    % Perform gradient descent on the cost_softmax function
    [gw, w, gw_history, w_history] = gradientDescentAD( @cost_softmax, w0, alpha, max_iter);
    
    % Return the best weight vector but in matrix form
    
    W = reshape(w,C,N+1);
    
    % Nested cost function
    function c = cost_softmax(w)

        % For computations, transform w into matrix form
        new_W = reshape(w, C, N+1);
        % Evaluate the Multi-Class Perceptron cost
        expo = X0*new_W';
        
        sum_exp = sum(exp(expo),2);
        log_exp = log(sum_exp);
        
        wy = new_W(y+1,:);
 
        xpwy = sum(X0.*wy,2);
       
        subs = log_exp-xpwy;
        % Evaluate the Multi-Class Perceptron cost
        c = sum(subs)/P;  % Complete the formula
        
       

    end

end
