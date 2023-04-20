%% ShoulderSeasonComp.m 
% Looks at Shoulder season (freeze up) for each year to determine when/why
% no NEE/Soil Resp in CLM Simulation
%
% V.R. Dutch - Feb 2022
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import Data
cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 2\GitRepo\TVC\MonteCarlo\ShoulderSeasonInvestigations\1500Spinup_CryoT'
Run0_1500CT_Daily = readtimetable('Baseline_Spinup1500CryoT_Daily.csv');
Run0_1500CT_Hourly = readtimetable('Baseline_Spinup1500CryoT_Hourly.csv');

%% Plots: 
% For each year: NEE & Temp, NEE & Moisture, Resp & Temp, Resp & Moisture
% Profile for soil properties rather than a specific height?

%% Timestamps
ECObs_Start = datetime(2016,05,12);
EndTimeseries = datetime(2019,12,31);
ECObs_days = ECObs_Start:EndTimeseries;

x = [ECObs_days(82),ECObs_days(174),ECObs_days(266),ECObs_days(355),ECObs_days(447),ECObs_days(539),ECObs_days(631),ECObs_days(720),ECObs_days(812),ECObs_days(904),ECObs_days(996),ECObs_days(1085),ECObs_days(1177),ECObs_days(1269)]; % Aug, Nov, Feb, May 
x_minor = [ECObs_days(21),ECObs_days(51),ECObs_days(82),ECObs_days(113),ECObs_days(143),ECObs_days(174),ECObs_days(204) ,... %2016
    ECObs_days(235),ECObs_days(266), ECObs_days(294),ECObs_days(325),ECObs_days(355),ECObs_days(386),ECObs_days(416),ECObs_days(447),ECObs_days(478),ECObs_days(508),ECObs_days(539),ECObs_days(569),... %2017
    ECObs_days(600),ECObs_days(631),ECObs_days(659),ECObs_days(690),ECObs_days(720),ECObs_days(751),ECObs_days(781),ECObs_days(812),ECObs_days(843),ECObs_days(873),ECObs_days(904),ECObs_days(934),... %2018
    ECObs_days(965),ECObs_days(996),ECObs_days(1024),ECObs_days(1055),ECObs_days(1085),ECObs_days(1116),ECObs_days(1146),ECObs_days(1177),ECObs_days(1208),ECObs_days(1238),ECObs_days(1269),ECObs_days(1299),EndTimeseries]; %2019

%% NEE & Temp
% 2016
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
% Temp Profile
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(113) ECObs_days(235)])
title('2016')

% 2017
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(478) ECObs_days(600)])
title('2017')

% 2018
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(843) ECObs_days(965)])
title('2018')

% 2019? - Beyond snow measurements but if it helps understand then why not?
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(1208) EndTimeseries])
title('2019')

%% NEE & Moisture
% 2016
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
yline(0, 'r --')
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(113) ECObs_days(235)])
title('2016')

% 2017
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
yline(0, 'r --')
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(478) ECObs_days(600)])
title('2017')

% 2018
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
yline(0, 'r --')
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(843) ECObs_days(965)])
title('2018')

% 2019? - Beyond snow measurements but if it helps understand then why not?
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.NEE_CLM_gC, 'k', 'LineWidth', 2)
yline(0, 'r --')
% NEE Obs?
ylabel('NEE [gC m s^{-1}]')
xlim([ECObs_days(1208) EndTimeseries])
title('2019')

% NEE doesn't go to zero but soil resp does ... why? Appears to be
% small amount of Ecosystem respriation when soil respriation is zero. 

%% Soil Resp & Temp
SoilResp_CLM = Run0_1500CT_Daily{:,116}; % whole column
SoilResp_CLM = SoilResp_CLM (1228:end);% length of ECObsDays
SR_2016 = SoilResp_CLM(113:235);
z_2016 = find(SR_2016==0,1);
h = z_2016 + 113;
z_2016 = ECObs_days(h) %first day of zero SR
% clear h 
SR_2017 = SoilResp_CLM(478:600);
z_2017 = find(SR_2017==0,1);
i = z_2017 + 478;
z_2017 = ECObs_days(i) %first day of zero SR
% clear i 
SR_2018 = SoilResp_CLM(843:965);
z_2018 = find(SR_2018==0,1);
j = z_2018 + 843;
z_2018 = ECObs_days(j) %first day of zero SR
% clear j 
SR_2019 = SoilResp_CLM(1208:end);
z_2019 = find(SR_2019==0,1);
k = z_2019 + 1208;
z_2019 = ECObs_days(k) %first day of zero SR
% clear k 

% 2016
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
xline(z_2016,'r--')
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(113) ECObs_days(235)])
title('2016')

% 2017
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
% xline(z_2017,'r--') % doesn't actually get to zero in 2017 ... stays at e^-19
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(478) ECObs_days(600)])
title('2017')

% 2018
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
xline(z_2018,'r--')
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(843) ECObs_days(965)])
title('2018')

% 2019? - Beyond snow measurements but if it helps understand then why not?
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_26cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_40cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_80cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_170cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilTemp_250cm_CLM, '-')
yline(0, 'b--')
yline(-10, 'b-.')
yline(-20, 'b:')
ylabel('Temp [℃]')
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
xline(z_2019,'r--')
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(1208) EndTimeseries])
title('2019')

%% Soil Resp & Moisture 
% 2016
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
xline(z_2016,'r--')
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(113) ECObs_days(235)])
title('2016')

% 2017
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
% xline(z_2017,'r--') % doesn't actually get to zero, stays at e^-19 ...
% what makes 2017 so different from other years
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(478) ECObs_days(600)])
title('2017')

% 2018
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
xline(z_2018,'r--')
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(843) ECObs_days(965)])
title('2018')

% 2019
figure()
yyaxis left
hold on
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_1cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_4cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_9cm_CLM,'-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_16cm_CLM, '-')
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.LiquidSoilMoisture_26cm_CLM, '-')
% more depths in Liq. H2O profile?
ylabel('Liquid Soil Moisture') % find units
hold off
yyaxis right
plot(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM, 'k', 'LineWidth', 2)
yline(0, 'r --')
% first date = 0 ... then plot as dashed x-line
xline(z_2019,'r--')
ylabel('Soil Respiration [gC m s^{-1}]') %triple check units
xlim([ECObs_days(1208) EndTimeseries])
title('2019')

%% Comp 2017 conditions to other years

% as 2017 doesn't go quite to zero, what is it's minimum value?
MinSoilR_2017 = min(SR_2017);
% when it it's minimum value?
m_2017 = find(SR_2017==MinSoilR_2017,1);
i = m_2017 + 478;
m_2017 = ECObs_days(i) %first day of min SR = 1st Jan 2018
clear i 
% last day of min?

% min soil temp for each year/layer?
SoilTemps_CLM = Run0_1500CT_Daily{:,52:72};
SoilTemps_CLM = SoilTemps_CLM((1228:end),:);% length of ECObsDays
SoilTemps_2016 = SoilTemps_CLM((113:235),:);
SoilTemps_2017 = SoilTemps_CLM((478:600),:);
SoilTemps_2018 = SoilTemps_CLM((843:965),:);
SoilTemps_2019 = SoilTemps_CLM((1208:end),:);
MinSoilTemps_2016 = min(SoilTemps_2016);
MinSoilTemps_2017 = min(SoilTemps_2017);
MinSoilTemps_2018 = min(SoilTemps_2018);
MinSoilTemps_2019 = min(SoilTemps_2019);
% Comp all years to 2017 ... dif?
Dif_MinSoilT_1617 = MinSoilTemps_2017 - MinSoilTemps_2016;
Dif_MinSoilT_1817 = MinSoilTemps_2017 - MinSoilTemps_2018; % almost all neg, so warmer than 2017 ... this is confusing
Dif_MinSoilT_1917 = MinSoilTemps_2017 - MinSoilTemps_2019;

% min soil moisture for each year/layer?
SoilH2O_CLM = Run0_1500CT_Daily{:,([74 77 80 83 86:101])};
SoilH2O_CLM = SoilH2O_CLM((1228:end),:);% length of ECObsDays
SoilH2O_2016 = SoilH2O_CLM((113:235),:);
SoilH2O_2017 = SoilH2O_CLM((478:600),:);
SoilH2O_2018 = SoilH2O_CLM((843:965),:);
SoilH2O_2019 = SoilH2O_CLM((1208:end),:);
MinSoilMoist_2016 = min(SoilH2O_2016);
MinSoilMoist_2017 = min(SoilH2O_2017);
MinSoilMoist_2018 = min(SoilH2O_2018);
MinSoilMoist_2019 = min(SoilH2O_2019);
% Comp all years to 2017 ... dif? 
% Expecting 2017 to be warmer/wetter, so 2017 - year.
Dif_MinSoilH2O_1617 = MinSoilMoist_2017 - MinSoilMoist_2016;
Dif_MinSoilH2O_1817 = MinSoilMoist_2017 - MinSoilMoist_2018; % mostly negative, so wetter than 2017 except soil layer 11. 
Dif_MinSoilH2O_1917 = MinSoilMoist_2017 - MinSoilMoist_2019;

% Or just conditions on day SR becomes zero?
SoilTemps_z2016 = SoilTemps_CLM(h,:);
SoilTemps_z2018 = SoilTemps_CLM(j,:);
SoilTemps_z2019 = SoilTemps_CLM(k,:);
SoilH2O_z2016 = SoilH2O_CLM(h,:);
SoilH2O_z2018 = SoilH2O_CLM(j,:);
SoilH2O_z2019 = SoilH2O_CLM(k,:);

%%
% would scatter plots explain relationship better?
figure()
hold on
scatter(SoilTemps_2016(:,3), SR_2016)
scatter(SoilTemps_2017(:,3), SR_2017)
scatter(SoilTemps_2018(:,3), SR_2018)
scatter(SoilTemps_2019(:,3), SR_2019)
xline(0, 'k--')
hold off
xlabel('Soil Temp [℃]')
ylabel('Soil Resp')
legend ({'2016', '2017', '2018', '2019'}, 'Location', 'NorthWest');
title('Soil Resp and 9cm Soil Temp')
legend boxoff
% repeat for additional heights?

figure()
hold on
scatter(SoilH2O_2016(:,3), SR_2016)
scatter(SoilH2O_2017(:,3), SR_2017)
scatter(SoilH2O_2018(:,3), SR_2018)
scatter(SoilH2O_2019(:,3), SR_2019)
hold off
xlabel('Soil Moisture')
ylabel('Soil Resp')
legend ({'2016', '2017', '2018', '2019'}, 'Location', 'NorthWest');
title('Soil Resp and 9cm Soil Liquid H2O')
legend boxoff

%combine in 3d scatter plot
figure()
hold on
scatter3(SoilTemps_2016(:,3),SoilH2O_2016(:,3), SR_2016)
scatter3(SoilTemps_2017(:,3),SoilH2O_2017(:,3), SR_2017)
scatter3(SoilTemps_2018(:,3),SoilH2O_2018(:,3), SR_2018)
scatter3(SoilTemps_2019(:,3),SoilH2O_2019(:,3), SR_2019)
hold off
xlabel('Soil Temp')
ylabel('Soil Moisture')
zlabel('Soil Resp')
legend ({'2016', '2017', '2018', '2019'})

% resp always non-zero above minus 5
% resp always zero below minus 20

