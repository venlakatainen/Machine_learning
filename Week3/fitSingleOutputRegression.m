% The main function to do the non-linear fitting
function [theta, cost_history, theta_history] = fitSingleOutputRegression( X, y, theta0, alpha, max_iter )

    % << IMPLEMENT THE FUNCTION BODY! TYPICAL STEPS ARE GIVEN IN COMMENTS BELOW >>

    % Initialize variables
    
    w0 = theta0;
    g = @(theta) cost(theta);
    
    % Solve the weights using GD with AD, call [...] = gradientDescentAD(...)
    [gw, w, g_history, w_history] = gradientDescentAD(g, w0, alpha, max_iter );

    cost_history = g_history;
    theta_history = w_history;
    theta = w;
    %cost_history = g_history;
    %theta_history = w_history;
    %theta = min(cost_history);
    
    % Return the best solution, and the histories
    
    % This function computes the least squares cost function
    % NOTE: As a nested function, it can use X and y directly and needs only the parameter vector theta
    function c = cost(theta)
        c = 1/length(y)*transpose(sum((model(X, theta)-y).^2)); % << IMPLEMENT using the model function! >>
        
    end

end % End of function fitSingleOutputRegression

% Local helper functions below

% This function transforms the features x non-linearly using the parameters v
function z = feature_transform( x, v ) %f(x)
    z = [ones(21,1), sin(v(1)+x.*v(2))]; % << COMPUTE THE TRANSFORM >>
end

% This function applies the model specified by the parameters theta to the data x
function y = model(x, theta) % x = z
    feat_trans = feature_transform(x,transpose([theta(1), theta(2)]));
    y = feat_trans*transpose([theta(3), theta(4)]); % << COMPUTE MODEL OUTPUT ON TRANSFORMED DATA WITH THE GIVEN PARAMETERS >>
end
