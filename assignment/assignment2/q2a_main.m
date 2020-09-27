% Xinyu Ma
% 28652703
% code for part 2a
m=20000;  % time of simulation 
AT=zeros(m,10);  % array of records for the convergence time of each simulation
for n=4:10
    
    for i=1:m  % for each scale n in each of 4~10, m simulations are required        
        white=1:n/2; % the agent number of category 0. For example, when n=4, agent 1 and 2 are category 0
        in=randperm(n); % randomly generate an initial state, such as "1324"
        
        % if the initial state generated is already an absorbing state (ie, the number of unhappy people = 0),then regenerate; until the non-initial state is generated
        while calculate(in,n,white)==0
            in=randperm(n);
        end
        
        T=n*10; % maximum time per simulation (maximum number of transfers)
        [~,unhappy] = Simplified_Schelling(n,white,in,T); % use own function to start the simulation and output an array of changes in the number of unhappy people
        % find convergence time based on unhappy change array
        a=find(unhappy==0,1);
        if ~isempty(a) % if the maximum simulation time is reached and there is still no convergence, the convergence time is taken as T
            AT(i,n)=a-1; % record convergence time, need to subtract 1
        else
            AT(i,n)=T;
        end
    end
    
end
plot(4:10,mean(AT(:,4:10))) % plot the results of 20,000 simulations