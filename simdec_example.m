% A simplified example for simulation decomposition
% Monte Carlo simulation
n=100000; % number of runs
var1=0+100*rand(n,1); % uncertain variable with uniform distribution [0 100]
var2=0+150*rand(n,1); % uncertain variable with uniform distribution [0 150]
result=var1+var2; % resulting variable

figure
histogram(result,100)

% assign resulta a group by scoring
sc=zeros(n,1);
sc=((var2<=50)+(var2>50&var2<=100)*2+(var2>100)*3)+(var1>50)*3;
% colors
color=[0 .8 1; 0 .6 1; 0 .4 1; 1 .8 .4; 1 .6 .4; 1 .4 .4];
% legend
legends={'low var1 & low var2','low var1 & medium var2','low var1 & high var2',....
    'high var1 & low var2','high var1 & medium var2','high var1 & high var2'};
% building the graph
sm = simdec(result,sc,color,legends, ['Xaxis title']);