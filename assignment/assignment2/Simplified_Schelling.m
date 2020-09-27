% Xinyu Ma
% 28652703
% simulation function for part2a
function [status,unhappy] = Simplified_Schelling(n,white,in,T)
% n: scale
% white: number of category
% in: initial state
% T: maximum simulation time
unhappy=zeros(T+1,1); % array for unhappy people 
unhappy(1)=calculate(in,n,white); % calculate the number of unhappy people in the initial state and record
status=[in;zeros(T,n)]; % each row of the array records the state at each time point and place the initial state on the 1st row

for t=1:T 
status(t+1,:)=status(t,:); % record the state of time t in t+1 for upcoming operations

trading_places=randperm(n,2); % randomly generating matching positions
                              
                            
                              
                              
                              % take the first two numbers as the matching result, for example [1,4]

status(t+1,[trading_places(1) trading_places(2)])=...
    status(t+1,[trading_places(2) trading_places(1)]);  % pre-exchange the agent number in the matching position
unhappy(t+1)=calculate(status(t+1,:),n,white); % calculate the number of unhappy people after pre-exchange, used to determine whether to exchange

% if the number of unhappy people does not change or increase after the pre-exchange, then the state at time t+1 will remain the same as at time t+1
if unhappy(t+1)>=calculate(status(t,:),n,white) 
    status(t+1,:)=status(t,:);
    unhappy(t+1)=unhappy(t);
end

end

end

