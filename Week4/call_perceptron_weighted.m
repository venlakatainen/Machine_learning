% Load the data from the file named '3d_classification_data_v2_mbalanced.csv'
A = load('3d_classification_data_v2_mbalanced.csv');

% Form the feature matrix from the first and second row of the data
X = A(1:2,:)';

% Form the class column vector from the last row in the data
y = A(3,:)';

% Initialize the weight column vector with the same unit weight for each sample
betas = ones( size(y) );

% Call your training function
w = trainPerceptronWeighted(X,y,betas);
