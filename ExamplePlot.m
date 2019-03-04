%CASH FLOW
histogram(res(:,2));
set(gcf,'color','w');
xlabel('Cash Flow, MEUR');
ylabel('Observations, n');
ylim([0 200])
disp('Mean Value'); disp(mean(res(:,2)))
disp('10%'); disp(quantile(res(:,2),.1))
disp('90%'); disp(quantile(res(:,2),.9))


