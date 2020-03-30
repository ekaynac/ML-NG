function [C_testing, sigma_testing] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C_testing = 1;
sigma_testing = 0.1;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
result = zeros(64,3);

error_row=1;

test_set = [0.01;0.03;0.1;0.3;1;3;10;30];
for C_testing=[0.01;0.03;0.1;0.3;1;3;10;30];
    for sigma_testing=[0.01;0.03;0.1;0.3;1;3;10;30];
        
        model = svmTrain(X, y, C_testing, @(x1, x2) gaussianKernel(x1, x2, sigma_testing));
        predictions = svmPredict(model, Xval);
        error = mean(double(predictions ~= yval));
        
        result(error_row,:) = [C_testing,sigma_testing,error];
        error_row = error_row + 1;
    end
end



sorted = sortrows(result,3);

C = sorted(1,1)
sigma = sorted(1,2)
% =========================================================================

end
