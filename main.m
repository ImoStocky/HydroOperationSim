InitializeModel()
MonteCarlo()

%Classify simulation scenarios just for experiment
by_rain = mean(sim_rain,1); histogram(by_rain);
by_price = mean(sim_rain,1); histogram(by_price);

t_rain=quantile(by_rain,[0.2,0.8]);
t_price=quantile(by_price,[0.2,0.8]);

%set bits ?
c1 = by_rain < t_rain(1) + (by_rain < t_rain(2)); %0,1,2
c2 = (by_price < t_price(1))*3 + (by_price < t_price(2))*3; 
sc = c1+c2+1;



color=[0 .8 1; 0 .6 1; 0 .4 1; 1 .8 .4; 1 .6 .4; 1 .4 .4; 1 .2 .4; 1 .2 .2; 1 .1 .0];
legend={'low rain, low price', 'med rain, low price','high rain, low price',...
    'low rain, med price', 'med rain, med price','high rain, med price',...
    'low rain, hi price', 'med rain, hi price','high rain, hi price'};

sm=simdec(res(:,2),sc,color,legend,['Revenue?']);
ylim([0 5]);

ExamplePlot()
