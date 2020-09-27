% Xinyu Ma
% 28652703
% calculating unhappy number of chain model
function unhappy = calculate2L(status,n)
% this function has been modified on the basis of calculate
% since the input itself is an array of categories, the part of calculate that converts the status to categories is deleted
ss=status;
unhappy=0;

% since it is a chain model, we don't have to consider the relationship between the first digit and the last digit
if ss(1)~=ss(2)
    unhappy=unhappy+1;
end

for i=2:n-1
    if and(ss(i)~=ss(i+1),ss(i)~=ss(i-1))
    unhappy=unhappy+1;
    end
end


if ss(n)~=ss(n-1)
    unhappy=unhappy+1;
end

end

