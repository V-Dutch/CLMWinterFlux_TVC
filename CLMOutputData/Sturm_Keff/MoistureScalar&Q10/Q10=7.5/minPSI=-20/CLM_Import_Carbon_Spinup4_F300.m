% New CLM Import Script - Takes data from NetCDF & Observations and creates
% an array for each model run
%
% V. R. Dutch - March 2021
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Import Obs
cd 'D:\PhD Work\Data\Trail Valley Creek\Raw Data\Met Data\UoM';
RawObs = readtimetable('TVC_CLASSIC_2013_2020.csv');
RawObs_Hourly = retime(RawObs,'hourly'); % make same hourly resolution
RawObs_Hourly = RawObs_Hourly(1:61344,:);

cd 'D:\PhD Work\Modelling\CLM\Data for PointCLM\MetData';
GapfilledObs = readmatrix('ForcingData.csv');
start_1719 = datetime(2017,01,01);
end_1719 = datetime(2020,01,01);
R = start_1719:hours:end_1719;
R = R(1:26280);
GapfilledObs = array2timetable(GapfilledObs,'RowTimes', R);
RawObs_Hourly = synchronize(RawObs_Hourly,GapfilledObs); % adds forcing data to other obs and makes the same length

cd 'D:\PhD Work\Data\Trail Valley Creek\Raw Data\Met Data\Laurier'
EchosounderData = readtimetable('SnowDepth_Echosounder.csv');
EchosounderData_Hourly = EchosounderData(1:2:end,:); % make same hourly resolution
RawObs_Hourly = synchronize(RawObs_Hourly,EchosounderData_Hourly); % adds echousounder data to other obs and makes the same length

cd 'D:\PhD Work\Data\Trail Valley Creek\Raw Data\Met Data\MSC Snow Station'
MSC_Snowdepth = readtimetable('MSC_Snowdepth.csv'); 
MSC_Snowdepth.SnowDepth = MSC_Snowdepth.SnowDepth/100; % convert to m to match other snow depths
RawObs_Hourly = synchronize(RawObs_Hourly,MSC_Snowdepth); % adds MSC data to other obs and makes the same length

%% Import CLM Output
cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 2\GitRepo\TVC\MonteCarlo\ShoulderSeasonInvestigations\Sturm_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-20' % folder for model run, needs changing every time
%% Import Snow Parameters
% Hourly Snow Parameters:
SnowDepth_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h0.2013-01-01-00000.nc','SNOWDP');
Snowfall_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h0.2013-01-01-00000.nc','SNOW');
SWE_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h0.2013-01-01-00000.nc','H2OSNO'); 
SnowCoverFraction_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h0.2013-01-01-00000.nc','FSNO');

% Remove midnight on 1st Jan
SnowDepth_CLM = SnowDepth_CLM(1:61344); 
Snowfall_CLM = Snowfall_CLM(1:61344);
SWE_CLM = SWE_CLM(1:61344);
SnowCoverFraction_CLM = SnowCoverFraction_CLM(1:61344);

% Rotate into columns
SnowDepth_CLM = rot90(SnowDepth_CLM,3);
Snowfall_CLM = rot90(Snowfall_CLM,3);
SWE_CLM = rot90(SWE_CLM,3);
SnowCoverFraction_CLM = rot90(SnowCoverFraction_CLM,3);

% Daily/Snow Layer Parameters:
SnowLayerPresence = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc', 'SNO_EXISTENCE'); 
% 1 = Layer Present, 0 = Layer absent, decimal = proportion of hourly timestep layer present for 
SnowLayerDensities = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_RHO'); %Only in runs 4 and onward
SnowLayerGrainRadii = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_GS'); %Only in runs 6 and onward
SnowThermalConductivities = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_TK');
SnowLayerThickness = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_Z');
SnowLayerTemps = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_T');
SnowLayerTemps = SnowLayerTemps - 273.15; % convert units
SnowIceContent = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_ICE'); % hoping this will help explain density/Keff relationship
SnowLiquidWater = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h4.2013-01-01-00000.nc','SNO_LIQH2O'); % hoping this will help explain density/Keff relationship

% Reshape - one row per snow layer
SnowLayerPresence = reshape(SnowLayerPresence,12,[]);
SnowLayers = sum(SnowLayerPresence); % number of snowpack layers per timestep
SnowLayerTemps = reshape(SnowLayerTemps,12,[]);
SnowThermalConductivities = reshape(SnowThermalConductivities,12,[]);
SnowLayerThickness = reshape(SnowLayerThickness,12,[]);
SnowLayerDensities = reshape(SnowLayerDensities,12,[]);
SnowLayerGrainRadii = reshape(SnowLayerGrainRadii,12,[]);
SnowIceContent = reshape(SnowIceContent,12,[]);
SnowLiquidWater = reshape(SnowLiquidWater,12,[]);

z = max(SnowLayers,[],'all'); % crop additional rows off of above to get rid of unnessacery NaNs
SnowLayerTemps(all(isnan(SnowLayerTemps),2),:) = []; %removes rows that are all NaN, remaining matrix should have z rows
SnowThermalConductivities(all(isnan(SnowThermalConductivities),2),:) = []; %as above
SnowLayerThickness(all(isnan(SnowLayerThickness),2),:) = []; %as above
SnowLayerDensities(all(isnan(SnowLayerDensities),2),:) = []; %as above
SnowLayerGrainRadii(all(isnan(SnowLayerGrainRadii),2),:) = []; %as above
SnowIceContent(all(isnan(SnowIceContent),2),:) = []; % as above
SnowLiquidWater(all(isnan(SnowLiquidWater),2),:) = []; %as above

% Remove midnight on Jan 1st
SnowLayerTemps(:,2556) = [];
SnowThermalConductivities(:,2556) = [];
SnowLayerThickness(:,2556) = [];
SnowLayerDensities(:,2556) = [];
SnowLayerGrainRadii(:,2556) = [];
SnowIceContent(:,2556) = [];
SnowLiquidWater(:,2556) = [];

% Rotate into columns
SnowLayerTemps = flipud(rot90(SnowLayerTemps));
SnowThermalConductivities = flipud(rot90(SnowThermalConductivities));
SnowLayerThickness = flipud(rot90(SnowLayerThickness));
SnowLayerDensities = flipud(rot90(SnowLayerDensities));
SnowLayerGrainRadii = flipud(rot90(SnowLayerGrainRadii));
SnowLayerGrainRadii = SnowLayerGrainRadii/1000; % convert to mm
SnowIceContent = flipud(rot90(SnowIceContent));
SnowLiquidWater = flipud(rot90(SnowLiquidWater));
%% Import Soil Parameters
% Hourly Soil Parameters:
SoilTemp_10cm_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','TSOI_10CM');
SoilTemp_10cm_CLM = SoilTemp_10cm_CLM - 273.15; % convert units

% Remove midnight on 1st Jan
SoilTemp_10cm_CLM = SoilTemp_10cm_CLM(1:61344); 

% Rotate into columns
SoilTemp_10cm_CLM = rot90(SoilTemp_10cm_CLM,3);

% Soil Layer Parameters:
SoilLayerTemps_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','TSOI');
SoilLayerTemps_CLM = (SoilLayerTemps_CLM - 273.15); %convert units
SoilLayerTemps_CLM = reshape(SoilLayerTemps_CLM,25,[]); %one row per layer

SoilMoisture_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','H2OSOI');
SoilMoisture_CLM = reshape(SoilMoisture_CLM,20,[]); %one row per layer

SoilLiquidWater_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','SOILLIQ');
SoilLiquidWater_CLM = reshape(SoilLiquidWater_CLM,20,[]); %one row per layer

PotentialSoilMoisture_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','SOILPSI');
PotentialSoilMoisture_CLM = reshape(PotentialSoilMoisture_CLM,25,[]); %one row per layer

SoilIce_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','SOILICE');
SoilIce_CLM = reshape(SoilIce_CLM,20,[]); %one row per layer

% Import soil properties to troubleshoot soil moisture:
% WetSoilDensity_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','soil_bulkdensity');
% WetSoilDensity_CLM = reshape(WetSoilDensity_CLM,25,[]); %one row per layer
% DrySoilDensity_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','dry_soildensity');
% DrySoilDensity_CLM = reshape(DrySoilDensity_CLM,25,[]); %one row per layer
% EffectiveSoilPorosity_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','EFF_POROSITY');
% EffectiveSoilPorosity_CLM = reshape(EffectiveSoilPorosity_CLM,25,[]); %one row per layer

% Remove midnight on 1st Jan
SoilLayerTemps_CLM(:,52585) = [];
SoilMoisture_CLM(:,52585) = [];
SoilLiquidWater_CLM(:,52585) = [];
PotentialSoilMoisture_CLM(:,52585) = [];
SoilIce_CLM(:,52585) = [];
% WetSoilDensity_CLM(:,52585) = [];
% DrySoilDensity_CLM(:,52585) = [];
% EffectiveSoilPorosity_CLM(:,52585) = [];

% Separate out relevant layers (Soil layers 1-5) and name with depths
% do I want to calculate 20 cm soil temp here? other "more standard" depths
% to match Obs? If not, need to export 16 and 26 to CSV to use for SHTM
CLM_SoilLayerDepths = [0.01, 0.04, 0.09, 0.16, 0.26, 0.4, 0.58, 0.8, 1.06, 1.36, 1.7, 2.08, 7.5, 2.99, 3.58, 4.27, 5.06, 5.95, 6.94, 8.03, 9.795, 13.328, 19.483, 28.871, 41.998];

SoilTemp_1cm_CLM = SoilLayerTemps_CLM(1,:);
SoilTemp_4cm_CLM = SoilLayerTemps_CLM(2,:);
SoilTemp_9cm_CLM = SoilLayerTemps_CLM(3,:);
SoilTemp_16cm_CLM = SoilLayerTemps_CLM(4,:);
SoilTemp_26cm_CLM = SoilLayerTemps_CLM(5,:);
SoilTemp_40cm_CLM = SoilLayerTemps_CLM(6,:);
SoilTemp_80cm_CLM = SoilLayerTemps_CLM(8,:);
SoilTemp_136cm_CLM = SoilLayerTemps_CLM(10,:);
SoilTemp_170cm_CLM = SoilLayerTemps_CLM(11,:);
SoilTemp_208cm_CLM = SoilLayerTemps_CLM(12,:);
SoilTemp_250cm_CLM = SoilLayerTemps_CLM(13,:);
SoilTemp_299cm_CLM = SoilLayerTemps_CLM(14,:);
SoilTemp_358cm_CLM = SoilLayerTemps_CLM(15,:);
SoilTemp_427cm_CLM = SoilLayerTemps_CLM(16,:);
% Additional Soil Layer Temps???
SoilH2O_1cm_CLM = SoilMoisture_CLM(1,:);
SoilH2O_4cm_CLM = SoilMoisture_CLM(2,:);
SoilH2O_9cm_CLM = SoilMoisture_CLM(3,:);
SoilH2O_16cm_CLM = SoilMoisture_CLM(4,:);
SoilH2O_26cm_CLM = SoilMoisture_CLM(5,:);
% Additional depths?
SoilLiqH2O_1cm_CLM = SoilLiquidWater_CLM(1,:);
SoilLiqH2O_4cm_CLM = SoilLiquidWater_CLM(2,:);
SoilLiqH2O_9cm_CLM = SoilLiquidWater_CLM(3,:);
SoilLiqH2O_16cm_CLM = SoilLiquidWater_CLM(4,:);
SoilLiqH2O_26cm_CLM = SoilLiquidWater_CLM(5,:);

SoilPSI_1cm_CLM = PotentialSoilMoisture_CLM(1,:);
SoilPSI_4cm_CLM = PotentialSoilMoisture_CLM(2,:);
SoilPSI_9cm_CLM = PotentialSoilMoisture_CLM(3,:);
SoilPSI_16cm_CLM = PotentialSoilMoisture_CLM(4,:);
SoilPSI_26cm_CLM = PotentialSoilMoisture_CLM(5,:);
SoilPSI_40cm_CLM = PotentialSoilMoisture_CLM(6,:);
SoilPSI_58cm_CLM = PotentialSoilMoisture_CLM(7,:);
SoilPSI_80cm_CLM = PotentialSoilMoisture_CLM(8,:);
SoilPSI_106cm_CLM = PotentialSoilMoisture_CLM(9,:);
SoilPSI_136cm_CLM = PotentialSoilMoisture_CLM(10,:);
SoilPSI_170cm_CLM = PotentialSoilMoisture_CLM(11,:);
SoilPSI_208cm_CLM = PotentialSoilMoisture_CLM(12,:);
SoilPSI_250cm_CLM = PotentialSoilMoisture_CLM(13,:);
SoilPSI_299cm_CLM = PotentialSoilMoisture_CLM(14,:);
SoilPSI_358cm_CLM = PotentialSoilMoisture_CLM(15,:);
SoilPSI_427cm_CLM = PotentialSoilMoisture_CLM(16,:);
SoilPSI_506cm_CLM = PotentialSoilMoisture_CLM(17,:);
SoilPSI_595cm_CLM = PotentialSoilMoisture_CLM(18,:);
SoilPSI_694cm_CLM = PotentialSoilMoisture_CLM(19,:);
SoilPSI_803cm_CLM = PotentialSoilMoisture_CLM(20,:);
SoilIce_1cm_CLM = SoilIce_CLM(1,:);
SoilIce_4cm_CLM = SoilIce_CLM(2,:);
SoilIce_9cm_CLM = SoilIce_CLM(3,:);
SoilIce_16cm_CLM = SoilIce_CLM(4,:);
SoilIce_26cm_CLM = SoilIce_CLM(5,:);
% Densities for same depths as liquid water > Should then be able to
% convert to normal soil moisture?
% SoilBulkDenWet_1cm_CLM = WetSoilDensity_CLM(1,:);
% SoilBulkDenWet_4cm_CLM = WetSoilDensity_CLM(2,:);
% SoilBulkDenWet_9cm_CLM = WetSoilDensity_CLM(3,:);
% SoilBulkDenWet_16cm_CLM = WetSoilDensity_CLM(4,:);
% SoilBulkDenWet_26cm_CLM = WetSoilDensity_CLM(5,:);
% SoilBulkDenDry_1cm_CLM = DrySoilDensity_CLM(1,:);
% SoilBulkDenDry_4cm_CLM = DrySoilDensity_CLM(2,:);
% SoilBulkDenDry_9cm_CLM = DrySoilDensity_CLM(3,:);
% SoilBulkDenDry_16cm_CLM = DrySoilDensity_CLM(4,:);
% SoilBulkDenDry_26cm_CLM = DrySoilDensity_CLM(5,:);
% EffSoilPorosity_1cm_CLM = EffectiveSoilPorosity_CLM(1,:);
% EffSoilPorosity_4cm_CLM = EffectiveSoilPorosity_CLM(2,:);
% EffSoilPorosity_9cm_CLM = EffectiveSoilPorosity_CLM(3,:);
% EffSoilPorosity_16cm_CLM = EffectiveSoilPorosity_CLM(4,:);
% EffSoilPorosity_26cm_CLM = EffectiveSoilPorosity_CLM(5,:);

% Rotate into columns
SoilTemp_1cm_CLM = rot90(SoilTemp_1cm_CLM,3);
SoilTemp_4cm_CLM = rot90(SoilTemp_4cm_CLM,3);
SoilTemp_9cm_CLM = rot90(SoilTemp_9cm_CLM,3);
SoilTemp_16cm_CLM = rot90(SoilTemp_16cm_CLM,3);
SoilTemp_26cm_CLM = rot90(SoilTemp_26cm_CLM,3);
SoilTemp_40cm_CLM = rot90(SoilTemp_40cm_CLM,3);
SoilTemp_80cm_CLM = rot90(SoilTemp_80cm_CLM,3);
SoilTemp_136cm_CLM = rot90(SoilTemp_136cm_CLM,3);
SoilTemp_170cm_CLM = rot90(SoilTemp_170cm_CLM,3);
SoilTemp_208cm_CLM = rot90(SoilTemp_208cm_CLM,3);
SoilTemp_250cm_CLM = rot90(SoilTemp_250cm_CLM,3);
SoilTemp_299cm_CLM = rot90(SoilTemp_299cm_CLM,3);
SoilTemp_358cm_CLM = rot90(SoilTemp_358cm_CLM,3);
SoilTemp_427cm_CLM = rot90(SoilTemp_427cm_CLM,3);
% Additional Soil Layer Temps???
SoilH2O_1cm_CLM = rot90(SoilH2O_1cm_CLM,3);
SoilH2O_4cm_CLM = rot90(SoilH2O_4cm_CLM,3);
SoilH2O_9cm_CLM = rot90(SoilH2O_9cm_CLM,3);
SoilH2O_16cm_CLM = rot90(SoilH2O_16cm_CLM,3);
SoilH2O_26cm_CLM = rot90(SoilH2O_26cm_CLM,3);
SoilLiqH2O_1cm_CLM = rot90(SoilLiqH2O_1cm_CLM,3);
SoilLiqH2O_4cm_CLM = rot90(SoilLiqH2O_4cm_CLM,3);
SoilLiqH2O_9cm_CLM = rot90(SoilLiqH2O_9cm_CLM,3);
SoilLiqH2O_16cm_CLM = rot90(SoilLiqH2O_16cm_CLM,3);
SoilLiqH2O_26cm_CLM = rot90(SoilLiqH2O_26cm_CLM,3);

SoilPSI_1cm_CLM = rot90(SoilPSI_1cm_CLM,3);
SoilPSI_4cm_CLM = rot90(SoilPSI_4cm_CLM,3);
SoilPSI_9cm_CLM = rot90(SoilPSI_9cm_CLM,3);
SoilPSI_16cm_CLM = rot90(SoilPSI_16cm_CLM,3);
SoilPSI_26cm_CLM = rot90(SoilPSI_26cm_CLM,3);
SoilPSI_40cm_CLM = rot90(SoilPSI_40cm_CLM,3);
SoilPSI_58cm_CLM = rot90(SoilPSI_58cm_CLM,3);
SoilPSI_80cm_CLM = rot90(SoilPSI_80cm_CLM,3);
SoilPSI_106cm_CLM = rot90(SoilPSI_106cm_CLM,3);
SoilPSI_136cm_CLM = rot90(SoilPSI_136cm_CLM,3);
SoilPSI_170cm_CLM = rot90(SoilPSI_170cm_CLM,3);
SoilPSI_208cm_CLM = rot90(SoilPSI_208cm_CLM,3);
SoilPSI_250cm_CLM = rot90(SoilPSI_250cm_CLM,3);
SoilPSI_299cm_CLM = rot90(SoilPSI_299cm_CLM,3);
SoilPSI_358cm_CLM = rot90(SoilPSI_358cm_CLM,3);
SoilPSI_427cm_CLM = rot90(SoilPSI_427cm_CLM,3);
SoilPSI_506cm_CLM = rot90(SoilPSI_506cm_CLM,3);
SoilPSI_595cm_CLM = rot90(SoilPSI_595cm_CLM,3);
SoilPSI_694cm_CLM = rot90(SoilPSI_694cm_CLM,3);
SoilPSI_803cm_CLM = rot90(SoilPSI_803cm_CLM,3);
SoilIce_1cm_CLM = rot90(SoilIce_1cm_CLM,3);
SoilIce_4cm_CLM = rot90(SoilIce_4cm_CLM,3);
SoilIce_9cm_CLM = rot90(SoilIce_9cm_CLM,3);
SoilIce_16cm_CLM = rot90(SoilIce_16cm_CLM,3);
SoilIce_26cm_CLM = rot90(SoilIce_26cm_CLM,3);
% SoilBulkDenWet_1cm_CLM = rot90(SoilBulkDenWet_1cm_CLM,3);
% SoilBulkDenWet_4cm_CLM = rot90(SoilBulkDenWet_4cm_CLM,3);
% SoilBulkDenWet_9cm_CLM = rot90(SoilBulkDenWet_9cm_CLM,3);
% SoilBulkDenWet_16cm_CLM = rot90(SoilBulkDenWet_16cm_CLM,3);
% SoilBulkDenWet_26cm_CLM = rot90(SoilBulkDenWet_26cm_CLM,3);
% SoilBulkDenDry_1cm_CLM = rot90(SoilBulkDenDry_1cm_CLM,3);
% SoilBulkDenDry_4cm_CLM = rot90(SoilBulkDenDry_4cm_CLM,3);
% SoilBulkDenDry_9cm_CLM = rot90(SoilBulkDenDry_9cm_CLM,3);
% SoilBulkDenDry_16cm_CLM = rot90(SoilBulkDenDry_16cm_CLM,3);
% SoilBulkDenDry_26cm_CLM = rot90(SoilBulkDenDry_26cm_CLM,3);
% EffSoilPorosity_1cm_CLM = rot90(EffSoilPorosity_1cm_CLM,3);
% EffSoilPorosity_4cm_CLM = rot90(EffSoilPorosity_4cm_CLM,3);
% EffSoilPorosity_9cm_CLM = rot90(EffSoilPorosity_9cm_CLM,3);
% EffSoilPorosity_16cm_CLM = rot90(EffSoilPorosity_16cm_CLM,3);
% EffSoilPorosity_26cm_CLM = rot90(EffSoilPorosity_26cm_CLM,3);

%% Import Carbon Parameters
% Hourly Carbon Parameters:
CO2Flux_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h2.2013-01-01-00000.nc','FCO2'); % Includes fires etc not in NEE
CH4Flux_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h2.2013-01-01-00000.nc','FCH4');

NEE_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h2.2013-01-01-00000.nc','NEE'); % NEE = NPP - ER
GPP_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h2.2013-01-01-00000.nc','GPP');
NPP_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h2.2013-01-01-00000.nc','NPP');
ER_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h2.2013-01-01-00000.nc','ER');
SoilResp_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h1.2013-01-01-00000.nc','SR'); 

% CLM units = gC/m^2/s (for NEE, NPP etc)
% CLM units = kgC/m^2/s (for FCO2 & FCH4)
% Obs units = µmol CO2 m-2 s-1

% Convert gramsC to umol
% 12.01g per mol, then mol to umol
NEE_mol_CLM = (NEE_CLM/12.01);
NEE_umol_CLM = NEE_mol_CLM*1000000;

GPP_mol_CLM = (GPP_CLM/12.01);
GPP_umol_CLM = GPP_mol_CLM*1000000;

NPP_mol_CLM = (NPP_CLM/12.01);
NPP_umol_CLM = NPP_mol_CLM*1000000;

ER_mol_CLM = (ER_CLM/12.01);
ER_umol_CLM = ER_mol_CLM*1000000;

SoilResp_mol_CLM = (SoilResp_CLM/12.01);
SoilResp_umol_CLM = SoilResp_mol_CLM*1000000;

% Convert kilogramsC to umol
% 12.01g per mol, so 0.01201 kg per mol? Then mol to umol as before
CO2Flux_mol_CLM = (CO2Flux_CLM/(12.01/1000));
CO2Flux_umol_CLM = CO2Flux_mol_CLM*1000000;

CH4Flux_mol_CLM = (CH4Flux_CLM/(12.01/1000));
CH4Flux_umol_CLM = CH4Flux_mol_CLM*1000000;


% Sum per PFT parameters to get total value
GPP_umol_CLM_AllPFTs  = sum(GPP_umol_CLM);
NPP_umol_CLM_AllPFTs  = sum(NPP_umol_CLM);

% Rotate into columns
CO2Flux_umol_CLM = rot90(CO2Flux_umol_CLM,3);
NEE_umol_CLM = rot90(NEE_umol_CLM,3);
NEE_gC_CLM = rot90(NEE_CLM,3);
CH4Flux_umol_CLM = rot90(CH4Flux_umol_CLM,3);
GPP_umol_CLM_AllPFTs = rot90(GPP_umol_CLM_AllPFTs,3);
NPP_umol_CLM_AllPFTs = rot90(NPP_umol_CLM_AllPFTs,3);
ER_umol_CLM = rot90(ER_umol_CLM,3);
SoilResp_umol_CLM = rot90(SoilResp_umol_CLM,3);

% Remove midnight on 1st Jan
CO2Flux_umol_CLM = CO2Flux_umol_CLM(1:61344);
NEE_umol_CLM = NEE_umol_CLM(1:61344);
NEE_gC_CLM = NEE_gC_CLM (1:61344);
CH4Flux_umol_CLM = CH4Flux_umol_CLM(1:61344);
GPP_umol_CLM_AllPFTs = GPP_umol_CLM_AllPFTs(1:61344);
NPP_umol_CLM_AllPFTs = NPP_umol_CLM_AllPFTs(1:61344);
ER_umol_CLM = ER_umol_CLM(1:61344);
SoilResp_umol_CLM = SoilResp_umol_CLM(1:61344);


%% Import Meterological Parameters
% Hourly Met Parameters:
AirTemp_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','TBOT');
AirTemp_CLM = AirTemp_CLM - 273.15; % convert units
Rainfall_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','RAIN');
RelativeHumidity_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','RH');
Shortwave_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','FLDS');
Longwave_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','FSDS');
Pressure_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','PBOT');
Pressure_CLM = Pressure_CLM/1000; % convert to KPa to match Obs
Windspeed_CLM = ncread('Restart_1500CryoT_STURM_minPSI-20_Q10-7.5-300.clm2.h3.2013-01-01-00000.nc','WIND');

% Remove midnight on 1st Jan
AirTemp_CLM = AirTemp_CLM(1:61344);
Rainfall_CLM = Rainfall_CLM(1:61344);
RelativeHumidity_CLM = RelativeHumidity_CLM(1:61344);
Shortwave_CLM = Shortwave_CLM(1:61344);
Longwave_CLM = Longwave_CLM(1:61344);
Pressure_CLM = Pressure_CLM(1:61344);
Windspeed_CLM = Windspeed_CLM(1:61344);

% Rotate into columns
AirTemp_CLM = rot90(AirTemp_CLM,3);
Rainfall_CLM = rot90(Rainfall_CLM,3);
RelativeHumidity_CLM = rot90(RelativeHumidity_CLM,3);
Shortwave_CLM = rot90(Shortwave_CLM,3);
Longwave_CLM = rot90(Longwave_CLM,3);
Pressure_CLM = rot90(Pressure_CLM,3);
Windspeed_CLM = rot90(Windspeed_CLM,3);
%% Construct Timetable
% Hourly Parameters:
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly = timetable(RawObs_Hourly.TIMESTAMP,RawObs_Hourly{:,6},AirTemp_CLM,RawObs_Hourly{:,7},RelativeHumidity_CLM,...
    RawObs_Hourly{:,37},Shortwave_CLM,RawObs_Hourly{:,38},Longwave_CLM,RawObs_Hourly{:,8},Pressure_CLM,... % insert wind here?
    RawObs_Hourly{:,44},Rainfall_CLM, RawObs_Hourly{:,45},Snowfall_CLM,RawObs_Hourly{:,46},RawObs_Hourly{:,47},SnowDepth_CLM, ... 
    SWE_CLM, SnowCoverFraction_CLM,... % additional CLM Snow Layer Parameters (Snow Layer Thickness, Snow Layer Density, Eff. Grain Size, Keff, Layer Temps)
    RawObs_Hourly{:,15}, RawObs_Hourly{:,16},RawObs_Hourly{:,17},RawObs_Hourly{:,18}, ... %observed soil temps
    SoilTemp_1cm_CLM,SoilTemp_4cm_CLM,SoilTemp_9cm_CLM,SoilTemp_10cm_CLM,SoilTemp_16cm_CLM, SoilTemp_26cm_CLM,... % CLM Soil temps
    SoilTemp_40cm_CLM,SoilTemp_80cm_CLM,SoilTemp_136cm_CLM,SoilTemp_170cm_CLM,SoilTemp_208cm_CLM,SoilTemp_250cm_CLM,SoilTemp_299cm_CLM,SoilTemp_358cm_CLM,SoilTemp_427cm_CLM,...% "Deep" CLM Soil temps
    SoilH2O_1cm_CLM,SoilLiqH2O_1cm_CLM,RawObs_Hourly{:,19},SoilH2O_4cm_CLM,SoilLiqH2O_4cm_CLM,RawObs_Hourly{:,20},SoilH2O_9cm_CLM,SoilLiqH2O_9cm_CLM,RawObs_Hourly{:,21},...
    SoilH2O_16cm_CLM,SoilLiqH2O_16cm_CLM,RawObs_Hourly{:,22},SoilH2O_26cm_CLM,SoilLiqH2O_26cm_CLM,... % Do I want deeper soil parameters as well?
    SoilPSI_1cm_CLM,SoilPSI_4cm_CLM,SoilPSI_9cm_CLM,SoilPSI_16cm_CLM,SoilPSI_26cm_CLM,... % Do I want deeper soil parameters as well?
    SoilPSI_40cm_CLM,SoilPSI_58cm_CLM, SoilPSI_80cm_CLM,SoilPSI_106cm_CLM, SoilPSI_136cm_CLM,SoilPSI_170cm_CLM,SoilPSI_208cm_CLM,SoilPSI_250cm_CLM,....
    SoilPSI_299cm_CLM,SoilPSI_358cm_CLM,SoilPSI_427cm_CLM,SoilPSI_506cm_CLM, SoilPSI_595cm_CLM, SoilPSI_694cm_CLM, SoilPSI_803cm_CLM,...% Deeper liquid moisture for shoulder season comp    
    SoilIce_1cm_CLM,SoilIce_4cm_CLM,SoilIce_9cm_CLM,SoilIce_16cm_CLM,SoilIce_26cm_CLM,...
    RawObs_Hourly{:,28},NEE_umol_CLM,NEE_gC_CLM,RawObs_Hourly{:,32},CH4Flux_umol_CLM, ... % Carbon variables in final line have no Obs to compare to
    NPP_umol_CLM_AllPFTs, GPP_umol_CLM_AllPFTs, ER_umol_CLM,CO2Flux_umol_CLM,SoilResp_umol_CLM); % More carbon variables
%     SoilBulkDenWet_1cm_CLM,SoilBulkDenDry_1cm_CLM,SoilBulkDenWet_4cm_CLM, SoilBulkDenDry_4cm_CLM, ...
%     SoilBulkDenWet_9cm_CLM, SoilBulkDenDry_9cm_CLM,SoilBulkDenWet_16cm_CLM,SoilBulkDenDry_16cm_CLM, SoilBulkDenWet_26cm_CLM, SoilBulkDenDry_26cm_CLM,...%  Soil Densities (CLM only) to convert/troubleshoot liquid water
%     EffSoilPorosity_1cm_CLM,EffSoilPorosity_4cm_CLM, EffSoilPorosity_9cm_CLM,EffSoilPorosity_16cm_CLM, EffSoilPorosity_26cm_CLM,...% soil porosity from CLM    
     

% rename columns
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{1} = 'AirTemp_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{2} = 'AirTemp_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{3} = 'RH_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{4} = 'RH_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{5} = 'Shortwave_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{6} = 'Shortwave_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{7} = 'Longwave_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{8} = 'Longwave_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{9} = 'AirPressure_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{10} = 'AirPressure_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{11} = 'Rainfall_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{12} = 'Rainfall_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{13} = 'Snowfall_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{14} = 'Snowfall_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{15} = 'SnowDepth_Echosounder_obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{16} = 'SnowDepth_MSC_obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{17} = 'SnowDepth_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{18} = 'SWE_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{19} = 'SCF_CLM';
% Want to splice in layer properties at this point
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{20} = 'SoilTemp_2cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{21} = 'SoilTemp_5cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{22} = 'SoilTemp_10cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{23} = 'SoilTemp_20cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{24} = 'SoilTemp_1cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{25} = 'SoilTemp_4cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{26} = 'SoilTemp_9cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{27} = 'SoilTemp_10cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{28} = 'SoilTemp_16cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{29} = 'SoilTemp_26cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{30} = 'SoilTemp_40cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{31} = 'SoilTemp_80cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{32} = 'SoilTemp_136cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{33} = 'SoilTemp_170cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{34} = 'SoilTemp_208cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{35} = 'SoilTemp_250cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{36} = 'SoilTemp_299cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{37} = 'SoilTemp_358cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{38} = 'SoilTemp_427cm_CLM';

Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{39} = 'TotalSoilMoisture_1cm_CLM'; % m^3 m^-3
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{40} = 'LiquidSoilMoisture_1cm_CLM'; % kg m^-3
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{41} = 'SoilMoisture_2cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{42} = 'TotalSoilMoisture_4cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{43} = 'LiquidSoilMoisture_4cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{44} = 'SoilMoisture_5cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{45} = 'TotalSoilMoisture_9cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{46} = 'LiquidSoilMoisture_9cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{47} = 'SoilMoisture_10cm_Obs'; 
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{48} = 'TotalSoilMoisture_16cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{49} = 'LiquidSoilMoisture_16cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{50} = 'SoilMoisture_20cm_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{51} = 'TotalSoilMoisture_26cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{52} = 'LiquidSoilMoisture_26cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{53} = 'SoilPSI_1cm_CLM'; %MPA
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{54} = 'SoilPSI_4cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{55} = 'SoilPSI_9cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{56} = 'SoilPSI_16cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{57} = 'SoilPSI_26cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{58} = 'SoilPSI_40cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{59} = 'SoilPSI_58cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{60} = 'SoilPSI_80cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{61} = 'SoilPSI_106cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{62} = 'SoilPSI_136cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{63} = 'SoilPSI_170cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{64} = 'SoilPSI_208cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{65} = 'SoilPSI_250cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{66} = 'SoilPSI_299cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{67} = 'SoilPSI_358cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{68} = 'SoilPSI_427cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{69} = 'SoilPSI_506cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{70} = 'SoilPSI_595cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{71} = 'SoilPSI_694cm_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{72} = 'SoilPSI_803cm_CLM';

Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{73} = 'SoilIceContent_1cm_CLM'; %kg m^-3
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{74} = 'SoilIceContent_4cm_CLM'; 
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{75} = 'SoilIceContent_9cm_CLM'; 
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{76} = 'SoilIceContent_16cm_CLM'; 
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{77} = 'SoilIceContent_26cm_CLM'; 

% Run0_Hourly.Properties.VariableNames{58} = 'WetSoilDensity_1cm_CLM'; %kg m^-3
% Run0_Hourly.Properties.VariableNames{59} = 'DrySoilDensity_1cm_CLM';
% Run0_Hourly.Properties.VariableNames{60} = 'WetSoilDensity_4cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{61} = 'DrySoilDensity_4cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{62} = 'WetSoilDensity_9cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{63} = 'DrySoilDensity_9cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{64} = 'WetSoilDensity_16cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{65} = 'DrySoilDensity_16cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{66} = 'WetSoilDensity_26cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{67} = 'DrySoilDensity_26cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{68} = 'EffectiveSoilPorosity_1cm_CLM'; %units = proportion (therefore, plot as unitless???)
% Run0_Hourly.Properties.VariableNames{69} = 'EffectiveSoilPorosity_4cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{70} = 'EffectiveSoilPorosity_9cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{71} = 'EffectiveSoilPorosity_16cm_CLM'; 
% Run0_Hourly.Properties.VariableNames{72} = 'EffectiveSoilPorosity_26cm_CLM';

Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{78} = 'NEE_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{79} = 'NEE_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{80} = 'NEE_CLM_gC';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{81} = 'CH4_Obs';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{82} = 'CH4_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{83} = 'NPP_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{84} = 'GPP_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{85} = 'EcosysResp_CLM';
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{86} = 'CO2Flux_CLM'; 
Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly.Properties.VariableNames{87} = 'SoilResp_CLM';

% export
cd 'D:\PhD Work\Modelling\CLM\Output Data From CLM\Paper 2\GitRepo\TVC\MonteCarlo\ShoulderSeasonInvestigations\Sturm_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-20'
writetimetable(Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly,'Sturm_1500CryoT_minPSI-20_Q10-7.5-300_Hourly.csv');

% Daily Parameters:
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = retime(Spinup1500CT_STURM_minPSI20_Q1075_300_Hourly,'Daily');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily(end,:) = []; % creates empty row for first of Jan, remove it

Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowLayerGrainRadii,'Before','SoilTemp_1cm_CLM');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowLayerDensities,'Before','SnowLayerGrainRadii');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowLayerThickness,'Before','SnowLayerDensities');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowThermalConductivities,'Before','SoilTemp_1cm_CLM');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowLayerTemps,'Before','SoilTemp_1cm_CLM');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowIceContent, 'Before','SoilTemp_1cm_CLM');
Spinup1500CT_STURM_minPSI20_Q1075_300_Daily = addvars(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,SnowLiquidWater,'Before','SoilTemp_1cm_CLM');

%export
writetimetable(Spinup1500CT_STURM_minPSI20_Q1075_300_Daily,'Sturm_1500CryoT_minPSI-20_Q10-7.5-300_Daily.csv');