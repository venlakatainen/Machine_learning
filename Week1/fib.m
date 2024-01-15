function s = fib(n)

    % COMMENTS BELOW SHOW TYPICAL STEPS YOU MIGHT TAKE IN YOUR SOLUTION

    % 1. Initialize correct size return variable vector for speed
    
    s = zeros(1,n);
    
    
    if (n > 0)
        % 2. First element initialization
        s(1) = 0;
        
        if (n > 1)
            % 3. Second element initialization
            s(2) = 1;
        
            % 4. Fill in the remaining elements    
            for count=3:length(s);
                prev1 = s(count-2);
                prev2 = s(count-1);
                
                s(count) = prev1+prev2;
            end
        end
    end

end
