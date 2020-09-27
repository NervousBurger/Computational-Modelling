%% first question in part 2b 
% Xinyu Ma
% 28652703
% numerical
e=0.1; % chance of mistake
% transition matrix (already calculated)
RP5=[6-5*e,e,e,e,e,e;
    e,6-5*e,e,e,e,e;
    1-e,1-e,2+3*e,1-e,e,1-e;
    e,e,e,6-5*e,e,e;
    1-e,1-e,e,1-e,2+3*e,1-e;
    e,e,e,e,e,6-5*e]/6;
[V,D]=eigs(RP5'); % calculate the eigenvalues of the transition matrix (need to be calculated after transposition)
% V: eigenvector
% D: eigenvalues
np=[V(:,1)/sum(V(:,1))]'  % output the eigenvector corresponding to eigenvalue 1, and find the probability distribution according to this vector

% simulations
n=4; % scale
white=1:2; % number of agents in category 0
in=randperm(n); % initial state
m=10000; % simulation times
T=100;  % transfer time (counts) per simulation
last=zeros(m,length(in)); % record the final transfer result (T times)
S=zeros(1,6); % record the number of occurrences of each state in m simulations, used to calculate the frequency
for i=1:m
    % start simulating
    [last(i,:),~,~] = Simplified_Schelling2(n,white,in,e,T);
    
   
    % after each simulation outputs the final state, the number of occurrences of the state is +1
    if isequal(last(i,:),[1 2 3 4])
        S(1)=S(1)+1;
    end
    if isequal(last(i,:),[1 2 4 3])
        S(2)=S(2)+1;
    end
    if isequal(last(i,:),[1 3 2 4])
        S(3)=S(3)+1;
    end
    if isequal(last(i,:),[1 3 4 2])
        S(4)=S(4)+1;
    end
    if isequal(last(i,:),[1 4 2 3])
        S(5)=S(5)+1;
    end
    if isequal(last(i,:),[1 4 3 2])
        S(6)=S(6)+1;
    end
    
end
mp=S/sum(S) % find the frequency according to the number of occurrences (frequency) of each state

%% second question in part 2b 
e=0;
% record all states in an array
liner_states=[0,0,1,1;0,1,0,1;0,1,1,0;1,0,0,1;1,0,1,0;1,1,0,0];
% numerical
RP5_2=[6-4*e,e,e,e,e,0;
    1-e,2+4*e,1-e,1-e,0,1-e;
    1-e,e,4,0,e,1-e;
    1-e,e,0,4,e,1-e;
    1-e,0,1-e,1-e,2+4*e,1-e;
    0,e,e,e,e,6-4*e]/6;
[V2,D2]=eigs(RP5_2');
np2=[V2(:,1)/sum(V2(:,1))]'

% simulations
n=4;
in=liner_states(randi(6),:); % the initial state is randomly selected from the state array liner_states
T=100;
m=10000;
last=zeros(m,length(in));
S=zeros(1,6);
for i=1:m
    % start simulating
    [last(i,:),~,~] = Simplified_Schelling2L(n,in,e,T);
    
    
    
    for j=1:6
        if isequal(liner_states(j,:),last(i,:))
            S(j)=S(j)+1;
        end
    end
    
end
mp2=S/sum(S)