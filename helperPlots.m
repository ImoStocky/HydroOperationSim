%Plan outline
leg={};
for p=1:length(variable)
    p1=variable(p);
    X(p,:)=plan{p};
    leg{p}=sprintf('%s %.2f',type,p1);
end
bar(X','stacked')
title('Maintenance plan display')
legend(leg);


%Scenario context
figure
hold on;
leg={};
for p=1:length(variable)
    p1=variable(p);InitializeModel();histogram(mean(sim_price(),1));
    leg{p}=sprintf('Drift %.2f',p1);
end
legend(leg);
title('Mean \Sigma revenue histogram')
hold off;

%Histogram comparation
mean_def=[];
mean_ctl=[];
for val=1:length(variable)
    disp('Results of dynamic plan')
    figure
    hold on;
    disp('With threshold')
    disp(th)
    res=res_static{val};
    ExamplePlot()
    mean_def=[mean_def,mean(res(:,2))];
    res=res_th{val};
    ExamplePlot()
    mean_ctl=[mean_ctl,mean(res(:,2))];
    legend('Default','Controlled');
    title('\Sigma revenue MEur comparation')
 end
hold off;

%Analysis of mean revenue comparing to static plan
figure;
bar(variable,[(mean_ctl-mean_def)./mean_def]*100,'grouped');
legend('Percentage increase');
title('Analysis of mean revenue')



