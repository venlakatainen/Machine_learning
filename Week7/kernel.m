function H = kernel( X, Y, type, parameter )

    switch type
        
        
        % Polynomial kernel
        case {'poly','polynomial'}
            
            D = parameter;
            mult = X*Y';
            sum_mult = (1+mult);
            H = sum_mult.^D - 1;    % COMPUTE!

        % Radial Basis Function kernel
        case 'RBF'
            
           beta = parameter;
            
            n_X = size(X, 1);
            n_Y = size(Y, 1);
            dists_sq = zeros(n_X, n_Y);
            
            for i = 1:n_X
                for j = 1:n_Y
                    dists_sq(i, j) = sum((X(i, :) - Y(j, :)).^2);
                end
            end
            
            
            H = exp(-beta*dists_sq);
            
        otherwise
            
            error('Unexpected type!')
    end

end