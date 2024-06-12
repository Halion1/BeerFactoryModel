 tRange = [0 1];
% c = 0;
% [tSol,ySol] = ode45(@reactor1,tRange,c);
% 
% plot(tSol,ySol,"k",LineWidth=1)
% title("Mass Balance in a Perfectly Stirred Tank")
% ylabel("Concentration (kg/m^3)")
% xlabel("Time (h)")
% 
% 
% function dcdt = reactor1(t,c)
%     dcdt = (1950.317-(1500*c))/1.95;
% end



% tem1 = 53;
% [tSol2,ySol2] = ode45(@reactor3,tRange,tem1);
% 
% figure
% plot(tSol2,ySol2,"b")
% title("Energy Balance in an Insulated Stirred Tank")
% legend("Temperature")
% ylabel("Temperature (C)")
% xlabel("Time (h)")
% 
% 
% function dtemdt = reactor3(t,tem)
%     dtemdt = 68.622 - 0.68622*tem;
% end

tem1 = 100;
[tSol2,ySol2] = ode45(@reactor3,tRange,tem1);

figure
plot(tSol2,ySol2,"b")
title("Energy Balance in an Insulated Stirred Tank")
legend("Temperature")
ylabel("Temperature (C)")
xlabel("Time (h)")


function dtemdt = reactor3(t,tem)
    dtemdt = -114.4 - 7.727*tem;
end