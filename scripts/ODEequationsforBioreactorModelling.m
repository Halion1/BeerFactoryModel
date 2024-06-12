%% Certificates:
%% 
% * <https://matlabacademy.mathworks.com/details/odes Solving Ordinary Differential 
% Equations with MATLAB>:
%% 
% https://matlabacademy.mathworks.com/progress/share/certificate.html?id=f18e765a-ec01-4ffb-85eb-d9bf47276f0b&
%% 
% * <https://matlabacademy.mathworks.com/details/gettingstarted MATLAB Onramp>:
%% 
% https://matlabacademy.mathworks.com/progress/share/certificate.html?id=64ad55cf-8768-45aa-ab1b-6bc48a9687be&
%% Mass Balance in a Perfectly Stirred Tank

tRange = [0 35];
c = 0;
[tSol,ySol] = ode45(@reactor1,tRange,c);

plot(tSol,ySol,"k",LineWidth=1)
title("Mass Balance in a Perfectly Stirred Tank")
ylabel("Concentration (kg/m^3)")
xlabel("Time (h)")
%% Mass and Volume Balance in a Perfectly Stirred Tank

tem1 = [0;10];
[tSol1,ySol1] = ode45(@reactor2,tRange,tem1);
concentration = ySol1(:,1);
volume = ySol1(:,2);

figure
yyaxis left
plot(tSol1,concentration,"k"); xlim(tRange);
hold on

yyaxis right
plot(tSol1,volume,"r --");
ylabel("Volume (m3)");
hold off

legend("Concentration","Volume")
title("Mass and Volume Balance in a Perfectly Stirred Tank")
ylabel("Concentration (kg/m^3)")
xlabel("Time (h)")
%% Energy Balance in an Insulated Stirred Tank

tem1 = 20;
[tSol2,ySol3] = ode45(@reactor3,tRange,tem1);

figure
plot(tSol2,ySol3,"b")
title("Energy Balance in an Insulated Stirred Tank")
legend("Temperature")
ylabel("Temperature (C)")
xlabel("Time (h)")
%% Energy Balance Stirred Tank with convective exchange

tRange2 = [0 15];
tem2 = 20;

[tSol3,ySol3] = ode45(@reactor3,tRange2,tem2);

figure
plot(tSol3,ySol3,"b"); xlim([1 15]); ylim([12 51]);
hf = yline(50, "r");
Hf = yline(15, "g");
title("Energy Balance in an Insulated Stirred Tank")
legend("Temperature","Final Temperature", "Environment Temperature")
ylabel("Temperature (C)")
xlabel("Time (h)")
%% 
% Function 1

function dcdt = reactor1(t,c)
    dcdt = (0.04-(2*c))/10;
end
%% 
% Function 2

function dcdt = reactor2(t,c)
    con = c(1);
    vol = c(2);
    dvdt = 1;
    dcondt = (0.06- 3*con)/vol;
    dcdt = [dcondt;dvdt];
end
%% 
% Function 3

function dtemdt = reactor3(t,tem)
    dtemdt = 10 - 0.2*tem;
end
%% 
% Function 4

function dtemdt = reactor4(t,tem)
    den = 1.03 * 10^-6;
    spheat = 4.182;
    h = 3;
    d = 2.45;
    r = d / 2;
    Vol = (r^2 * pi) * h;
    heatt = 3.5 * 10^-3;
    dtemdt = (1/Vol) * (100-2*tem-((2*pi*h*r)*(tem-15)*heatt/spheat*den)) ;
end