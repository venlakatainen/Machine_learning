% Load the data set
A = load('breast_cancer_data.csv');

% Form the feature matrix. The first 8 rows in the data set are features. Do not modify the orientation!
X = A(1:end-1,:)';

% Form the class label vector. The last row in the data set is the class. Do not modify the orientation!
y = A(end,:)';

% Call your training function. The result (w) must be a row vector!
w = trainPerceptron(X,y);
