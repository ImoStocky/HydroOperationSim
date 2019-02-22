%Create n realizations of daily rains by drawing a generic gp-distribution 
%with given k and sigma -parameters. 
%
%PARAMETERS: 
%'k' = tailing of distribution (i.e. number of extreme events)
%'sigma' = variability of distribution (i.e. range of values)
%EXAMPLE USE (31days): [params, rain] = DailyRain(0.155,3,31)
%
%ADDITIONAL INFO: 'gprnd'-parameter 'theta' is set to zero: modify if 
%                  needed (or create an additional parameter)!
%

function [params, y] = gp_range_d(k_range,sigma_range,n)
y = [];
params = [];
for k = 1:length(k_range)
    for i = 1:length(sigma_range)
        a = gprnd(k_range(k),sigma_range(i),0,n,1);
        y = [y, a];
        params = [params; [k, sigma_range(i)]];
    end
y = [[0:n-1]' y];
end