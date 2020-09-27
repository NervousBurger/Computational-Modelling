% Xinyu Ma
% 28652703
% chain model, adding the simulation function of the probability of "error exchange"
function [last,status,unhappy] = Simplified_Schelling2L(n,in,e,T)
% compared to the Simplified_Schelling2 function, the modified part is as follows:
% 1. the input white is deleted, because the status itself marks the position of category 0
% 2. modify the function to calculate the number of unhappy people to calculate2L
% 3. removed the part that raised number 1 to the first place (because the input itself has no number)


unhappy=zeros(T+1,1);
unhappy(1)=calculate2L(in,n); 
status=[in;zeros(T,n)];

for t=1:T
    status(t+1,:)=status(t,:);
    trading_places=randperm(n,2);
    
    status(t+1,[trading_places(1) trading_places(2)])=...
        status(t+1,[trading_places(2) trading_places(1)]);
    unhappy(t+1)=calculate2L(status(t+1,:),n);
    
    r=rand;
    if or(and(unhappy(t+1)>=unhappy(t),r>=e),...
            and(unhappy(t+1)<unhappy(t),r<e))
        status(t+1,:)=status(t,:);
        unhappy(t+1)=unhappy(t);
    end
    
end
last=status(T+1,:);
end

