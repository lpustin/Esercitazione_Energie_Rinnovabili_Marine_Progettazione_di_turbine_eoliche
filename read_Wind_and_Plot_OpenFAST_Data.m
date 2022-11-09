clear;clc;close all;

%Three available load cases
% LC3  ---> 8 m/s realistic wind speed
% LC6  ---> 12 m/s realistic wind speed
% LC10 ---> 18 m/s realistic wind speed


%load openfast simulation data (dt=0.0125)
RUN=load('Load_Cases/LC10.mat');
%load effective wind speed data (dt=0.10)
wind=load('Load_Cases/LC10Wind.mat');


%% display openfast output unit
RUN.GenPwr.unit


%% plot some important openfast output

t=RUN.Time.data; %[s] openfast time

figure
plot(t,RUN.BldPitch0.data)
ylabel('Collective blade pitch [deg]'); xlabel('Time [s]')

figure
plot(t,RUN.GenTq.data)
ylabel('Generator torque [kNm]'); xlabel('Time [s]')

figure
plot(t,RUN.RotSpeed.data)
ylabel('Rotor Speed [rpm]'); xlabel('Time [s]')

figure
plot(t,RUN.GenPwr.data)
ylabel('Generator Power [MW]'); xlabel('Time [s]')

figure
plot(t,RUN.RtAeroPwr.data)
ylabel('Aerodynamic Power [MW]'); xlabel('Time [s]')

figure
plot(t,RUN.RtAeroFxh.data)
ylabel('Aerodynamic Thrust [N]'); xlabel('Time [s]')


% interpolation of the effective wind speed on the openfast time grid
V_wind_effective=pchip(wind.WF_mean_tms.Time, wind.WF_mean_tms.Data(:), t);  %[m/s] effective wind speed

%plot of the effective wind speed and the nacelle wind speed
figure
hold on
plot(t,RUN.Wind1VelX.data,'DisplayName','Nacelle wind')
plot(t,V_wind_effective,'LineWidth',1.5,'DisplayName','Effective wind')
legend
ylabel('Wind speed [m/s]'); xlabel('Time [s]')

