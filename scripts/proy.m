% tRange = [0 35];
% c = 0;
% tem1 = 53;
% [tSol2,ySol2] = ode45(@reactor3,tRange,tem1);
% 
% figure
% plot(tSol2,ySol2,"b")
% title("Energy Balance in an Insulated Stirred Tank")
% legend("Temperature")
% ylabel("Temperature (C)")
% xlabel("Time (h)")

t = [0:5];
Q = 444385529.681 - 815490.073*exp(-t/0.0013);

figure 
plot(t,Q,"b")
title("Energy Balance in an Insulated Stirred Tank")
legend("Temperature")
ylabel("Temperature (C)")
xlabel("Time (h)")


t1 = [0:60];
T = (415622590.531 - (815490.073*exp(-t1/0.0013)))/((-8154.9*exp(-t1/0.0013)) + 8156225.9);

figure 
plot(t1,T,"b")
title("Energy Balance in an Insulated Stirred Tank")
legend("Temperature")
ylabel("Temperature (C)")
xlabel("Time (h)")




% function dtemdt = reactor3(t,tem)
%     dtemdt = 15.435 - 0.0444*exp(-t/0.0013) + 0.0019556*tem;
% end