% Xinyu Ma
% 28652703
% function of calculating the number of unhappy people in the ring model
function unhappy = calculate(status,n,white)
% when calculating the number of unhappy people, we only need to pay attention to the category of agent, not the specific number
% therefore, use the category array ss to record the category corresponding to the input state
% if the input state is [1,4,2,3], and the agent number of category 0 is [1,2], then the corresponding category array ss=[0,1,0,1]
ss=ones(1,n); % predefined category array (initial all 1)

for i=1:length(white)
w=find(status==white(i));  % find the corresponding position w of category 0 in the status array
ss(w)=0;  
end  % after the loop is over, the status of all agents with category 0 is marked as 0, and the rest are marked as 1.

unhappy=0; 
% since the array is circular, the first and last digits need to be evaluated separately
if and(ss(1)~=ss(n),ss(1)~=ss(2)) % if the state of the first digit and the last digit are different, and the state of the 2nd digit is different
    unhappy=unhappy+1;            
end
for i=2:n-1 
    if and(ss(i)~=ss(i+1),ss(i)~=ss(i-1)) % if the middle position and the adjacent position are different
    unhappy=unhappy+1;                   
    end
end
if and(ss(1)~=ss(n),ss(n)~=ss(n-1)) % if the state of the last digit is different from the first digit, and it is different from the state of the penultimate digit
    unhappy=unhappy+1;           
end
end