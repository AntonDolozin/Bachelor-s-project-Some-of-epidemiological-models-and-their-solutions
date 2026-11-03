
%Trying out one of the methods I found for solving systems of differential
%equations
%Functions for infected persons I(t) and susceptible ones S(t) are combined
%in one vector A.
% A(1) is S(t) while A(2) is I(t)
%b is beta, gamma is gamma
b = 0.1
gamma = 0.4
dAdt = @(t, A) [-b*A(2)*A(1) + gamma*A(2); b*A(1)*A(2) - gamma*A(2)]
[t, A] = ode45(dAdt, [2, 3], [25; 6])