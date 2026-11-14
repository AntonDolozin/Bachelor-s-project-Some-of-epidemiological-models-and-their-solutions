

%Demo for academic advisor;
%The defined structure will be used later in parser file (if possible)

clc; 
clear;
close all;



%Trying out one of the methods I found for solving systems of differential
%equations
%Functions for infected persons I(t) and susceptible ones S(t) are combined
%in one vector A.
% A(1) is S(t) while A(2) is I(t)
%b is beta, gamma is gamma
  


%initial conditions 
results_table = table();
time_span = input('Enter a timespan (two values): \n', 's');
b = input('Enter beta parameter for system of differential equations: (Nonzero, within [0,1] interval) \n', 's');
g = input('Enter gamma parameter for system of differential equations: (Nonzero, within [0,1] interval) \n', 's');
I0 = input('Enter initial condition for function of infected I(t) (between 0 and 1): \n', 's');

%Remaining code from previous commits;
%dAdt = @(t, A, b, gamma) [-b*A(2)*A(1) + gamma*A(2); b*A(1)*A(2) - gamma*A(2)]
%[t, A] = ode45(dAdt, [2, 3], [25; 6]);
%------------------------------------
time = zeros(2, 1);
tmp = sscanf(time_span, '%f,%f');

time(1) = tmp(1);
time(2) = tmp(2);
tmp_I0  = sscanf(I0, '%f');
S0 = 1- tmp_I0;
y0= zeros(2, 1);
y0(1) = S0;
y0(2) = tmp_I0;
b_converted = sscanf(b, '%f');
g_converted = sscanf(g, '%f');

%Validating values from user
assert((0<b_converted)&&(b_converted<1), 'Beta must be between 0 and 1.');
assert((0<g_converted) &&(g_converted)<1, 'Gamma must be between 0 and 1.');
assert((0<y0(1)) &&(y0(1)<1), 'Initial condition must be between 0 and 1.');
assert(time(1)<time(2), 'Lower boundary of time span should be lesser than upper boundary.')

% Gamma divided by beta. An endemic equilibrium exists if it is lesser than
% one
endemic_ratio = g_converted/b_converted;

%Usually, ode45 is using for solving the systems of differential equations
[t, y] = ode45(@(t, A, beta, gamma)odefun(t, A, b_converted, g_converted), time, y0);



%Extracting the values of each function
S = y(:, 1);
I = y(:, 2);


%equilib_t = find(S==I, 1)
%equilib_exists = isempty(equilib_t)
%if equilib_exists == 0
 %equilib_val = interp1(t, S, equilib_t);
%end



%Adding respective columns with results to table
results_table= addvars(results_table, t);
results_table= addvars(results_table, S);
results_table = addvars(results_table, I);

%Variables for legend
leg = {'S(t)', 'I(t)'};
number_of_columns = numel(leg);

%Opening figure for plots 
main_figure =figure;
picture_width = 20;
height_ratio =0.65;

set(main_figure,'Units','centimeters','Position',[3 3 picture_width height_ratio*picture_width]);
pos = get(main_figure,'Position');
set(findall(main_figure, '-property', 'Interpreter'), 'Interpreter', 'latex');
set(findall(main_figure, '-property', 'TickLabelInterpreter'), 'TickLabelInterpreter', 'latex');
set(findall(main_figure, '-property', 'Box'), 'Box', 'off');
set(main_figure,'PaperPositionMode','Auto','PaperUnits','centimeters','PaperSize',[pos(3), pos(4)]);
hold on;
sPlot =plot(t, S);
iPlot = plot(t, I);
%Setting up the plot for S(t)
sPlot.LineStyle = "-";
sPlot.LineWidth =2;
SColorCode = [100, 136, 234]./255;
sPlot.Color =SColorCode;

%Setting up the plot for I(t)
iPlot.LineStyle = '--';
iplot.LineWidth =3;
IColorCode = [0.9804, 0.7843, 0.5961];
iPlot.Color=IColorCode;

%if endemic_ratio <1
   % endemic_I = 1 -endemic_ratio;
   % endemic_I_point = find(I==endemic_I,1,"first");
   % endemic_t = t(endemic_I_point);
  %  endemicEqPlot = plot(endemic_t, endemic_I_point);
  %  set(endemicEqPlot, 'Marker', 'o');
  %  endemicEqPlot.MarkerEdgeColor = [0.85 0.47 0.32];

%end

    
    
%end



title("SIS model", Interpreter='latex');

%if equilib_exists == 0
 %equilibPlot = plot(equilib_t, equilib_val);
 %set(equilibPlot, 'Marker', 'o')
 %equilibPlot.MarkerSize=10;
 %equilibPlot.MarkerEdgeColor = [0.85 0.47 0.32];
 %equilibPlot.MarkerFaceColor = [0.1 0.25 0.89];
%end
xlabel('time $t$ (months)', Interpreter='latex')
legend(leg, 'Orientation','horizontal', 'Location', 'southwestoutside', NumColumns=number_of_columns, Interpreter='latex')




hold off;


function dSdt = odefun(t, A, beta, gamma)
 dSdt = zeros(2, 1);
 dSdt(1) = (-beta*A(1)*A(2)) + gamma*A(2);
 dSdt(2) = (beta*A(1)*A(2)) - gamma*A(2);
end








