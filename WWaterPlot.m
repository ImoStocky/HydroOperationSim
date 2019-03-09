histogram(res(:,1),'BinEdges',50:50:1300);
set(gcf,'color','w');
xlabel('Water through floodgates, Mm^3');
ylabel('Observations, n');
ylim([0 200])
disp('Mean Value'); disp(mean(res(:,1)))
disp('10%'); disp(quantile(res(:,1),.1))
disp('90%'); disp(quantile(res(:,1),.9))