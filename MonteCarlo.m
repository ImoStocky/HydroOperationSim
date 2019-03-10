model(1) = Simulink.SimulationInput(mod_name);
model(1) = model(1).setVariable('maint1',maint1);
model(1) = model(1).setVariable('maint2',maint2);

if strcmp(mod_name,'HydroPowerControl')
    model(1) = model(1).setVariable('th',th);
end
% if strcmp(mod_name,'HydroPowerControlDevel')
%     model(1) = model(1).setVariable('th',th);
% end

t = rain(:,1);
res = zeros(2, rounds);
for n=1:rounds
    %disp(n);
    model(n) = model(1).setVariable('rain',[t sim_rain(:,n)]);
    model(n) = model(n).setVariable('price',[t sim_price(:,n)]);
    % Run simulink model and get last value
    %test(n) = sim(model(n),'ShowSimulationManager','off');
    % Save output data
    %res(1,n) = sum(test.yout{1}.Values.Data); %Flooded (minimize)
    %res(2,n) = sum(test.yout{2}.Values.Data); %Revenue (maximize)
end
test = parsim(model(1:rounds),'ShowSimulationManager','off', 'ShowProgress','on');

%Create aggregated maintenance plan fo high level overview
maint_plan=zeros(size(t,1)+1,1);

for n=1:rounds
    res(1,n) = sum(test(n).yout{1}.Values.Data); %Flooded (minimize)
    res(2,n) = sum(test(n).yout{2}.Values.Data); %Revenue (maximize)
    if strcmp(mod_name,'HydroPowerControl')
        maint_plan = (maint_plan+test(n).yout{3}.Values.Data); %Maintenance plan (maximize)
    end
end

res = res';
