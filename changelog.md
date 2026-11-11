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

