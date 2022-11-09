clear;clc;close all;

amap=load('FAST_Steady_Simulations.mat');


R_bl=63; % [m] Blade radius: The distance from the rotor apex to the blade tip
rho=1.225; % [kg/m3] air density

n=1; %index for valid fast steady simulations
for i=1:numel(amap.om) %cicle on all the steady simulations
    if amap.AeroPower(i)>0 && amap.Ct(i)<1 %exclude steady simulations with negative power
        Vwind(n)=double(amap.V_wind(i)); %Effective Wind Speed [m/s]
        BldPitch0(n)=amap.BldPitch0(i); % Collective blade pitch [deg]
        om(n)=amap.om(i); % Rotor speed [rpm]
        AeroPower(n)=amap.AeroPower(i); % Aerodynamic Power [MW]
        AeroThrust(n)=amap.AeroThrust(i); % Aerodynamic Thrust [N]
        n=n+1;
    end
end