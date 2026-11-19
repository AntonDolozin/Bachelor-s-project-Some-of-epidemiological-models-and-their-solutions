#Changelog

All notable changes to this project will be documented here.


##[2026-1] -2026-11-01

###Added

-sis/main.m
 -empty driver file for SIS model.
-/lit/differential_eq


##[2026-2] - 2026-11-10

#Added

-sir/main.m
 -empty driver for SIR model demos

-parser.m
 -Empty for now file for future parser of systems of DEs

#Changed 

-sis/main.m
 -Defined odefunction, which represents the system of differential equations. Changed demo script so that constants (beta, gamma, time interval, initial conditions) are set by user.

##[2026-3] - 2026-11-11
#Added
-doc/sk
-doc/eng
 -directories for documentation in Slovak and in English respectively.

#Changed
-sis/main.m
 -Fixed a bug with getting y0 (vector of initial conditions) and t0 (time span, on which the solution should be found).

##[2026-4] - 2026-11-13
#Changed
-sis/main.m
 -Fixed bugged function handle for system of DEs.
 -Added basic plots.
 -Created a table with results 

##[2026-5] - 2026-11-14
#Changed
-sis/main.m
 -Fixed bugged value calculation for I(t) and S(t) 
 -Changed the vector of initial conditions y0. Now the script requests only I(0) from user, as S(0) can be calculated as 1 - I(0).
 -Added validators and constraints for constants gamma and beta.
 -Improved plots (added legend, title, xlabel, changed text interpreter to LaTeX).

#Added
-data/covid/load_data.m
 -A script for loading a table of Covid-19 data (not functional as of now).
-data/hiv/load_data.m
 -A script for loading a table of HIV data (not functional as of now).
-report/matlab/systems_des.tex
 -A report on methods of solving the systems of DEs in MATLAB.

##[2026-6] - 2026-11-14
#Changed
-sis/main.m
 -Added graphs for derivatives of I(t) and S(t), marked the endemic equilibrium.

##[2026-7] - 2026-11-14/15
#Changed
-report/matlab/systems_des.tex
 -Written a report purely on MATLAB. Wanted to add a theoretical background at least on Euler's method, it seems to be beyond the scope of the work however.


##[2026-8] - 2026-11-19
#Fixed
-sis/src/main.m
 -Typo in variable name (`iplot` -> `iPlot`): line width of I(t) is now applied.
 -Input prompts now say "strictly between 0 and 1", matching the asserts. Added checks after sscanf for beta, gamma and I(0), so non-numeric input gives an assert message instead of a crash. Fixed misplaced parenthesis in the gamma assert.
 -Time span input accepts "0,10", "0 10", "0, 10" and "[0 10]". Wrong format gives a clear error message instead of an index-out-of-bounds error.

#Added
-sis/src/main.m
 -Horizontal line at the theoretical endemic equilibrium I* = 1 - gamma/beta (the existing marker at the last point was left as it was).

