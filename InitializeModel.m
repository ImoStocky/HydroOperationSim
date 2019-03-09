    %% Initialize model
% Number of simulation rounds
% ROUGHLY: 10 = testing; 100 = preliminary; 1000 = results 
rounds = 1000;

% Timeframe = 1 year
t = [0:365-1]';

% Set default Maintenance schedules
% PLANT 1: two weeks in the summer
maint1 = [t [zeros(180, 1); ones(14, 1); zeros(365-(180+14), 1)]];

% PLANT 2: two weeks in the fall
maint2 = [t [zeros(270, 1); ones(14, 1); zeros(365-(270+14), 1)]];

%% Random simulation objects
% Create 1000 rainfall realizations
rng(0) %Reset random number generator
sim_rain = zeros(365,rounds);
for x=1:rounds
    [params, rain] = DailyRain(.155, 3, 365);
    sim_rain(:,x) = rain(:,2);
end

% Create 1000 price realizations
sde_price = gbm(0, .20, 'StartState', 40);
rng(0);
sim_price = squeeze(sde_price.simBySolution(365-1, 'DeltaTime', 1/365,...
    'nTrials', rounds));

% Assign first random draws to model variable
rain = [t sim_rain(:,1)];
price = [t sim_price(:,1)];

clear params x


