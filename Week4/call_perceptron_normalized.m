% Load X and y from 'spambase_data.mat'
load('spambase_data.mat');

% Call your training function
w = trainPerceptronNormalized(X,y);