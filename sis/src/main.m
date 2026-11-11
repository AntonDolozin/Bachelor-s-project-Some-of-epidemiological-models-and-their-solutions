%Demo for academic advisor;
%The defined structure will be used later in parser file (if possible)




%Trying out one of the methods I found for solving systems of differential
%equations
%Functions for infected persons I(t) and susceptible ones S(t) are combined
%in one vector A.
% A(1) is S(t) while A(2) is I(t)
%b is beta, gamma is gamma
  


%initial conditions 
time_span = input('Enter a timespan (two values): \n', 's');
b = input('Enter beta parameter for system of differential equations: \n', 's');
g = input('Enter gamma parameter for system of differential equations: \n', 's');
y0 = input('Enter initial conditions (two values): \n', 's');

%Remaining code from previous commits;
%dAdt = @(t, A, b, gamma) [-b*A(2)*A(1) + gamma*A(2); b*A(1)*A(2) - gamma*A(2)]
%[t, A] = ode45(dAdt, [2, 3], [25; 6]);
%------------------------------------
time = zeros(2, 1)
tmp = sscanf(time_span, '%f,%f');
time(1) = tmp(1);
time(2) = tmp(2);
tmp_initial_conditions  = sscanf(y0, '%f,%f')
y0_converted = zeros(2, 1)
y0_converted(1) = tmp_initial_conditions(1)
y0_converted(2) = tmp_initial_conditions(2)
b_converted = sscanf(b, '%f')
g_converted = sscanf(g, '%f')


%Usually, ode45 is using for solving the systems of differential equations
dSdt = odefun(t, A, b_converted, g_converted)
[t, S] = ode45(dSdt, time, y0_converted)
print([t, res])
%Opening figure for plots
figure;


function dSdt = odefun(t, A, beta, gamma)
 dSdt = zeros(2, 1)
 dSdt(1) = -beta*A(1) *A(2) + gamma*A(2)
 dSdt(2) = beta*A(1)*A(2) - gamma*A(2)
end








