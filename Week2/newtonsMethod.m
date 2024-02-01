function [gw, w, g_history, w_history] = newtonsMethod(g, g_grad, g_hessian, w0, max_iter, epsilon )

    % << IMPLEMENT THE FUNCTION BODY >>
    
    % Dimension of the problem
   N = length(w0);
   
   w = w0; % << SET TO INITIAL POINT >>
   gw = g(w); % << COMPUTE g AT THE INITIAL POINT >>
   
   if nargout > 2
        w_history = [w];
        g_history = [gw];
   end
   
   
   for i = 1:max_iter
       
        %COMPUTE ALL THE NEW CANDIDATE POINTS
        w_candidates = w - g_hessian(w+epsilon)^(-1)*g_grad(w);

        % Compute function values at all the seach points at once
        g_candidates = g(w_candidates); % << APPLY g TO w_candidates >>
        
        [best_val, best_ind] = min(g_candidates); % << FIND THE BEST VALUE AND ITS LOCATION FROM g_candidates >>
        
        gw = best_val; % << STORE THE VALUE OF g AFTER TAKING THE BEST STEP >>
        w = w_candidates(best_ind,:); % << STORE THE UPDATED LOCATION AFTER TAKING THE BEST STEP USING w_candidates and best_ind >>
 
        
        if nargout > 2  % Store history if requested           
            g_history = [g_history; gw];
            w_history = [w_history; w];
        end
      
   end
   
    
end
