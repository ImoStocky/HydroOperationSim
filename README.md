# Hydroelectric power plant in Imatrankoski

(Source: https://www.energiauutiset.fi/tuotanto/lisarahoitusta-oulujoelle.html)

This project is part of Model and system dynamics course at LUT univeristy in Finland

## Case & Task description

Your task is to optimize yearly maintenance schedule of two hydroelectric power plants located
subsequently in a same river. The overall objective is to maximize yearly revenue.
Model (built in Matlab 2017b)

* Run InitializeModel.m, which will create you 1000 random realizations of variables
The maintenance schedule by default is planned as follows:
- Plant 1: two weeks in the summer; can be started anywhere between Mar-Jun = day
numbers 60x152 (block: "maint1")
- Plant 2: two weeks in the fall; can be started anywhere between Aug-Nov = day numbers
213x305 ("maint2")
- In both cases, the two week stoppage can be divided into two one week stoppages (if
needed)

### Function block diagram of the model "HydroPowerSheet.slx".
A function block diagram of the case is illustrated in Figure 2:

- Plant 1 and 2 have distinct catchment areas for daily rainfall
- The output water of Plant 1 is fed to the storage pond of Plant 2
- The conversion of water output to MWh is more efficient in Plant 1 (efficiency ratio = 0.1)
compared to Plant 2 (eff = 0.075)

### Key uncertainties:
- Amount of daily rainfall (drawn from a generalized Pareto distribution, "rain")
- Price of electricity (geometric Brownian Motion, "price")
Default plan
The simulated cash flow outcome with default maintenance plan.

| Mean |
| --- |
| (50%) = 17.33 |
| 10% = 14.96 |
| 90% = 19.91 |


###### Tips & Tricks
- To speed up random simulation in Matlab, close the Simulink-window (function block
diagram). For some reason this increases the speed of simulation by tens of percent in any model.

Meanwhile learn about
------
+ Building System Dynamic models
+ Running Monte Carlo simulations
+ Implementing flexibilities (this lecture & assignment 4)
+ Data analysis and visualization
+ State-of-the-Art in economic modeling with System Dynamics