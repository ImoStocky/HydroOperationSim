InitializeModel()

mod_name = 'HydroPowerSheet';
MonteCarlo()
disp('Results of static plan')
figure;
hold on;
ExamplePlot()
res_static = res;

%rounds=100;

res_th={};
ths=0:2:6;
for val=1:length(ths)
    th=ths(val);
    mod_name = 'HydroPowerControl';
    MonteCarlo()
    disp('Results of dynamic plan')
    %for val=1:length(ths)
    %    hold on;
    %   res=res_th{val};
    ExamplePlot()
    res_th{val}=res;
end

%%
close all;
%Classify simulation scenarios just for experiment
by_rain = mean(sim_rain,1); %figure; histogram(by_rain);
by_price = mean(sim_price,1); %figure; histogram(by_price);

t_rain=quantile(by_rain,[0.2,0.7]);
t_price=quantile(by_price,[0.2,0.7]);

%set bits ?
c1 = int8(by_rain > t_rain(1)) + int8(by_rain > t_rain(2)); %0,1,2
c2 = int8(by_price > t_price(1))*3 + int8(by_price > t_price(2))*3; 
sc = c1+c2+1;

color=[0 .8 1; 0 .6 1; 0 .4 1; 1 .8 .4; 1 .6 .4; 1 .4 .4; 0 1 0;0 .7 0.2; 0 0.4 .4];
legend={'low rain, low price', 'med rain, low price','high rain, low price',...
    'low rain, med price', 'med rain, med price','high rain, med price',...
    'low rain, hi price', 'med rain, hi price','high rain, hi price'};

sm=simdec(res(:,2),sc,color,legend,['\Sigma Revenue']);
sm=simdec(res(:,1),sc,color,legend,['Wasted']);

%ylim([0 10]);
