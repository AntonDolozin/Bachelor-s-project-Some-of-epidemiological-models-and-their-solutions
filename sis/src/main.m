%Demo for academic advisor;
%The defined structure will be used later in parser file (if possible)




%Trying out one of the methods I found for solving systems of differential
%equations
%Functions for infected persons I(t) and susceptible ones S(t) are combined
%in one vector A.
% A(1) is S(t) while A(2) is I(t)
%b is beta, gamma is gamma
  


%initial conditions 
time_span = input('Enter a timespan (two values): ', 's')
b = input('Enter beta parameter for system of differential equations')
g = input('Enter')
y0 = input('Enter initial conditions (two values): ', '%s')

%Remainingt code from previous commits;
%Kept for the time being;
%dAdt = @(t, A, b, gamma) [-b*A(2)*A(1) + gamma*A(2); b*A(1)*A(2) - gamma*A(2)]
%[t, A] = ode45(dAdt, [2, 3], [25; 6]);
%------------------------------------
time_span = strrep(time_span, ',', ' ');
time = sscanf(time_span, '%f');
y0 = strrep(y0, ",", " ")
y0_converted = sscanf(y0, '%f')
b_converted = sscanf(b, '%f')
g_converted = sscanf(g, '%f')



%Usually, ode45 is using for solving the systems of differential equations
[t, res] = ode45(@(t, y) odefun(t, y, b_converted, g_converted), time, y0_converted)
print([t, res])
%Opening figure for plots
figure;


function dAdt = odefun(t, A, beta, gamma)
 dAdt(1) = -beta*A(1) *A(2) + gamma*A(2)
 dAdt(2) = beta*A(1)*A(2) - gamma*A(2)
end








