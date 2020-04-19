% --------------------------------------------------------------------
% Calculate the local gradient given a teaching sample
%
% Parameters:
%   d: desired sample output
%   W: weight vector cell array
%   dtheta: derivative of the activation function
%   Y: cell array with the output of the neurons
%   V: cell array with the total input of the neurons
%
% Returns:
%   Delta: local gradient for each neuron
%   E: square network error for current teaching sample
%
% Copyright(c) 2014 Andras Joo
% For educational purposes only.
% --------------------------------------------------------------------

function [Delta, E] = localgrad(d, W, dtheta, Y, V)

e = d - Y{end};
E = 0.5*e'*e;
Delta = {};
n = length(Y);
Delta{n} = e.*dtheta(V{n});

% NB local gradients are not calculated for the input neurons
for j = n-1:-1:2
  Delta{j} = dtheta(V{j}).* (W{j}' * Delta{j+1});
end



