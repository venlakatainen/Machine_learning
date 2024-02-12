function W = trainOneVsAll( X, y, C )

    % << IMPLEMENT FUNCTION BODY. SOME USUAL MAJOR STEPS ARE GIVEN IN THE COMMENTS BELOW >>

    % Initialize variables
  
    
    % Perform One-vs-All: Train each class against all the others one by one
    for i = 1:C
        y_label = [];

        % Form the two-class problem

        for j=1:length(y)
            if y(j) == i-1
                y_label = [y_label 1];
            else
                y_label = [y_label -1];
            end
        end

        y_label = y_label';

        % Use trainPerceptron on the two-class problem

        [w, cost_history, w_history] = trainPerceptron(X,y_label);

        % Store the best weight
        W(i,:) = w; % pick the best weight here
        
    end

    % Normalize weights
     ww = W;
     ww(:,1) = [];
     sums = sqrt(sum(ww.^2,2));
     W = W./sums;
    
end
