function c = classifyMultiClass( W, X )

    % IMPLEMENT FUNCTION BODY
    [rows, cols] = size(X);

    X0 = [ones(rows,1) X];

    y_hat = X0*W';

    [argmax, index] = max(y_hat, [], 2) ;
    
    c = index - 1; 

end
