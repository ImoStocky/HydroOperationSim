model = Simulink.SimulationInput('HydroPowerSheet')
t = rain(:,1)
res = zeros(2, rounds);
for n=1:rounds
    disp(n)
    model = model.setVariable('rain',[t sim_rain(:,n)]);
    model = model.setVariable('price',[t sim_price(:,n)]);
    % Run simulink model and get last value
    test = sim(model);
    % Save output data
    res(1,n) = sum(test.yout{1}.Values.Data); %Flooded (minimize)
    res(2,n) = sum(test.yout{2}.Values.Data); %Revenue (maximize)
end
res = res'