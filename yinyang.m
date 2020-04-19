%YINYANG Training/test data drawn from the yin-yang 'distribution'.
%    [X T] = YINYANG(N) returns a set of binary labeled data drawn
%    from a yin-yang 'distribution'. 
%    X is of size [N 2]
%    T is of size [N 1]

function [x t] = yininyinang(N)

M = round(4*N/pi);

yinyang = 2 * rand(M, 2) - ones(M, 2);

c = yinyang(:,1).^2 + yinyang(:,2).^2 < 1;
yinyang = yinyang(c,:);

while (length(yinyang) < N)
    p = 2*rand(1,2) - [1 1];
    yinyang = [yinyang ; p];
    c = yinyang(:,1).^2 + yinyang(:,2).^2 < 1;
    yinyang = yinyang(c,:);    
end;

if (length(yinyang) > N)
    yinyang = yinyang(1:N,:);
end

yin = yinyang;

c = (yin(:,1)-1/2).^2 + yin(:,2).^2 < 1/36;

yin = setdiff(yin, yin(c,:), 'rows');

c = (yin(:,1) > 0) .* (yin(:,2) > 0) .* ...
    ((yin(:,1)-1/2).^2 + yin(:,2).^2) > 1/4;

yin = setdiff(yin, yin(c,:), 'rows');

c = logical((yin(:,1) < 0) .* (yin(:,2) > 0) .* ...
     ((yin(:,1) + 1/2).^2 + yin(:,2).^2 > 1/36));

yin = setdiff(yin, yin(c,:), 'rows');

c = logical((yin(:,1) < 0) .* (yin(:,2) < 0) .* ...
     ((yin(:,1) + 1/2).^2 + yin(:,2).^2 > 1/36) .* ...
     ((yin(:,1) + 1/2).^2 + yin(:,2).^2 < 1/4));

yin = setdiff(yin, yin(c,:), 'rows');
yang = setdiff(yinyang, yin, 'rows');

x = [yin; yang];
t = [ones(length(yin),1); zeros(length(yang), 1)];




