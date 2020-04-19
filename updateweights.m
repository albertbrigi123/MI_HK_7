% --------------------------------------------------------------------
% Update the weight vectors using the generalized delta rule.
%
% Parameters:
%    W: old weight matrices
%    Delta: local gradients
%    Y: neuron output
%    lr: learning rate
%
% Returns:
%    W: the actualized weights
%
% Copyright(c) 2014 Andras Joo
% --------------------------------------------------------------------

function W = updateweights(W, Delta, Y, lr)

for i = 1:length(W)
    W{i} = W{i} + lr * Delta{i+1} * Y{i}'; % outer product! 
end

