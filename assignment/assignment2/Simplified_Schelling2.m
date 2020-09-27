% Xinyu Ma
% 28652703
% ring model, adding a simulation function for the probability of "error exchange"
% this function has been modified on the basis of Simplified_Schelling, so most of the code is the same
function [last,status,unhappy] = Simplified_Schelling2(n,white,in,e,T)

unhappy=zeros(T+1,1);
unhappy(1)=calculate(in,n,white);
status=[in;zeros(T,n)];

for t=1:T
    status(t+1,:)=status(t,:);
    trading_places=randperm(n,2);
    
    status(t+1,[trading_places(1) trading_places(2)])=...
        status(t+1,[trading_places(2) trading_places(1)]);
    unhappy(t+1)=calculate(status(t+1,:),n,white);
   
    % here is the difference
    r=rand; % generate a random number between 0 and 1 for probability judgment
    
    % due to the previous part of the function, the pre-exchange has been completed at time t+1
    % therefore, if the exchange requirement is not met, the state at time t+1 is the same as at time t
    
 
    if or(and(unhappy(t+1)>=unhappy(t),r>=e),...
            and(unhappy(t+1)<unhappy(t),r<e))  
        status(t+1,:)=status(t,:);
        unhappy(t+1)=unhappy(t);
    end
    
end
% if the final output does not start with "1", put "1" in the first place through the following three lines of code
% for example, [2,1,4,3] will become [1,4,3,2] after execution
% the output that starts with 1 will remain unchanged
L=status(T+1,:);
p1=find(L==1);  % find the location of 1 
last=L([p1:end 1:p1-1]); % put the numbers of this position and the following positions in front, and the numbers of the remaining positions are shifted to the back
end