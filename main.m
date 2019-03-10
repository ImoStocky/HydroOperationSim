clear all;

%DailyRain(.155*rain_par, 3+rain_int, 365);
%gbm(0+p1, .20+p2, 'StartState', 40);
ths=0:0.1:0.2;
price_inc=[-0.1:0.1:0.1];
price_vol=[0];
rain_par=[0.75,1,1.25];
rain_int=[-1,0,2];

p2=0;
res_static = {};
res_th={};
plan={};
th=0;

for i=1:length(price_inc)
    p1=price_inc(i);
    
    InitializeModel()
    %rounds=10;
    
    mod_name = 'HydroPowerSheet';
    MonteCarlo()
    
    res_static{i} = res;
    
    mod_name = 'HydroPowerControl';
    MonteCarlo()
    
    res_th{i} = res;
    plan{i} = maint_plan;
end

type='GBMDrift';
variable=price_inc;
save('Control_Drift','res_static','res_th','th','price_inc','price_vol','plan');
helperPlots()

price_vol=-0.1:0.1:0.1;
price_inc=[0];
p1=0;
for i=1:length(price_vol)
    p2=price_vol(i);
    
    InitializeModel()
    %rounds=10;
    
    mod_name = 'HydroPowerSheet';
    MonteCarlo()
    
    res_static{i} = res;
    
    mod_name = 'HydroPowerControl';
    MonteCarlo()
    
    res_th{i} = res;
    plan{i} = maint_plan;
end

type='GBMVolatillity';
variable=price_vol;
save('Control_Volatillity','res_static','res_th','th','price_inc','price_vol','plan');
helperPlots()

%last scenario decompostion default one 0 incl .3 volatillity
decomposeSim();
