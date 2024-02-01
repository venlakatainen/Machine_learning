function [gw, w, g_history, w_history] = gradientDescentAD( g, w0, alpha, max_iter )

    % << IMPLEMENT THE FUNCTION BODY! >>
    
    % Initial point and the function value at it.
    w = w0;
    gw = g(w);
    
    % Initialize search history, if requested
   if nargout > 2
        w_history = [w];
        g_history = [gw];
   end
    
   % Computes the function value and the gradient of any function given by the handle f at x
    function [fval, gradval] = wrapper(f, x)
        fval = f(x);
        gradval = dlgradient(fval,x);
    end
    
    
    for i = 1:max_iter
        
        % define this convinience function to map the wrapper to one parameter function with our function as a fixed input
        h = @(w) wrapper(g,w);
        
        % Convert the input data to the dlarray type
        w0 = dlarray(w);

        % Call the wrapper with fixed f using h
        [fval,gradval] = dlfeval(h,w0);
        
        %COMPUTE ALL THE NEW CANDIDATE POINTS
        w_cand = w - alpha*extractdata(gradval);

        % Compute function values at all the seach points at once
        g_cand = g(w_cand); 
        
        % Find the best value and index based on the function values at the candidate points. 
        [best_val, best_ind] = min(g_cand);
        

        gw = best_val; % STORE THE VALUE OF g AFTER TAKING THE BEST STEP
        w = w_cand(best_ind,:); %  STORE THE UPDATED LOCATION AFTER TAKING THE BEST STEP 
        
        
        if nargout > 2  % Store history if requested           
            g_history = [g_history; gw];
            w_history = [w_history; w];
        end
 
        
    end
end
