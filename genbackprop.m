%---------------------------------------------------------------------
% Generic backpropagation algorithm
% Parameters:
%   X : input matrix; each input sample is a row vector
%   D : desired/target outputs (row-wise)
%   theta, dtheta: activation function and its derivative
%   maxiter: maximum number of iterations
%   epsilon: error threshold
%   lr: learning rate
%
% Output: weight cell array
%
%
% IMPORTANT: bias is not inserted by genbackprop, you have
% to take care of it manually.
%
% Copyright (c) 2014 Andras Joo
% For educational purposes only.
%---------------------------------------------------------------------

function W = genbackprop(X, D, layers, theta, dtheta, maxiter, epsilon, lr)

% initialize weights
W = {};
for i = 1:length(layers)-1
  W{i} = randn(layers(i+1),layers(i));
end

for i = 1:maxiter
  GE = 0;

  for j = 1:size(X,1) 
    [Y, V] = forwardprop(X(j,:)', W, theta);
    [Delta, E] = localgrad(D(j,:)', W, dtheta, Y, V);        
    W = updateweights(W, Delta, Y, lr);    
    GE = GE + E; 
  end
  
  fprintf('iter: %i, global error: %.4f\n', i, GE);
  
  if GE < epsilon, break; end
end

fprintf('Training finished. Global error is %.3f.\n', GE);
