%% Paper 2 
% Combines Paper 2 Stats and Paper 2 Figures files for publication
% 
% V. R. Dutch - Jan 2023
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%% Notes
% Model to model comparisions are daily resolution
% Model to EC comparisions are weekly resolution

%% Import Data
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\TVCObs'
FilteredObs = readtimetable('TVC_CLASSIC_ExtraFilter.csv');
FilledObs = readtimetable('TVC_Carolina_2013_2020_full_v2.csv');
NEE_avg_gCd = readtimetable('NEE_avg_gCd.csv');
% cut both to start of 2020, gives 365 weeks and one day. Cut last day from
% record because I'm not using that anyway ... However, computer thinks a
% week has to be monday to monday, and doing that rather than tuesdays
% might make my life easier ... 
tr = timerange(datetime(2013,01,01),datetime(2019,12,31));
FilteredObs = FilteredObs(tr,:);
FilledObs = FilledObs(tr,:);
NEE_avg_gCd = NEE_avg_gCd(tr,:);
FilledObs_Weekly = retime(FilledObs,'weekly','mean');
NEE_avg_gCd_Weekly = retime(NEE_avg_gCd,'weekly');

% Jordan Keff

%Default Q10
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\Default'
Run0_1500CT_Hourly = readtimetable('Baseline_Spinup1500CryoT_Hourly.csv');
Run0_1500CT_Daily = readtimetable('Baseline_Spinup1500CryoT_Daily.csv');
Run0_1500CT_Weekly = retime(Run0_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalarONLY\minPSI=-20'
minPSI20_1500CT_Hourly = readtimetable('Spinup1500CryoT_minPSI-20_Hourly.csv');
minPSI20_1500CT_Daily = readtimetable('Spinup1500CryoT_minPSI-20_Daily.csv');
minPSI20_1500CT_Weekly = retime(minPSI20_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalarONLY\minPSI=-200'
minPSI200_1500CT_Hourly = readtimetable('Spinup1500CryoT_minPSI-200_Hourly.csv');
minPSI200_1500CT_Daily = readtimetable('Spinup1500CryoT_minPSI-200_Daily.csv');
minPSI200_1500CT_Weekly = retime(minPSI200_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalarONLY\minPSI=-2000'
minPSI2000_1500CT_Hourly = readtimetable('Spinup1500CryoT_minPSI-2000_Hourly.csv');
minPSI2000_1500CT_Daily = readtimetable('Spinup1500CryoT_minPSI-2000_Daily.csv');
minPSI2000_1500CT_Weekly = retime(minPSI2000_1500CT_Hourly,'weekly','mean');
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\DefaultQ10\minPSI=-2000, Q10=1.5-300'
minPSI2000_Q1015_300_Hourly = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-1.5-300_Hourly.csv');
minPSI2000_Q1015_300_Daily = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-1.5-300_Daily.csv');
minPSI2000_Q1015_300_Weekly = retime(minPSI2000_Q1015_300_Hourly,'weekly','mean');

%Q10 = 2.5
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\Q10ONLY\Q10=2.5'
Q1025_1500CT_Hourly = readtimetable('Spinup1500CryoT_Q1025_Hourly.csv');
Q1025_1500CT_Daily = readtimetable('Spinup1500CryoT_Q1025_Daily.csv');
Q1025_1500CT_Weekly = retime(Q1025_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=2.5\minPSI=-20'
minPSI20_Q1025_Hourly = readtimetable('Spinup1500CryoT_minPSI-20_Q10-2.5_Hourly.csv');
minPSI20_Q1025_Daily = readtimetable('Spinup1500CryoT_minPSI-20_Q10-2.5_Daily.csv');
minPSI20_Q1025_Weekly = retime(minPSI20_Q1025_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=2.5\minPSI=-200'
minPSI200_Q1025_Hourly = readtimetable('Spinup1500CryoT_minPSI-200_Q10-2.5_Hourly.csv');
minPSI200_Q1025_Daily = readtimetable('Spinup1500CryoT_minPSI-200_Q10-2.5_Daily.csv');
minPSI200_Q1025_Weekly = retime(minPSI200_Q1025_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=2.5\minPSI=-2000'
minPSI2000_Q1025_Hourly = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-2.5_Hourly.csv');
minPSI2000_Q1025_Daily = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-2.5_Daily.csv');
minPSI2000_Q1025_Weekly = retime(minPSI2000_Q1025_Hourly,'weekly','mean');

%Q10 = 5.0
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\Q10ONLY\Q10=5.0'
Q1050_1500CT_Hourly = readtimetable('Spinup1500CryoT_Q1050_Hourly.csv');
Q1050_1500CT_Daily = readtimetable('Spinup1500CryoT_Q1050_Daily.csv');
Q1050_1500CT_Weekly = retime(Q1050_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=5.0\minPSI=-20'
minPSI20_Q1050_Hourly = readtimetable('Spinup1500CryoT_minPSI-20_Q10-5.0_Hourly.csv');
minPSI20_Q1050_Daily = readtimetable('Spinup1500CryoT_minPSI-20_Q10-5.0_Daily.csv');
minPSI20_Q1050_Weekly = retime(minPSI20_Q1050_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=5.0\minPSI=-200'
minPSI200_Q1050_Hourly = readtimetable('Spinup1500CryoT_minPSI-200_Q10-5.0_Hourly.csv');
minPSI200_Q1050_Daily = readtimetable('Spinup1500CryoT_minPSI-200_Q10-5.0_Daily.csv');
minPSI200_Q1050_Weekly = retime(minPSI200_Q1050_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=5.0\minPSI=-2000'
minPSI2000_Q1050_Hourly = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-5.0_Hourly.csv');
minPSI2000_Q1050_Daily = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-5.0_Daily.csv');
minPSI2000_Q1050_Weekly = retime(minPSI2000_Q1050_Hourly,'weekly','mean');

%Q10 = 7.5
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\Q10ONLY\Q10=7.5'
Q1075_1500CT_Hourly = readtimetable('Spinup1500CryoT_Q1075_Hourly.csv');
Q1075_1500CT_Daily = readtimetable('Spinup1500CryoT_Q1075_Daily.csv');
Q1075_1500CT_Weekly = retime(Q1075_1500CT_Hourly,'weekly','mean');
Q1075_300_1500CT_Hourly = readtimetable('Spinup1500CryoT_Q10-7.5-300_Hourly.csv');
Q1075_300_1500CT_Daily = readtimetable('Spinup1500CryoT_Q10-7.5-300_Daily.csv');
Q1075_300_1500CT_Weekly = retime(Q1075_300_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-20'
minPSI20_Q1075_Hourly = readtimetable('Spinup1500CryoT_minPSI-20_Q10-7.5_Hourly.csv');
minPSI20_Q1075_Daily = readtimetable('Spinup1500CryoT_minPSI-20_Q10-7.5_Daily.csv');
minPSI20_Q1075_Weekly = retime(minPSI20_Q1075_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-200'
minPSI200_Q1075_Hourly = readtimetable('Spinup1500CryoT_minPSI-200_Q10-7.5_Hourly.csv');
minPSI200_Q1075_Daily = readtimetable('Spinup1500CryoT_minPSI-200_Q10-7.5_Daily.csv');
minPSI200_Q1075_Weekly = retime(minPSI200_Q1075_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Default_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-2000'
minPSI2000_Q1075_Hourly = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-7.5_Hourly.csv');
minPSI2000_Q1075_Daily = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-7.5_Daily.csv');
minPSI2000_Q1075_Weekly = retime(minPSI2000_Q1075_Hourly,'weekly','mean');
minPSI2000_Q1075_300_Hourly = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-7.5-300_Hourly.csv');
minPSI2000_Q1075_300_Daily = readtimetable('Spinup1500CryoT_minPSI-2000_Q10-7.5-300_Daily.csv');
minPSI2000_Q1075_300_Weekly = retime(minPSI2000_Q1075_300_Hourly,'weekly','mean');

% Sturm Keff

%Default Q10
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\Default'
Sturm_1500CT_Hourly = readtimetable('1500CryoT_STURM_Hourly.csv');
Sturm_1500CT_Daily = readtimetable('1500CryoT_STURM_Daily.csv');
Sturm_1500CT_Weekly = retime(Sturm_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalarONLY\minPSI=-20'
Sturm_minPSI20_1500CT_Hourly = readtimetable('Sturm_1500CryoT_minPSI-20_Hourly.csv');
Sturm_minPSI20_1500CT_Daily = readtimetable('Sturm_1500CryoT_minPSI-20_Daily.csv');
Sturm_minPSI20_1500CT_Weekly = retime(Sturm_minPSI20_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalarONLY\minPSI=-200'
Sturm_minPSI200_1500CT_Hourly = readtimetable('Sturm_1500CryoT_minPSI-200_Hourly.csv');
Sturm_minPSI200_1500CT_Daily = readtimetable('Sturm_1500CryoT_minPSI-200_Daily.csv');
Sturm_minPSI200_1500CT_Weekly = retime(Sturm_minPSI200_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalarONLY\minPSI=-2000'
Sturm_minPSI2000_1500CT_Hourly = readtimetable('Sturm_1500CryoT_minPSI-2000_Hourly.csv');
Sturm_minPSI2000_1500CT_Daily = readtimetable('Sturm_1500CryoT_minPSI-2000_Daily.csv');
Sturm_minPSI2000_1500CT_Weekly = retime(Sturm_minPSI2000_1500CT_Hourly,'weekly','mean');

%Q10 = 2.5
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\Q10ONLY\Q10=2.5'
Sturm_Q1025_1500CT_Hourly = readtimetable('Sturm_1500CryoT_Q1025_Hourly.csv');
Sturm_Q1025_1500CT_Daily = readtimetable('Sturm_1500CryoT_Q1025_Daily.csv');
Sturm_Q1025_1500CT_Weekly = retime(Sturm_Q1025_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=2.5\minPSI=-20'
Sturm_minPSI20_Q1025_Hourly = readtimetable('Sturm_1500CryoT_minPSI-20_Q10-2.5_Hourly.csv');
Sturm_minPSI20_Q1025_Daily = readtimetable('Sturm_1500CryoT_minPSI-20_Q10-2.5_Daily.csv');
Sturm_minPSI20_Q1025_Weekly = retime(Sturm_minPSI20_Q1025_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=2.5\minPSI=-200'
Sturm_minPSI200_Q1025_Hourly = readtimetable('Sturm_1500CryoT_minPSI-200_Q10-2.5_Hourly.csv');
Sturm_minPSI200_Q1025_Daily = readtimetable('Sturm_1500CryoT_minPSI-200_Q10-2.5_Daily.csv');
Sturm_minPSI200_Q1025_Weekly = retime(Sturm_minPSI200_Q1025_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=2.5\minPSI=-2000'
Sturm_minPSI2000_Q1025_Hourly = readtimetable('Sturm_1500CryoT_minPSI-2000_Q10-2.5_Hourly.csv');
Sturm_minPSI2000_Q1025_Daily = readtimetable('Sturm_1500CryoT_minPSI-2000_Q10-2.5_Daily.csv');
Sturm_minPSI2000_Q1025_Weekly = retime(Sturm_minPSI2000_Q1025_Hourly,'weekly','mean');

%Q10 = 5.0
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\Q10ONLY\Q10=5.0'
Sturm_Q1050_1500CT_Hourly = readtimetable('Sturm_1500CryoT_Q1050_Hourly.csv');
Sturm_Q1050_1500CT_Daily = readtimetable('Sturm_1500CryoT_Q1050_Daily.csv');
Sturm_Q1050_1500CT_Weekly = retime(Sturm_Q1050_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=5.0\minPSI=-20'
Sturm_minPSI20_Q1050_Hourly = readtimetable('Sturm_1500CryoT_minPSI-20_Q10-5.0_Hourly.csv');
Sturm_minPSI20_Q1050_Daily = readtimetable('Sturm_1500CryoT_minPSI-20_Q10-5.0_Daily.csv');
Sturm_minPSI20_Q1050_Weekly = retime(Sturm_minPSI20_Q1050_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=5.0\minPSI=-200'
Sturm_minPSI200_Q1050_Hourly = readtimetable('Sturm_1500CryoT_minPSI-200_Q10-5.0_Hourly.csv');
Sturm_minPSI200_Q1050_Daily = readtimetable('Sturm_1500CryoT_minPSI-200_Q10-5.0_Daily.csv');
Sturm_minPSI200_Q1050_Weekly = retime(Sturm_minPSI200_Q1050_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=5.0\minPSI=-2000'
Sturm_minPSI2000_Q1050_Hourly = readtimetable('Sturm_1500CryoT_minPSI-2000_Q10-5.0_Hourly.csv');
Sturm_minPSI2000_Q1050_Daily = readtimetable('Sturm_1500CryoT_minPSI-2000_Q10-5.0_Daily.csv');
Sturm_minPSI2000_Q1050_Weekly = retime(Sturm_minPSI2000_Q1050_Hourly,'weekly','mean');

%Q10 = 7.5
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\Q10ONLY\Q10=7.5'
Sturm_Q1075_1500CT_Hourly = readtimetable('Sturm_1500CryoT_Q1075_Hourly.csv');
Sturm_Q1075_1500CT_Daily = readtimetable('Sturm_1500CryoT_Q1075_Daily.csv');
Sturm_Q1075_1500CT_Weekly = retime(Sturm_Q1075_1500CT_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-20'
Sturm_minPSI20_Q1075_Hourly = readtimetable('Sturm_1500CryoT_minPSI-20_Q10-7.5_Hourly.csv');
Sturm_minPSI20_Q1075_Daily = readtimetable('Sturm_1500CryoT_minPSI-20_Q10-7.5_Daily.csv');
Sturm_minPSI20_Q1075_Weekly = retime(Sturm_minPSI20_Q1075_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-200'
Sturm_minPSI200_Q1075_Hourly = readtimetable('Sturm_1500CryoT_minPSI-200_Q10-7.5_Hourly.csv');
Sturm_minPSI200_Q1075_Daily = readtimetable('Sturm_1500CryoT_minPSI-200_Q10-7.5_Daily.csv');
Sturm_minPSI200_Q1075_Weekly = retime(Sturm_minPSI200_Q1075_Hourly,'weekly','mean');

cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\CLMOutputData\Sturm_Keff\MoistureScalar&Q10\Q10=7.5\minPSI=-2000'
Sturm_minPSI2000_Q1075_Hourly = readtimetable('Sturm_1500CryoT_minPSI-2000_Q10-7.5_Hourly.csv');
Sturm_minPSI2000_Q1075_Daily = readtimetable('Sturm_1500CryoT_minPSI-2000_Q10-7.5_Daily.csv');
Sturm_minPSI2000_Q1075_Weekly = retime(Sturm_minPSI2000_Q1075_Hourly,'weekly','mean');

%% Timestamps
% Define SnowOn Dates
SnowOn_1617 = datetime('2016-10-09');
SnowOff_1617 = datetime('2017-05-23');
SnowOn_1617_n = datenum('2016-10-09');
SnowOff_1617_n = datenum('2017-05-23');
SnowOn_1718 = datetime('2017-10-12');
SnowOff_1718 = datetime('2018-05-30');
SnowOn_1718_n = datenum('2017-10-12');
SnowOff_1718_n = datenum('2018-05-30');
SnowOn_1819 = datetime('2018-09-24');
SnowOff_1819 = datetime('2019-05-23');
SnowOn_1819_n = datenum('2018-09-24');
SnowOff_1819_n = datenum('2019-05-23');

% Define Subsections
% 2016-17
start_frz_1617 = Sturm_1500CT_Weekly.Time(198);
start_mw_1617 = Sturm_1500CT_Weekly.Time(207); %9th dec (rounded to 11th)
start_thw_1617 = Sturm_1500CT_Weekly.Time(222); %28th March (rounded to 26th)
end_thw_1617 = Sturm_1500CT_Weekly.Time(230);
% 2017-18
start_frz_1718 = Sturm_1500CT_Weekly.Time(251);
start_mw_1718 = Sturm_1500CT_Weekly.Time(264); % 13th jan (rounded to 14th)
start_thw_1718 = Sturm_1500CT_Weekly.Time(278); % 23rd april (rounded to 22nd)
end_thw_1718 = Sturm_1500CT_Weekly.Time(283);
% 2018-19
start_frz_1819 = Sturm_1500CT_Weekly.Time(301);
start_mw_1819 = Sturm_1500CT_Weekly.Time(317); %17th jan (rounded to 20th)
start_thw_1819 = Sturm_1500CT_Weekly.Time(327); %3rd april (rounded to 31st Mar)
end_thw_1819 = Sturm_1500CT_Weekly.Time(334);

StartTimeseries = datetime(2016,09,01);
EndTimeseries = datetime(2019,09,01);

%% Avg. Modellled Wintertime Resp & NEE

% 2016/17
% Snow-on: 9th Oct (1378)
% Snow-off: 23rd May (1604)

% 2017/18
% Snow-on: 12th Oct (1746)
% Snow-off: 30th May (1976)

% 2018/19
% Snow-on: 24th Sept (2093)
% Snow-off: 23rd May (2334)


% Subset snow season resp
% 2016/17
SSResp1617_Run0_1500CT = Run0_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI20_1500CT = minPSI20_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI200_1500CT = minPSI200_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI2000_1500CT = minPSI2000_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Q1025_1500CT = Q1025_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI20_Q1025 = minPSI20_Q1025_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI200_Q1025 = minPSI200_Q1025_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI2000_Q1025 = minPSI2000_Q1025_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Q1050_1500CT = Q1050_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI20_Q1050 = minPSI20_Q1050_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI200_Q1050 = minPSI200_Q1050_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI2000_Q1050 = minPSI2000_Q1050_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Q1075_1500CT = Q1025_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI20_Q1075 = minPSI20_Q1075_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI200_Q1075 = minPSI200_Q1075_Daily.SoilResp_CLM(1378:1604);
SSResp1617_minPSI2000_Q1075 = minPSI2000_Q1075_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_1500CT = Sturm_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI20 = Sturm_minPSI20_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI200 = Sturm_minPSI200_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI2000 = Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_Q1025 = Sturm_Q1025_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI20_Q1025 = Sturm_minPSI20_Q1025_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI200_Q1025 = Sturm_minPSI200_Q1025_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI2000_Q1025 = Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_Q1050 = Sturm_Q1050_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI20_Q1050 = Sturm_minPSI20_Q1050_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI200_Q1050 = Sturm_minPSI200_Q1050_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI2000_Q1050 = Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_Q1075 = Sturm_Q1025_1500CT_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI20_Q1075 = Sturm_minPSI20_Q1075_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI200_Q1075 = Sturm_minPSI200_Q1075_Daily.SoilResp_CLM(1378:1604);
SSResp1617_Sturm_minPSI2000_Q1075 = Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM(1378:1604);

SnowSeasonResp_1617 = horzcat(SSResp1617_Run0_1500CT, SSResp1617_minPSI20_1500CT, SSResp1617_minPSI200_1500CT, SSResp1617_minPSI2000_1500CT,...
    SSResp1617_Q1025_1500CT, SSResp1617_minPSI20_Q1025, SSResp1617_minPSI200_Q1025, SSResp1617_minPSI2000_Q1025, ...
    SSResp1617_Q1050_1500CT, SSResp1617_minPSI20_Q1050, SSResp1617_minPSI200_Q1050, SSResp1617_minPSI2000_Q1050,...
    SSResp1617_Q1075_1500CT, SSResp1617_minPSI20_Q1075, SSResp1617_minPSI200_Q1075, SSResp1617_minPSI2000_Q1075,...
    SSResp1617_Sturm_1500CT, SSResp1617_Sturm_minPSI20, SSResp1617_Sturm_minPSI200, SSResp1617_Sturm_minPSI2000,... 
    SSResp1617_Sturm_Q1025, SSResp1617_Sturm_minPSI20_Q1025, SSResp1617_Sturm_minPSI200_Q1025, SSResp1617_Sturm_minPSI2000_Q1025,...
    SSResp1617_Sturm_Q1050, SSResp1617_Sturm_minPSI20_Q1050, SSResp1617_Sturm_minPSI200_Q1050, SSResp1617_Sturm_minPSI2000_Q1050,...
    SSResp1617_Sturm_Q1075, SSResp1617_Sturm_minPSI20_Q1075, SSResp1617_Sturm_minPSI200_Q1075, SSResp1617_Sturm_minPSI2000_Q1075);% concatinate - just a matrix?
% Write out order?

% 2017/18
SSResp1718_Run0_1500CT = Run0_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI20_1500CT = minPSI20_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI200_1500CT = minPSI200_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI2000_1500CT = minPSI2000_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Q1025_1500CT = Q1025_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI20_Q1025 = minPSI20_Q1025_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI200_Q1025 = minPSI200_Q1025_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI2000_Q1025 = minPSI2000_Q1025_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Q1050_1500CT = Q1050_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI20_Q1050 = minPSI20_Q1050_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI200_Q1050 = minPSI200_Q1050_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI2000_Q1050 = minPSI2000_Q1050_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Q1075_1500CT = Q1025_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI20_Q1075 = minPSI20_Q1075_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI200_Q1075 = minPSI200_Q1075_Daily.SoilResp_CLM(1746:1976);
SSResp1718_minPSI2000_Q1075 = minPSI2000_Q1075_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_1500CT = Sturm_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI20 = Sturm_minPSI20_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI200 = Sturm_minPSI200_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI2000 = Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_Q1025 = Sturm_Q1025_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI20_Q1025 = Sturm_minPSI20_Q1025_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI200_Q1025 = Sturm_minPSI200_Q1025_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI2000_Q1025 = Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_Q1050 = Sturm_Q1050_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI20_Q1050 = Sturm_minPSI20_Q1050_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI200_Q1050 = Sturm_minPSI200_Q1050_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI2000_Q1050 = Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_Q1075 = Sturm_Q1025_1500CT_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI20_Q1075 = Sturm_minPSI20_Q1075_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI200_Q1075 = Sturm_minPSI200_Q1075_Daily.SoilResp_CLM(1746:1976);
SSResp1718_Sturm_minPSI2000_Q1075 = Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM(1746:1976);

SnowSeasonResp_1718 = horzcat(SSResp1718_Run0_1500CT, SSResp1718_minPSI20_1500CT, SSResp1718_minPSI200_1500CT, SSResp1718_minPSI2000_1500CT,...
    SSResp1718_Q1025_1500CT, SSResp1718_minPSI20_Q1025, SSResp1718_minPSI200_Q1025, SSResp1718_minPSI2000_Q1025, ...
    SSResp1718_Q1050_1500CT, SSResp1718_minPSI20_Q1050, SSResp1718_minPSI200_Q1050, SSResp1718_minPSI2000_Q1050,...
    SSResp1718_Q1075_1500CT, SSResp1718_minPSI20_Q1075, SSResp1718_minPSI200_Q1075, SSResp1718_minPSI2000_Q1075,...
    SSResp1718_Sturm_1500CT, SSResp1718_Sturm_minPSI20, SSResp1718_Sturm_minPSI200, SSResp1718_Sturm_minPSI2000,... 
    SSResp1718_Sturm_Q1025, SSResp1718_Sturm_minPSI20_Q1025, SSResp1718_Sturm_minPSI200_Q1025, SSResp1718_Sturm_minPSI2000_Q1025,...
    SSResp1718_Sturm_Q1050, SSResp1718_Sturm_minPSI20_Q1050, SSResp1718_Sturm_minPSI200_Q1050, SSResp1718_Sturm_minPSI2000_Q1050,...
    SSResp1718_Sturm_Q1075, SSResp1718_Sturm_minPSI20_Q1075, SSResp1718_Sturm_minPSI200_Q1075, SSResp1718_Sturm_minPSI2000_Q1075);% concatinate - just a matrix?

% 2018/19
SSResp1819_Run0_1500CT = Run0_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI20_1500CT = minPSI20_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI200_1500CT = minPSI200_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI2000_1500CT = minPSI2000_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Q1025_1500CT = Q1025_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI20_Q1025 = minPSI20_Q1025_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI200_Q1025 = minPSI200_Q1025_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI2000_Q1025 = minPSI2000_Q1025_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Q1050_1500CT = Q1050_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI20_Q1050 = minPSI20_Q1050_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI200_Q1050 = minPSI200_Q1050_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI2000_Q1050 = minPSI2000_Q1050_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Q1075_1500CT = Q1025_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI20_Q1075 = minPSI20_Q1075_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI200_Q1075 = minPSI200_Q1075_Daily.SoilResp_CLM(2093:2334);
SSResp1819_minPSI2000_Q1075 = minPSI2000_Q1075_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_1500CT = Sturm_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI20 = Sturm_minPSI20_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI200 = Sturm_minPSI200_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI2000 = Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_Q1025 = Sturm_Q1025_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI20_Q1025 = Sturm_minPSI20_Q1025_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI200_Q1025 = Sturm_minPSI200_Q1025_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI2000_Q1025 = Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_Q1050 = Sturm_Q1050_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI20_Q1050 = Sturm_minPSI20_Q1050_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI200_Q1050 = Sturm_minPSI200_Q1050_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI2000_Q1050 = Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_Q1075 = Sturm_Q1025_1500CT_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI20_Q1075 = Sturm_minPSI20_Q1075_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI200_Q1075 = Sturm_minPSI200_Q1075_Daily.SoilResp_CLM(2093:2334);
SSResp1819_Sturm_minPSI2000_Q1075 = Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM(2093:2334);

SnowSeasonResp_1819 = horzcat(SSResp1819_Run0_1500CT, SSResp1819_minPSI20_1500CT, SSResp1819_minPSI200_1500CT, SSResp1819_minPSI2000_1500CT,...
    SSResp1819_Q1025_1500CT, SSResp1819_minPSI20_Q1025, SSResp1819_minPSI200_Q1025, SSResp1819_minPSI2000_Q1025, ...
    SSResp1819_Q1050_1500CT, SSResp1819_minPSI20_Q1050, SSResp1819_minPSI200_Q1050, SSResp1819_minPSI2000_Q1050,...
    SSResp1819_Q1075_1500CT, SSResp1819_minPSI20_Q1075, SSResp1819_minPSI200_Q1075, SSResp1819_minPSI2000_Q1075,...
    SSResp1819_Sturm_1500CT, SSResp1819_Sturm_minPSI20, SSResp1819_Sturm_minPSI200, SSResp1819_Sturm_minPSI2000,... 
    SSResp1819_Sturm_Q1025, SSResp1819_Sturm_minPSI20_Q1025, SSResp1819_Sturm_minPSI200_Q1025, SSResp1819_Sturm_minPSI2000_Q1025,...
    SSResp1819_Sturm_Q1050, SSResp1819_Sturm_minPSI20_Q1050, SSResp1819_Sturm_minPSI200_Q1050, SSResp1819_Sturm_minPSI2000_Q1050,...
    SSResp1819_Sturm_Q1075, SSResp1819_Sturm_minPSI20_Q1075, SSResp1819_Sturm_minPSI200_Q1075, SSResp1819_Sturm_minPSI2000_Q1075);% concatinate - just a matrix?

% Avg = Column means,medians and std. devs.
MeanSnowSeasonResp_1617 = mean(SnowSeasonResp_1617);
MeanSnowSeasonResp_1718 = mean(SnowSeasonResp_1718);
MeanSnowSeasonResp_1819 = mean(SnowSeasonResp_1819);
MedianSnowSeasonResp_1617 = median(SnowSeasonResp_1617);
MedianSnowSeasonResp_1718 = median(SnowSeasonResp_1718);
MedianSnowSeasonResp_1819 = median(SnowSeasonResp_1819);
StdDevSnowSeasonResp_1617 = std(SnowSeasonResp_1617);
StdDevSnowSeasonResp_1718 = std(SnowSeasonResp_1718);
StdDevSnowSeasonResp_1819 = std(SnowSeasonResp_1819);
%Combined
SnowSeasonResp = vertcat(SnowSeasonResp_1617,SnowSeasonResp_1718,SnowSeasonResp_1819);
MeanSnowSeasonResp = mean(SnowSeasonResp);
StdDevSnowSeasonResp = std(SnowSeasonResp);

% Range (max - min per timestep)
Range_SnowSeasonResp_1617 = (max(SnowSeasonResp_1617,[],2)) - (min(SnowSeasonResp_1617,[],2));
Range_SnowSeasonResp_1718 = (max(SnowSeasonResp_1718,[],2)) - (min(SnowSeasonResp_1718,[],2));
Range_SnowSeasonResp_1819 = (max(SnowSeasonResp_1819,[],2)) - (min(SnowSeasonResp_1819,[],2));

%% Repeat for Modelled NEE
% Subset snow season NEE
% 2016/17
SSNEE1617_Run0_1500CT = Run0_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI20_1500CT = minPSI20_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI200_1500CT = minPSI200_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI2000_1500CT = minPSI2000_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Q1025_1500CT = Q1025_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI20_Q1025 = minPSI20_Q1025_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI200_Q1025 = minPSI200_Q1025_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI2000_Q1025 = minPSI2000_Q1025_Daily.NEE_CLM(1378:1604);
SSNEE1617_Q1050_1500CT = Q1050_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI20_Q1050 = minPSI20_Q1050_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI200_Q1050 = minPSI200_Q1050_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI2000_Q1050 = minPSI2000_Q1050_Daily.NEE_CLM(1378:1604);
SSNEE1617_Q1075_1500CT = Q1025_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI20_Q1075 = minPSI20_Q1075_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI200_Q1075 = minPSI200_Q1075_Daily.NEE_CLM(1378:1604);
SSNEE1617_minPSI2000_Q1075 = minPSI2000_Q1075_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_1500CT = Sturm_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI20 = Sturm_minPSI20_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI200 = Sturm_minPSI200_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI2000 = Sturm_minPSI2000_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_Q1025 = Sturm_Q1025_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI20_Q1025 = Sturm_minPSI20_Q1025_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI200_Q1025 = Sturm_minPSI200_Q1025_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI2000_Q1025 = Sturm_minPSI2000_Q1025_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_Q1050 = Sturm_Q1050_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI20_Q1050 = Sturm_minPSI20_Q1050_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI200_Q1050 = Sturm_minPSI200_Q1050_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI2000_Q1050 = Sturm_minPSI2000_Q1050_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_Q1075 = Sturm_Q1025_1500CT_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI20_Q1075 = Sturm_minPSI20_Q1075_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI200_Q1075 = Sturm_minPSI200_Q1075_Daily.NEE_CLM(1378:1604);
SSNEE1617_Sturm_minPSI2000_Q1075 = Sturm_minPSI2000_Q1075_Daily.NEE_CLM(1378:1604);

SnowSeasonNEE_1617 = horzcat(SSNEE1617_Run0_1500CT, SSNEE1617_minPSI20_1500CT, SSNEE1617_minPSI200_1500CT, SSNEE1617_minPSI2000_1500CT,...
    SSNEE1617_Q1025_1500CT, SSNEE1617_minPSI20_Q1025, SSNEE1617_minPSI200_Q1025, SSNEE1617_minPSI2000_Q1025, ...
    SSNEE1617_Q1050_1500CT, SSNEE1617_minPSI20_Q1050, SSNEE1617_minPSI200_Q1050, SSNEE1617_minPSI2000_Q1050,...
    SSNEE1617_Q1075_1500CT, SSNEE1617_minPSI20_Q1075, SSNEE1617_minPSI200_Q1075, SSNEE1617_minPSI2000_Q1075,...
    SSNEE1617_Sturm_1500CT, SSNEE1617_Sturm_minPSI20, SSNEE1617_Sturm_minPSI200, SSNEE1617_Sturm_minPSI2000,... 
    SSNEE1617_Sturm_Q1025, SSNEE1617_Sturm_minPSI20_Q1025, SSNEE1617_Sturm_minPSI200_Q1025, SSNEE1617_Sturm_minPSI2000_Q1025,...
    SSNEE1617_Sturm_Q1050, SSNEE1617_Sturm_minPSI20_Q1050, SSNEE1617_Sturm_minPSI200_Q1050, SSNEE1617_Sturm_minPSI2000_Q1050,...
    SSNEE1617_Sturm_Q1075, SSNEE1617_Sturm_minPSI20_Q1075, SSNEE1617_Sturm_minPSI200_Q1075, SSNEE1617_Sturm_minPSI2000_Q1075);% concatinate - just a matrix?

% 2017/18
SSNEE1718_Run0_1500CT = Run0_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI20_1500CT = minPSI20_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI200_1500CT = minPSI200_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI2000_1500CT = minPSI2000_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Q1025_1500CT = Q1025_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI20_Q1025 = minPSI20_Q1025_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI200_Q1025 = minPSI200_Q1025_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI2000_Q1025 = minPSI2000_Q1025_Daily.NEE_CLM(1746:1976);
SSNEE1718_Q1050_1500CT = Q1050_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI20_Q1050 = minPSI20_Q1050_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI200_Q1050 = minPSI200_Q1050_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI2000_Q1050 = minPSI2000_Q1050_Daily.NEE_CLM(1746:1976);
SSNEE1718_Q1075_1500CT = Q1025_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI20_Q1075 = minPSI20_Q1075_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI200_Q1075 = minPSI200_Q1075_Daily.NEE_CLM(1746:1976);
SSNEE1718_minPSI2000_Q1075 = minPSI2000_Q1075_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_1500CT = Sturm_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI20 = Sturm_minPSI20_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI200 = Sturm_minPSI200_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI2000 = Sturm_minPSI2000_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_Q1025 = Sturm_Q1025_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI20_Q1025 = Sturm_minPSI20_Q1025_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI200_Q1025 = Sturm_minPSI200_Q1025_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI2000_Q1025 = Sturm_minPSI2000_Q1025_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_Q1050 = Sturm_Q1050_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI20_Q1050 = Sturm_minPSI20_Q1050_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI200_Q1050 = Sturm_minPSI200_Q1050_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI2000_Q1050 = Sturm_minPSI2000_Q1050_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_Q1075 = Sturm_Q1025_1500CT_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI20_Q1075 = Sturm_minPSI20_Q1075_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI200_Q1075 = Sturm_minPSI200_Q1075_Daily.NEE_CLM(1746:1976);
SSNEE1718_Sturm_minPSI2000_Q1075 = Sturm_minPSI2000_Q1075_Daily.NEE_CLM(1746:1976);

SnowSeasonNEE_1718 = horzcat(SSNEE1718_Run0_1500CT, SSNEE1718_minPSI20_1500CT, SSNEE1718_minPSI200_1500CT, SSNEE1718_minPSI2000_1500CT,...
    SSNEE1718_Q1025_1500CT, SSNEE1718_minPSI20_Q1025, SSNEE1718_minPSI200_Q1025, SSNEE1718_minPSI2000_Q1025, ...
    SSNEE1718_Q1050_1500CT, SSNEE1718_minPSI20_Q1050, SSNEE1718_minPSI200_Q1050, SSNEE1718_minPSI2000_Q1050,...
    SSNEE1718_Q1075_1500CT, SSNEE1718_minPSI20_Q1075, SSNEE1718_minPSI200_Q1075, SSNEE1718_minPSI2000_Q1075,...
    SSNEE1718_Sturm_1500CT, SSNEE1718_Sturm_minPSI20, SSNEE1718_Sturm_minPSI200, SSNEE1718_Sturm_minPSI2000,... 
    SSNEE1718_Sturm_Q1025, SSNEE1718_Sturm_minPSI20_Q1025, SSNEE1718_Sturm_minPSI200_Q1025, SSNEE1718_Sturm_minPSI2000_Q1025,...
    SSNEE1718_Sturm_Q1050, SSNEE1718_Sturm_minPSI20_Q1050, SSNEE1718_Sturm_minPSI200_Q1050, SSNEE1718_Sturm_minPSI2000_Q1050,...
    SSNEE1718_Sturm_Q1075, SSNEE1718_Sturm_minPSI20_Q1075, SSNEE1718_Sturm_minPSI200_Q1075, SSNEE1718_Sturm_minPSI2000_Q1075);% concatinate - just a matrix?

% 2018/19
SSNEE1819_Run0_1500CT = Run0_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI20_1500CT = minPSI20_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI200_1500CT = minPSI200_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI2000_1500CT = minPSI2000_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Q1025_1500CT = Q1025_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI20_Q1025 = minPSI20_Q1025_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI200_Q1025 = minPSI200_Q1025_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI2000_Q1025 = minPSI2000_Q1025_Daily.NEE_CLM(2093:2334);
SSNEE1819_Q1050_1500CT = Q1050_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI20_Q1050 = minPSI20_Q1050_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI200_Q1050 = minPSI200_Q1050_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI2000_Q1050 = minPSI2000_Q1050_Daily.NEE_CLM(2093:2334);
SSNEE1819_Q1075_1500CT = Q1025_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI20_Q1075 = minPSI20_Q1075_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI200_Q1075 = minPSI200_Q1075_Daily.NEE_CLM(2093:2334);
SSNEE1819_minPSI2000_Q1075 = minPSI2000_Q1075_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_1500CT = Sturm_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI20 = Sturm_minPSI20_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI200 = Sturm_minPSI200_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI2000 = Sturm_minPSI2000_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_Q1025 = Sturm_Q1025_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI20_Q1025 = Sturm_minPSI20_Q1025_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI200_Q1025 = Sturm_minPSI200_Q1025_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI2000_Q1025 = Sturm_minPSI2000_Q1025_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_Q1050 = Sturm_Q1050_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI20_Q1050 = Sturm_minPSI20_Q1050_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI200_Q1050 = Sturm_minPSI200_Q1050_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI2000_Q1050 = Sturm_minPSI2000_Q1050_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_Q1075 = Sturm_Q1025_1500CT_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI20_Q1075 = Sturm_minPSI20_Q1075_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI200_Q1075 = Sturm_minPSI200_Q1075_Daily.NEE_CLM(2093:2334);
SSNEE1819_Sturm_minPSI2000_Q1075 = Sturm_minPSI2000_Q1075_Daily.NEE_CLM(2093:2334);

SnowSeasonNEE_1819 = horzcat(SSNEE1819_Run0_1500CT, SSNEE1819_minPSI20_1500CT, SSNEE1819_minPSI200_1500CT, SSNEE1819_minPSI2000_1500CT,...
    SSNEE1819_Q1025_1500CT, SSNEE1819_minPSI20_Q1025, SSNEE1819_minPSI200_Q1025, SSNEE1819_minPSI2000_Q1025, ...
    SSNEE1819_Q1050_1500CT, SSNEE1819_minPSI20_Q1050, SSNEE1819_minPSI200_Q1050, SSNEE1819_minPSI2000_Q1050,...
    SSNEE1819_Q1075_1500CT, SSNEE1819_minPSI20_Q1075, SSNEE1819_minPSI200_Q1075, SSNEE1819_minPSI2000_Q1075,...
    SSNEE1819_Sturm_1500CT, SSNEE1819_Sturm_minPSI20, SSNEE1819_Sturm_minPSI200, SSNEE1819_Sturm_minPSI2000,... 
    SSNEE1819_Sturm_Q1025, SSNEE1819_Sturm_minPSI20_Q1025, SSNEE1819_Sturm_minPSI200_Q1025, SSNEE1819_Sturm_minPSI2000_Q1025,...
    SSNEE1819_Sturm_Q1050, SSNEE1819_Sturm_minPSI20_Q1050, SSNEE1819_Sturm_minPSI200_Q1050, SSNEE1819_Sturm_minPSI2000_Q1050,...
    SSNEE1819_Sturm_Q1075, SSNEE1819_Sturm_minPSI20_Q1075, SSNEE1819_Sturm_minPSI200_Q1075, SSNEE1819_Sturm_minPSI2000_Q1075);% concatinate - just a matrix?

% Avg = Column means,medians and std. devs.
MeanSnowSeasonNEE_1617 = mean(SnowSeasonNEE_1617);
MeanSnowSeasonNEE_1718 = mean(SnowSeasonNEE_1718);
MeanSnowSeasonNEE_1819 = mean(SnowSeasonNEE_1819);
MedianSnowSeasonNEE_1617 = median(SnowSeasonNEE_1617);
MedianSnowSeasonNEE_1718 = median(SnowSeasonNEE_1718);
MedianSnowSeasonNEE_1819 = median(SnowSeasonNEE_1819);
StdDevSnowSeasonNEE_1617 = std(SnowSeasonNEE_1617);
StdDevSnowSeasonNEE_1718 = std(SnowSeasonNEE_1718);
StdDevSnowSeasonNEE_1819 = std(SnowSeasonNEE_1819);

% Range (max - min per timestep)
Range_SnowSeasonNEE_1617 = (max(SnowSeasonNEE_1617,[],2)) - (min(SnowSeasonNEE_1617,[],2));
Range_SnowSeasonNEE_1718 = (max(SnowSeasonNEE_1718,[],2)) - (min(SnowSeasonNEE_1718,[],2));
Range_SnowSeasonNEE_1819 = (max(SnowSeasonNEE_1819,[],2)) - (min(SnowSeasonNEE_1819,[],2));

%% Stats per minΨ values (Daily Res)

% default Ψ
%Jordan
minPSI_Default_J_SR = horzcat(Run0_1500CT_Daily.SoilResp_CLM, Q1025_1500CT_Daily.SoilResp_CLM,Q1050_1500CT_Daily.SoilResp_CLM,Q1075_1500CT_Daily.SoilResp_CLM);% Soil Resp
minPSI_Default_J_NEE = horzcat(Run0_1500CT_Daily.NEE_CLM, Q1025_1500CT_Daily.NEE_CLM,Q1050_1500CT_Daily.NEE_CLM,Q1075_1500CT_Daily.NEE_CLM);% NEE
% stats (per timestep, SR)
a = mean(minPSI_Default_J_SR,2);% mean
b = median(minPSI_Default_J_SR,2);% median
c = quantile(minPSI_Default_J_SR,0.25,2);% Q1
d = quantile(minPSI_Default_J_SR,0.75,2);% Q3
minPSI_Default_J_MaxSR = max(minPSI_Default_J_SR,[],2);% max
minPSI_Default_J_MinSR = min(minPSI_Default_J_SR,[],2);% min
g = std(minPSI_Default_J_SR,0,2);% std dev
% stats (per timestep, NEE)
z = mean(minPSI_Default_J_NEE,2);% mean
y = median(minPSI_Default_J_NEE,2);% median
x = quantile(minPSI_Default_J_NEE,0.25,2);% Q1
w = quantile(minPSI_Default_J_NEE,0.75,2);% Q3
minPSI_Default_J_MaxNEE = max(minPSI_Default_J_NEE,[],2);% max
minPSI_Default_J_MinNEE = min(minPSI_Default_J_NEE,[],2);% min
v = std(minPSI_Default_J_NEE,0,2);% std dev

%Sturm
minPSI_Default_S_SR = horzcat(Sturm_1500CT_Daily.SoilResp_CLM,Sturm_Q1025_1500CT_Daily.SoilResp_CLM,Sturm_Q1050_1500CT_Daily.SoilResp_CLM,Sturm_Q1075_1500CT_Daily.SoilResp_CLM); % Soil Resp
minPSI_Default_S_NEE = horzcat(Sturm_1500CT_Daily.NEE_CLM,Sturm_Q1025_1500CT_Daily.NEE_CLM,Sturm_Q1050_1500CT_Daily.NEE_CLM,Sturm_Q1075_1500CT_Daily.NEE_CLM); % NEE
% stats (per timestep, SR)
e = mean(minPSI_Default_S_SR,2);% mean
f = median(minPSI_Default_S_SR,2);% median
h = quantile(minPSI_Default_S_SR,0.25,2);% Q1
j = quantile(minPSI_Default_S_SR,0.75,2);% Q3
minPSI_Default_S_MaxSR = max(minPSI_Default_S_SR,[],2);% max
minPSI_Default_S_MinSR = min(minPSI_Default_S_SR,[],2);% min
k = std(minPSI_Default_S_SR,0,2);% std dev
% stats (per timestep, NEE)
u = mean(minPSI_Default_S_NEE,2);% mean
t = median(minPSI_Default_S_NEE,2);% median
s = quantile(minPSI_Default_S_NEE,0.25,2);% Q1
r = quantile(minPSI_Default_S_NEE,0.75,2);% Q3
minPSI_Default_S_MaxNEE = max(minPSI_Default_S_NEE,[],2);% max
minPSI_Default_S_MinNEE = min(minPSI_Default_S_NEE,[],2);% min
q = std(minPSI_Default_S_NEE,0,2);% std dev

% Combined
minPSI_Default_ALL_SR = horzcat(minPSI_Default_J_SR, minPSI_Default_S_SR);
minPSI_Default_ALL_NEE = horzcat(minPSI_Default_J_NEE, minPSI_Default_S_NEE);
% stats (per timestep)
l_r = mean(minPSI_Default_S_SR,2);% mean
m_r = median(minPSI_Default_S_SR,2);% median
n_r = quantile(minPSI_Default_S_SR,0.25,2);% Q1
o_r = quantile(minPSI_Default_S_SR,0.75,2);% Q3
p_r = max(minPSI_Default_S_SR,[],2);% max
q_r = min(minPSI_Default_S_SR,[],2);% min
r_r = std(minPSI_Default_S_SR,0,2);% std dev
% stats (per timestep)
l_n = mean(minPSI_Default_S_NEE,2);% mean
m_n = median(minPSI_Default_S_NEE,2);% median
n_n = quantile(minPSI_Default_S_NEE,0.25,2);% Q1
o_n = quantile(minPSI_Default_S_NEE,0.75,2);% Q3
p_n = max(minPSI_Default_S_NEE,[],2);% max
q_n = min(minPSI_Default_S_NEE,[],2);% min
r_n = std(minPSI_Default_S_NEE,0,2);% std dev

% create timetables
minPSI_Default_J = timetable(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM,...
    Q1025_1500CT_Daily.SoilResp_CLM,Q1050_1500CT_Daily.SoilResp_CLM,Q1075_1500CT_Daily.SoilResp_CLM,...
    a,b,c,d,minPSI_Default_J_MaxSR,minPSI_Default_J_MinSR,g, ... %Soil Resp    
    Run0_1500CT_Daily.NEE_CLM,Q1025_1500CT_Daily.NEE_CLM,Q1050_1500CT_Daily.NEE_CLM,Q1075_1500CT_Daily.NEE_CLM,...
    z,y,x,w,minPSI_Default_J_MaxNEE,minPSI_Default_J_MinNEE,v); % NEE
clear a b c d g z y x w v

minPSI_Default_S = timetable(Sturm_1500CT_Daily.Time,Sturm_1500CT_Daily.SoilResp_CLM,...
    Sturm_Q1025_1500CT_Daily.SoilResp_CLM,Sturm_Q1050_1500CT_Daily.SoilResp_CLM,Sturm_Q1075_1500CT_Daily.SoilResp_CLM,...
    e,f,h,j,minPSI_Default_S_MaxSR,minPSI_Default_S_MinSR,k, ... % Soil Resp
    Sturm_1500CT_Daily.NEE_CLM,Sturm_Q1025_1500CT_Daily.NEE_CLM,Sturm_Q1050_1500CT_Daily.NEE_CLM,Sturm_Q1075_1500CT_Daily.NEE_CLM,...
    u,s,t,r,minPSI_Default_S_MaxNEE,minPSI_Default_S_MinNEE,q); % NEE
clear e f h j k q r s t u 

minPSI_Default_ALL = timetable(Run0_1500CT_Daily.Time, Run0_1500CT_Daily.SoilResp_CLM,...
    Q1025_1500CT_Daily.SoilResp_CLM,Q1050_1500CT_Daily.SoilResp_CLM,Q1075_1500CT_Daily.SoilResp_CLM,...
    Sturm_1500CT_Daily.SoilResp_CLM,Sturm_Q1025_1500CT_Daily.SoilResp_CLM,...
    Sturm_Q1050_1500CT_Daily.SoilResp_CLM,Sturm_Q1075_1500CT_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r, ... % Soil Resp
    Run0_1500CT_Daily.NEE_CLM,Q1025_1500CT_Daily.NEE_CLM,Q1050_1500CT_Daily.NEE_CLM,Q1075_1500CT_Daily.NEE_CLM,...
    Sturm_1500CT_Daily.NEE_CLM,Sturm_Q1025_1500CT_Daily.NEE_CLM,Sturm_Q1050_1500CT_Daily.NEE_CLM,Sturm_Q1075_1500CT_Daily.NEE_CLM,...
    l_n,m_n,n_n,o_n,p_n,q_n,r_n); % NEE
clear l_r m_r n_r o_r p_r q_r r_r l_n m_n n_n o_n p_n q_n r_n

% rename variables
minPSI_Default_J.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_Default_J.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_Default_J.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_Default_J.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_Default_J.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_Default_J.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_Default_J.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_Default_J.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_Default_J.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_Default_J.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_Default_J.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_Default_J.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_Default_J.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_Default_J.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_Default_J.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_Default_J.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_Default_J_MaxSR = rot90(minPSI_Default_J_MaxSR);
minPSI_Default_J_MinSR = rot90(minPSI_Default_J_MinSR);
minPSI_Default_J_MaxNEE = rot90(minPSI_Default_J_MaxNEE);
minPSI_Default_J_MinNEE = rot90(minPSI_Default_J_MinNEE);

minPSI_Default_S.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_Default_S.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_Default_S.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_Default_S.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_Default_S.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_Default_S.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_Default_S.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_Default_S.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_Default_S.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_Default_S.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_Default_S.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_Default_S.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_Default_S.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_Default_S.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_Default_S.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_Default_S.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_Default_S_MaxSR = rot90(minPSI_Default_S_MaxSR);
minPSI_Default_S_MinSR = rot90(minPSI_Default_S_MinSR);
minPSI_Default_S_MaxNEE = rot90(minPSI_Default_S_MaxNEE);
minPSI_Default_S_MinNEE = rot90(minPSI_Default_S_MinNEE);

minPSI_Default_ALL.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_Default_ALL.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_Default_ALL.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_Default_ALL.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_Default_ALL.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_Default_ALL.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_Default_ALL.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_Default_ALL.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_Default_ALL.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_Default_ALL.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';

% min Ψ -20
% Jordan
minPSI_20_J_SR = horzcat(minPSI20_1500CT_Daily.SoilResp_CLM,minPSI20_Q1025_Daily.SoilResp_CLM,minPSI20_Q1050_Daily.SoilResp_CLM,minPSI20_Q1075_Daily.SoilResp_CLM); %SR
minPSI_20_J_NEE = horzcat(minPSI20_1500CT_Daily.NEE_CLM,minPSI20_Q1025_Daily.NEE_CLM,minPSI20_Q1050_Daily.NEE_CLM,minPSI20_Q1075_Daily.NEE_CLM); %NEE
% stats (per timestep, SR)
a = mean(minPSI_20_J_SR,2);% mean
b = median(minPSI_20_J_SR,2);% median
c = quantile(minPSI_20_J_SR,0.25,2);% Q1
d = quantile(minPSI_20_J_SR,0.75,2);% Q3
minPSI_20_J_MaxSR = max(minPSI_20_J_SR,[],2);% max
minPSI_20_J_MinSR = min(minPSI_20_J_SR,[],2);% min
g = std(minPSI_20_J_SR,0,2);% std dev
% stats (per timestep, NEE)
z = mean(minPSI_20_J_NEE,2);% mean
y = median(minPSI_20_J_NEE,2);% median
x = quantile(minPSI_20_J_NEE,0.25,2);% Q1
w = quantile(minPSI_20_J_NEE,0.75,2);% Q3
minPSI_20_J_MaxNEE = max(minPSI_20_J_NEE,[],2);% max
minPSI_20_J_MinNEE = min(minPSI_20_J_NEE,[],2);% min
v = std(minPSI_20_J_NEE,0,2);% std dev

% Sturm
minPSI_20_S_SR = horzcat(Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM);
minPSI_20_S_NEE = horzcat(Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM);
% stats (per timestep, SR)
e = mean(minPSI_20_S_SR,2);% mean
f = median(minPSI_20_S_SR,2);% median
h = quantile(minPSI_20_S_SR,0.25,2);% Q1
j = quantile(minPSI_20_S_SR,0.75,2);% Q3
minPSI_20_S_MaxSR = max(minPSI_20_S_SR,[],2);% max
minPSI_20_S_MinSR = min(minPSI_20_S_SR,[],2);% min
k = std(minPSI_20_S_SR,0,2);% std dev
% stats (per timestep, NEE)
u = mean(minPSI_20_S_NEE,2);% mean
t = median(minPSI_20_S_NEE,2);% median
s = quantile(minPSI_20_S_NEE,0.25,2);% Q1
q = quantile(minPSI_20_S_NEE,0.75,2);% Q3
minPSI_20_S_MaxNEE = max(minPSI_20_S_NEE,[],2);% max
minPSI_20_S_MinNEE = min(minPSI_20_S_NEE,[],2);% min
r = std(minPSI_20_S_NEE,0,2);% std dev

% Combined
minPSI_20_ALL_SR = horzcat(minPSI_20_J_SR, minPSI_20_S_SR);
minPSI_20_ALL_NEE = horzcat(minPSI_20_J_NEE, minPSI_20_S_NEE);
% stats (per timestep, SR)
l_r = mean(minPSI_20_S_SR,2);% mean
m_r = median(minPSI_20_S_SR,2);% median
n_r = quantile(minPSI_20_S_SR,0.25,2);% Q1
o_r = quantile(minPSI_20_S_SR,0.75,2);% Q3
p_r = max(minPSI_20_S_SR,[],2);% max
q_r = min(minPSI_20_S_SR,[],2);% min
r_r = std(minPSI_20_S_SR,0,2);% std dev
% stats (per timestep, NEE)
l_n = mean(minPSI_20_S_NEE,2);% mean
m_n = median(minPSI_20_S_NEE,2);% median
n_n = quantile(minPSI_20_S_NEE,0.25,2);% Q1
o_n = quantile(minPSI_20_S_NEE,0.75,2);% Q3
p_n = max(minPSI_20_S_NEE,[],2);% max
q_n = min(minPSI_20_S_NEE,[],2);% min
r_n = std(minPSI_20_S_NEE,0,2);% std dev

% create timetables
minPSI_20_J = timetable(minPSI20_1500CT_Daily.Time,minPSI20_1500CT_Daily.SoilResp_CLM,minPSI20_Q1025_Daily.SoilResp_CLM,...
    minPSI20_Q1050_Daily.SoilResp_CLM,minPSI20_Q1075_Daily.SoilResp_CLM,a,b,c,d,minPSI_20_J_MaxSR,minPSI_20_J_MinSR,g, ... % Soil Resp
    minPSI20_1500CT_Daily.NEE_CLM,minPSI20_Q1025_Daily.NEE_CLM,minPSI20_Q1050_Daily.NEE_CLM,minPSI20_Q1075_Daily.NEE_CLM,...
    z,y,x,w,minPSI_20_J_MaxNEE,minPSI_20_J_MinNEE,v); %NEE
clear a b c d g v w x y z

minPSI_20_S = timetable(Sturm_minPSI20_1500CT_Daily.Time,Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM,e,f,h,j,minPSI_20_S_MaxSR,minPSI_20_S_MinSR,k, ... % Soil Resp
    Sturm_minPSI20_1500CT_Daily.NEE_CLM,Sturm_minPSI20_Q1025_Daily.NEE_CLM,Sturm_minPSI20_Q1050_Daily.NEE_CLM,Sturm_minPSI20_Q1075_Daily.NEE_CLM,...
    u,t,s,q,minPSI_20_S_MaxSR,minPSI_20_S_MinSR,r); %NEE
clear e f h j k q r s t u 

minPSI_20_ALL = timetable(Sturm_minPSI20_1500CT_Daily.Time,minPSI20_1500CT_Daily.SoilResp_CLM,minPSI20_Q1025_Daily.SoilResp_CLM,...
    minPSI20_Q1050_Daily.SoilResp_CLM,minPSI20_Q1075_Daily.SoilResp_CLM,...
    Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r, ... % Soil Resp
    minPSI20_1500CT_Daily.NEE_CLM,minPSI20_Q1025_Daily.NEE_CLM,...
    minPSI20_Q1050_Daily.NEE_CLM,minPSI20_Q1075_Daily.NEE_CLM,...
    Sturm_minPSI20_1500CT_Daily.NEE_CLM,Sturm_minPSI20_Q1025_Daily.NEE_CLM,...
    Sturm_minPSI20_Q1050_Daily.NEE_CLM,Sturm_minPSI20_Q1075_Daily.NEE_CLM,l_n,m_n,n_n,o_n,p_n,q_n,r_n); % NEE
clear l_r m_r n_r o_r p_r q_r r_r l_n m_n n_n o_n p_n q_n r_n

% rename variables
minPSI_20_J.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_20_J.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_20_J.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_20_J.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_20_J.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_20_J.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_20_J.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_20_J.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_20_J.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_20_J.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_20_J.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_20_J.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_20_J.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_20_J.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_20_J.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_20_J.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_20_J_MaxSR = rot90(minPSI_20_J_MaxSR);
minPSI_20_J_MinSR = rot90(minPSI_20_J_MinSR);
minPSI_20_J_MaxNEE = rot90(minPSI_20_J_MaxNEE);
minPSI_20_J_MinNEE = rot90(minPSI_20_J_MinNEE);

minPSI_20_S.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_20_S.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_20_S.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_20_S.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_20_S.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_20_S.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_20_S.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_20_S.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_20_S.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_20_S.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_20_S.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_20_S.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_20_S.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_20_S.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_20_S.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_20_S.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_20_S_MaxSR = rot90(minPSI_20_S_MaxSR);
minPSI_20_S_MinSR = rot90(minPSI_20_S_MinSR);
minPSI_20_S_MaxNEE = rot90(minPSI_20_S_MaxNEE);
minPSI_20_S_MinNEE = rot90(minPSI_20_S_MinNEE);

minPSI_20_ALL.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_20_ALL.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_20_ALL.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_20_ALL.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_20_ALL.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_20_ALL.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_20_ALL.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_20_ALL.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_20_ALL.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_20_ALL.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';

% min Ψ -200
% Jordan
minPSI_200_J_SR = horzcat(minPSI200_1500CT_Daily.SoilResp_CLM,minPSI200_Q1025_Daily.SoilResp_CLM,minPSI200_Q1050_Daily.SoilResp_CLM,minPSI200_Q1075_Daily.SoilResp_CLM); %SR
minPSI_200_J_NEE = horzcat(minPSI200_1500CT_Daily.NEE_CLM,minPSI200_Q1025_Daily.NEE_CLM,minPSI200_Q1050_Daily.NEE_CLM,minPSI200_Q1075_Daily.NEE_CLM); %NEE
% stats (per timestep, SR)
a = mean(minPSI_200_J_SR,2);% mean
b = median(minPSI_200_J_SR,2);% median
c = quantile(minPSI_200_J_SR,0.25,2);% Q1
d = quantile(minPSI_200_J_SR,0.75,2);% Q3
minPSI_200_J_MaxSR = max(minPSI_200_J_SR,[],2);% max
minPSI_200_J_MinSR = min(minPSI_200_J_SR,[],2);% min
g = std(minPSI_200_J_SR,0,2);% std dev
% stats (per timestep, NEE)
z = mean(minPSI_200_J_NEE,2);% mean
y = median(minPSI_200_J_NEE,2);% median
x = quantile(minPSI_200_J_NEE,0.25,2);% Q1
w = quantile(minPSI_200_J_NEE,0.75,2);% Q3
minPSI_200_J_MaxNEE = max(minPSI_200_J_NEE,[],2);% max
minPSI_200_J_MinNEE = min(minPSI_200_J_NEE,[],2);% min
v = std(minPSI_200_J_NEE,0,2);% std dev

% Sturm
minPSI_200_S_SR = horzcat(Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM);
minPSI_200_S_NEE = horzcat(Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM);
% stats (per timestep, SR)
e = mean(minPSI_200_S_SR,2);% mean
f = median(minPSI_200_S_SR,2);% median
h = quantile(minPSI_200_S_SR,0.25,2);% Q1
j = quantile(minPSI_200_S_SR,0.75,2);% Q3
minPSI_200_S_MaxSR = max(minPSI_200_S_SR,[],2);% max
minPSI_200_S_MinSR = min(minPSI_200_S_SR,[],2);% min
k = std(minPSI_200_S_SR,0,2);% std dev
% stats (per timestep, NEE)
u = mean(minPSI_200_S_NEE,2);% mean
t = median(minPSI_200_S_NEE,2);% median
s = quantile(minPSI_200_S_NEE,0.25,2);% Q1
q = quantile(minPSI_200_S_NEE,0.75,2);% Q3
minPSI_200_S_MaxNEE = max(minPSI_200_S_NEE,[],2);% max
minPSI_200_S_MinNEE = min(minPSI_200_S_NEE,[],2);% min
r = std(minPSI_200_S_NEE,0,2);% std dev

% Combined
minPSI_200_ALL_SR = horzcat(minPSI_200_J_SR, minPSI_200_S_SR);
minPSI_200_ALL_NEE = horzcat(minPSI_200_J_NEE, minPSI_200_S_NEE);
% stats (per timestep, SR)
l_r = mean(minPSI_200_S_SR,2);% mean
m_r = median(minPSI_200_S_SR,2);% median
n_r = quantile(minPSI_200_S_SR,0.25,2);% Q1
o_r = quantile(minPSI_200_S_SR,0.75,2);% Q3
p_r = max(minPSI_200_S_SR,[],2);% max
q_r = min(minPSI_200_S_SR,[],2);% min
r_r = std(minPSI_200_S_SR,0,2);% std dev
% stats (per timestep, NEE)
l_n = mean(minPSI_200_S_NEE,2);% mean
m_n = median(minPSI_200_S_NEE,2);% median
n_n = quantile(minPSI_200_S_NEE,0.25,2);% Q1
o_n = quantile(minPSI_200_S_NEE,0.75,2);% Q3
p_n = max(minPSI_200_S_NEE,[],2);% max
q_n = min(minPSI_200_S_NEE,[],2);% min
r_n = std(minPSI_200_S_NEE,0,2);% std dev

% create timetables
minPSI_200_J = timetable(minPSI200_1500CT_Daily.Time,minPSI200_1500CT_Daily.SoilResp_CLM,minPSI200_Q1025_Daily.SoilResp_CLM,...
    minPSI200_Q1050_Daily.SoilResp_CLM,minPSI200_Q1075_Daily.SoilResp_CLM,a,b,c,d,minPSI_200_J_MaxSR,minPSI_200_J_MinSR,g, ... % Soil Resp
    minPSI200_1500CT_Daily.NEE_CLM,minPSI200_Q1025_Daily.NEE_CLM,minPSI200_Q1050_Daily.NEE_CLM,minPSI200_Q1075_Daily.NEE_CLM,...
    z,y,x,w,minPSI_200_J_MaxNEE,minPSI_200_J_MinNEE,v); %NEE
clear a b c d g v w x y z

minPSI_200_S = timetable(Sturm_minPSI200_1500CT_Daily.Time,Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM,e,f,h,j,minPSI_200_S_MaxSR,minPSI_200_S_MinSR,k, ... % Soil Resp
    Sturm_minPSI200_1500CT_Daily.NEE_CLM,Sturm_minPSI200_Q1025_Daily.NEE_CLM,Sturm_minPSI200_Q1050_Daily.NEE_CLM,Sturm_minPSI200_Q1075_Daily.NEE_CLM,...
    u,t,s,q,minPSI_200_S_MaxSR,minPSI_200_S_MinSR,r); %NEE
clear e f h j k q r s t u 

minPSI_200_ALL = timetable(Sturm_minPSI200_1500CT_Daily.Time,minPSI200_1500CT_Daily.SoilResp_CLM,minPSI200_Q1025_Daily.SoilResp_CLM,...
    minPSI200_Q1050_Daily.SoilResp_CLM,minPSI200_Q1075_Daily.SoilResp_CLM,...
    Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r, ... % Soil Resp
    minPSI200_1500CT_Daily.NEE_CLM,minPSI200_Q1025_Daily.NEE_CLM,...
    minPSI200_Q1050_Daily.NEE_CLM,minPSI200_Q1075_Daily.NEE_CLM,...
    Sturm_minPSI200_1500CT_Daily.NEE_CLM,Sturm_minPSI200_Q1025_Daily.NEE_CLM,...
    Sturm_minPSI200_Q1050_Daily.NEE_CLM,Sturm_minPSI200_Q1075_Daily.NEE_CLM,l_n,m_n,n_n,o_n,p_n,q_n,r_n); % NEE
clear l_r m_r n_r o_r p_r q_r r_r l_n m_n n_n o_n p_n q_n r_n

% rename variables
minPSI_200_J.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_200_J.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_200_J.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_200_J.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_200_J.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_200_J.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_200_J.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_200_J.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_200_J.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_200_J.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_200_J.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_200_J.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_200_J.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_200_J.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_200_J.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_200_J.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_200_J_MaxSR = rot90(minPSI_200_J_MaxSR);
minPSI_200_J_MinSR = rot90(minPSI_200_J_MinSR);
minPSI_200_J_MaxNEE = rot90(minPSI_200_J_MaxNEE);
minPSI_200_J_MinNEE = rot90(minPSI_200_J_MinNEE);

minPSI_200_S.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_200_S.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_200_S.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_200_S.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_200_S.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_200_S.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_200_S.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_200_S.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_200_S.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_200_S.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_200_S.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_200_S.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_200_S.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_200_S.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_200_S.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_200_S.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_200_S_MaxSR = rot90(minPSI_200_S_MaxSR);
minPSI_200_S_MinSR = rot90(minPSI_200_S_MinSR);
minPSI_200_S_MaxNEE = rot90(minPSI_200_S_MaxNEE);
minPSI_200_S_MinNEE = rot90(minPSI_200_S_MinNEE);

minPSI_200_ALL.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_200_ALL.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_200_ALL.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_200_ALL.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_200_ALL.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_200_ALL.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_200_ALL.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_200_ALL.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_200_ALL.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_200_ALL.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';

% min Ψ -2000
% Jordan
minPSI_2000_J_SR = horzcat(minPSI2000_1500CT_Daily.SoilResp_CLM,minPSI2000_Q1025_Daily.SoilResp_CLM,minPSI2000_Q1050_Daily.SoilResp_CLM,minPSI2000_Q1075_Daily.SoilResp_CLM);
minPSI_2000_J_NEE = horzcat(minPSI2000_1500CT_Daily.NEE_CLM,minPSI2000_Q1025_Daily.NEE_CLM,minPSI2000_Q1050_Daily.NEE_CLM,minPSI2000_Q1075_Daily.NEE_CLM);
% stats (per timestep, SR)
a = mean(minPSI_2000_J_SR,2);% mean
b = median(minPSI_2000_J_SR,2);% median
c = quantile(minPSI_2000_J_SR,0.25,2);% Q1
d = quantile(minPSI_2000_J_SR,0.75,2);% Q3
minPSI_2000_J_MaxSR = max(minPSI_2000_J_SR,[],2);% max
minPSI_2000_J_MinSR = min(minPSI_2000_J_SR,[],2);% min
g = std(minPSI_2000_J_SR,0,2);% std dev
% stats (per timestep, NEE)
z = mean(minPSI_2000_J_NEE,2);% mean
y = median(minPSI_2000_J_NEE,2);% median
x = quantile(minPSI_2000_J_NEE,0.25,2);% Q1
w = quantile(minPSI_2000_J_NEE,0.75,2);% Q3
minPSI_2000_J_MaxNEE = max(minPSI_2000_J_NEE,[],2);% max
minPSI_2000_J_MinNEE = min(minPSI_2000_J_NEE,[],2);% min
v = std(minPSI_2000_J_NEE,0,2);% std dev

% Sturm
minPSI_2000_S_SR = horzcat(Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM);
minPSI_2000_S_NEE = horzcat(Sturm_minPSI2000_1500CT_Daily.NEE_CLM,Sturm_minPSI2000_Q1025_Daily.NEE_CLM,Sturm_minPSI2000_Q1050_Daily.NEE_CLM,Sturm_minPSI2000_Q1075_Daily.NEE_CLM);
% stats (per timestep, SR)
e = mean(minPSI_2000_S_SR,2);% mean
f = median(minPSI_2000_S_SR,2);% median
h = quantile(minPSI_2000_S_SR,0.25,2);% Q1
j = quantile(minPSI_2000_S_SR,0.75,2);% Q3
minPSI_2000_S_MaxSR = max(minPSI_2000_S_SR,[],2);% max
minPSI_2000_S_MinSR = min(minPSI_2000_S_SR,[],2);% min
k = std(minPSI_2000_S_SR,0,2);% std dev
% stats (per timestep, NEE)
u = mean(minPSI_2000_S_NEE,2);% mean
t = median(minPSI_2000_S_NEE,2);% median
s = quantile(minPSI_2000_S_NEE,0.25,2);% Q1
r = quantile(minPSI_2000_S_NEE,0.75,2);% Q3
minPSI_2000_S_MaxNEE = max(minPSI_2000_S_NEE,[],2);% max
minPSI_2000_S_MinNEE = min(minPSI_2000_S_NEE,[],2);% min
q = std(minPSI_2000_S_NEE,0,2);% std dev

% Combined
minPSI_2000_ALL_SR = horzcat(minPSI_2000_J_SR, minPSI_2000_S_SR);
minPSI_2000_ALL_NEE = horzcat(minPSI_2000_J_NEE, minPSI_2000_S_NEE);
% stats (per timestep, SR)
l_r = mean(minPSI_2000_S_SR,2);% mean
m_r = median(minPSI_2000_S_SR,2);% median
n_r = quantile(minPSI_2000_S_SR,0.25,2);% Q1
o_r = quantile(minPSI_2000_S_SR,0.75,2);% Q3
p_r = max(minPSI_2000_S_SR,[],2);% max
q_r = min(minPSI_2000_S_SR,[],2);% min
r_r = std(minPSI_2000_S_SR,0,2);% std dev
% stats (per timestep, NEE)
l_n = mean(minPSI_2000_S_NEE,2);% mean
m_n = median(minPSI_2000_S_NEE,2);% median
n_n = quantile(minPSI_2000_S_NEE,0.25,2);% Q1
o_n = quantile(minPSI_2000_S_NEE,0.75,2);% Q3
p_n = max(minPSI_2000_S_NEE,[],2);% max
q_n = min(minPSI_2000_S_NEE,[],2);% min
r_n = std(minPSI_2000_S_NEE,0,2);% std dev

% create timetables
minPSI_2000_J = timetable(minPSI2000_1500CT_Daily.Time,minPSI2000_1500CT_Daily.SoilResp_CLM,minPSI2000_Q1025_Daily.SoilResp_CLM,...
    minPSI2000_Q1050_Daily.SoilResp_CLM,minPSI2000_Q1075_Daily.SoilResp_CLM,a,b,c,d,minPSI_2000_J_MaxSR,minPSI_2000_J_MinSR,g,... % Soil Resp
    minPSI2000_1500CT_Daily.NEE_CLM,minPSI2000_Q1025_Daily.NEE_CLM,minPSI2000_Q1050_Daily.NEE_CLM,minPSI2000_Q1075_Daily.NEE_CLM,...
    z,y,x,w,minPSI_2000_J_MaxSR,minPSI_2000_J_MinSR,v); % NEE
clear a b c d g z y x w v

minPSI_2000_S = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM,e,f,h,j,minPSI_2000_S_MaxSR,minPSI_2000_S_MinSR,k,... % Soil Resp
    Sturm_minPSI2000_1500CT_Daily.NEE_CLM,Sturm_minPSI2000_Q1025_Daily.NEE_CLM,...
    Sturm_minPSI2000_Q1050_Daily.NEE_CLM,Sturm_minPSI2000_Q1075_Daily.NEE_CLM,u,t,s,r,minPSI_2000_S_MaxNEE,minPSI_2000_S_MinNEE,q); % NEE
clear e f h j k u t s r q

minPSI_2000_ALL = timetable(Sturm_minPSI2000_1500CT_Daily.Time,minPSI2000_1500CT_Daily.SoilResp_CLM,minPSI2000_Q1025_Daily.SoilResp_CLM,...
    minPSI2000_Q1050_Daily.SoilResp_CLM,minPSI2000_Q1075_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r, ... % Soil Resp
    minPSI2000_1500CT_Daily.NEE_CLM,minPSI2000_Q1025_Daily.NEE_CLM,minPSI2000_Q1050_Daily.NEE_CLM,minPSI2000_Q1075_Daily.NEE_CLM,...
    Sturm_minPSI2000_1500CT_Daily.NEE_CLM,Sturm_minPSI2000_Q1025_Daily.NEE_CLM,...
    Sturm_minPSI2000_Q1050_Daily.NEE_CLM,Sturm_minPSI2000_Q1075_Daily.NEE_CLM,l_n,m_n,n_n,o_n,p_n,q_n,r_n);
clear l_r m_r n_r o_r p_r q_r r_r l_n m_n n_n o_n p_n q_n r_n

% rename variables
minPSI_2000_J.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_2000_J.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_2000_J.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_2000_J.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_2000_J.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_2000_J.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_2000_J.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_2000_J.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_2000_J.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_2000_J.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_2000_J.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_2000_J.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_2000_J.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_2000_J.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_2000_J.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_2000_J.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_2000_J_MaxSR = rot90(minPSI_2000_J_MaxSR);
minPSI_2000_J_MinSR = rot90(minPSI_2000_J_MinSR);
minPSI_2000_J_MaxNEE = rot90(minPSI_2000_J_MaxNEE);
minPSI_2000_J_MinNEE = rot90(minPSI_2000_J_MinNEE);

minPSI_2000_S.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_2000_S.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_2000_S.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_2000_S.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_2000_S.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_2000_S.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_2000_S.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_2000_S.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_2000_S.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_2000_S.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_2000_S.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_2000_S.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_2000_S.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_2000_S.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_2000_S.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_2000_S.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';
minPSI_2000_S_MaxSR = rot90(minPSI_2000_S_MaxSR);
minPSI_2000_S_MinSR = rot90(minPSI_2000_S_MinSR);
minPSI_2000_S_MaxNEE = rot90(minPSI_2000_S_MaxNEE);
minPSI_2000_S_MinNEE = rot90(minPSI_2000_S_MinNEE);

minPSI_2000_ALL.Properties.VariableNames{1} = 'SoilResp_Q10_1.5';
minPSI_2000_ALL.Properties.VariableNames{2} = 'SoilResp_Q10_2.5';
minPSI_2000_ALL.Properties.VariableNames{3} = 'SoilResp_Q10_5';
minPSI_2000_ALL.Properties.VariableNames{4} = 'SoilResp_Q10_7.5';
minPSI_2000_ALL.Properties.VariableNames{5} = 'MeanSoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{6} = 'MedianSoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{7} = 'Q1SoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{8} = 'Q3SoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{9} = 'MaxSoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{10} = 'MinSoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{12} = 'NEE_Q10_1.5';
minPSI_2000_ALL.Properties.VariableNames{13} = 'NEE_Q10_2.5';
minPSI_2000_ALL.Properties.VariableNames{14} = 'NEE_Q10_5';
minPSI_2000_ALL.Properties.VariableNames{15} = 'NEE_Q10_7.5';
minPSI_2000_ALL.Properties.VariableNames{16} = 'MeanNEE_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{17} = 'MedianNEE_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{18} = 'Q1NEE_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{19} = 'Q3NEE_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{20} = 'MaxNEE_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{21} = 'MinNEE_ALLQ10';
minPSI_2000_ALL.Properties.VariableNames{22} = 'StdDev_MeanNEE_ALLQ10';

%% Stats per Q10 values (Daily Res)

% default Q10
%Jordan
Q10_Default_J = horzcat(Run0_1500CT_Daily.SoilResp_CLM,minPSI20_1500CT_Daily.SoilResp_CLM,minPSI200_1500CT_Daily.SoilResp_CLM,minPSI2000_1500CT_Daily.SoilResp_CLM);
% stats (per timestep)
a = mean(Q10_Default_J,2);% mean
b = median(Q10_Default_J,2);% median
c = quantile(Q10_Default_J,0.25,2);% Q1
d = quantile(Q10_Default_J,0.75,2);% Q3
Q10_Default_J_MaxSR = max(Q10_Default_J,[],2);% max
Q10_Default_J_MinSR = min(Q10_Default_J,[],2);% min
g = std(Q10_Default_J,0,2);% std dev

%Sturm
Q10_Default_S = horzcat(Sturm_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM);
% stats (per timestep)
e = mean(Q10_Default_S,2);% mean
f = median(Q10_Default_S,2);% median
h = quantile(Q10_Default_S,0.25,2);% Q1
j = quantile(Q10_Default_S,0.75,2);% Q3
Q10_Default_S_MaxSR = max(Q10_Default_S,[],2);% max
Q10_Default_S_MinSR = min(Q10_Default_S,[],2);% min
k = std(Q10_Default_S,0,2);% std dev

% Combined
Q10_Default_ALL = horzcat(Q10_Default_J, Q10_Default_S);
% stats (per timestep)
l_r = mean(Q10_Default_S,2);% mean
m_r = median(Q10_Default_S,2);% median
n_r = quantile(Q10_Default_S,0.25,2);% Q1
o_r = quantile(Q10_Default_S,0.75,2);% Q3
p_r = max(Q10_Default_S,[],2);% max
q_r = min(Q10_Default_S,[],2);% min
r_r = std(Q10_Default_S,0,2);% std dev

% create timetables
Q10_Default_J = timetable(Run0_1500CT_Daily.Time,Run0_1500CT_Daily.SoilResp_CLM,minPSI20_1500CT_Daily.SoilResp_CLM,minPSI200_1500CT_Daily.SoilResp_CLM,...
    minPSI2000_1500CT_Daily.SoilResp_CLM, a,b,c,d,Q10_Default_J_MaxSR,Q10_Default_J_MinSR,g);
clear a b c d g

Q10_Default_S = timetable(Sturm_1500CT_Daily.Time,Sturm_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM,e,f,h,j,Q10_Default_S_MaxSR,Q10_Default_S_MinSR,k);
clear e f h j k 

Q10_Default_ALL = timetable(Run0_1500CT_Daily.Time,Run0_1500CT_Daily.SoilResp_CLM,minPSI20_1500CT_Daily.SoilResp_CLM,minPSI200_1500CT_Daily.SoilResp_CLM,...
    minPSI2000_1500CT_Daily.SoilResp_CLM, Sturm_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_1500CT_Daily.SoilResp_CLM,Sturm_minPSI200_1500CT_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_1500CT_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r);
clear l m n o p q r

% rename variables
Q10_Default_J.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_Default_J.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_Default_J.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_Default_J.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_Default_J.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_Default_J.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_Default_J.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_Default_J.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_Default_J.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_Default_J.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_Default_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_Default_J_MaxSR = rot90(Q10_Default_J_MaxSR);
Q10_Default_J_MinSR = rot90(Q10_Default_J_MinSR);

Q10_Default_S.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_Default_S.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_Default_S.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_Default_S.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_Default_S.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_Default_S.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_Default_S.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_Default_S.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_Default_S.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_Default_S.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_Default_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_Default_S_MaxSR = rot90(Q10_Default_S_MaxSR);
Q10_Default_S_MinSR = rot90(Q10_Default_S_MinSR);

Q10_Default_ALL.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_Default_ALL.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_Default_ALL.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_Default_ALL.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_Default_ALL.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_Default_ALL.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_Default_ALL.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_Default_ALL.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_Default_ALL.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_Default_ALL.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_Default_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

% Q10 = 2.5
% Jordan
Q10_25_J = horzcat(Q1025_1500CT_Daily.SoilResp_CLM,minPSI20_Q1025_Daily.SoilResp_CLM,minPSI200_Q1025_Daily.SoilResp_CLM,minPSI2000_Q1025_Daily.SoilResp_CLM);
% stats (per timestep)
a = mean(Q10_25_J,2);% mean
b = median(Q10_25_J,2);% median
c = quantile(Q10_25_J,0.25,2);% Q1
d = quantile(Q10_25_J,0.75,2);% Q3
Q10_25_J_MaxSR = max(Q10_25_J,[],2);% max
Q10_25_J_MinSR = min(Q10_25_J,[],2);% min
g = std(Q10_25_J,0,2);% std dev

% Sturm
Q10_25_S = horzcat(Sturm_Q1025_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM);
% stats (per timestep)
e = mean(Q10_25_S,2);% mean
f = median(Q10_25_S,2);% median
h = quantile(Q10_25_S,0.25,2);% Q1
j = quantile(Q10_25_S,0.75,2);% Q3
Q10_25_S_MaxSR = max(Q10_25_S,[],2);% max
Q10_25_S_MinSR = min(Q10_25_S,[],2);% min
k = std(Q10_25_S,0,2);% std dev

% Combined
Q10_25_ALL = horzcat(Q10_25_J, Q10_25_S);
% stats (per timestep)
l_r = mean(Q10_25_S,2);% mean
m_r = median(Q10_25_S,2);% median
n_r = quantile(Q10_25_S,0.25,2);% Q1
o_r = quantile(Q10_25_S,0.75,2);% Q3
p_r = max(Q10_25_S,[],2);% max
q_r = min(Q10_25_S,[],2);% min
r_r = std(Q10_25_S,0,2);% std dev

% create timetables
Q10_25_J = timetable(minPSI2000_1500CT_Daily.Time,Q1025_1500CT_Daily.SoilResp_CLM,minPSI20_Q1025_Daily.SoilResp_CLM,minPSI200_Q1025_Daily.SoilResp_CLM,...
    minPSI2000_Q1025_Daily.SoilResp_CLM,a,b,c,d,Q10_25_J_MaxSR,Q10_25_J_MinSR,g);
clear a b c d g

Q10_25_S = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Sturm_Q1025_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM, e,f,h,j,Q10_25_S_MaxSR,Q10_25_S_MinSR,k);
clear e f h j k

Q10_25_ALL = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Q1025_1500CT_Daily.SoilResp_CLM,minPSI20_Q1025_Daily.SoilResp_CLM,minPSI200_Q1025_Daily.SoilResp_CLM,...
    minPSI2000_Q1025_Daily.SoilResp_CLM,Sturm_Q1025_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1025_Daily.SoilResp_CLM,Sturm_minPSI200_Q1025_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1025_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r);
clear l m n o p q r

% rename variables
Q10_25_J.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_25_J.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_25_J.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_25_J.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_25_J.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_25_J.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_25_J.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_25_J.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_25_J.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_25_J.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_25_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_25_J_MaxSR = rot90(Q10_25_J_MaxSR);
Q10_25_J_MinSR = rot90(Q10_25_J_MinSR);

Q10_25_S.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_25_S.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_25_S.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_25_S.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_25_S.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_25_S.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_25_S.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_25_S.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_25_S.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_25_S.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_25_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_25_S_MaxSR = rot90(Q10_25_S_MaxSR);
Q10_25_S_MinSR = rot90(Q10_25_S_MinSR);

Q10_25_ALL.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_25_ALL.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_25_ALL.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_25_ALL.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_25_ALL.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_25_ALL.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_25_ALL.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_25_ALL.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_25_ALL.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_25_ALL.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_25_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

% Q10 = 5.0
% Jordan
Q10_50_J = horzcat(Q1050_1500CT_Daily.SoilResp_CLM,minPSI20_Q1050_Daily.SoilResp_CLM,minPSI200_Q1050_Daily.SoilResp_CLM,minPSI2000_Q1050_Daily.SoilResp_CLM);
% stats (per timestep)
a = mean(Q10_50_J,2);% mean
b = median(Q10_50_J,2);% median
c = quantile(Q10_50_J,0.25,2);% Q1
d = quantile(Q10_50_J,0.75,2);% Q3
Q10_50_J_MaxSR = max(Q10_50_J,[],2);% max
Q10_50_J_MinSR = min(Q10_50_J,[],2);% min
g = std(Q10_50_J,0,2);% std dev

% Sturm
Q10_50_S = horzcat(Sturm_Q1050_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM);
% stats (per timestep)
e = mean(Q10_50_S,2);% mean
f = median(Q10_50_S,2);% median
h = quantile(Q10_50_S,0.25,2);% Q1
j = quantile(Q10_50_S,0.75,2);% Q3
Q10_50_S_MaxSR = max(Q10_50_S,[],2);% max
Q10_50_S_MinSR = min(Q10_50_S,[],2);% min
k = std(Q10_50_S,0,2);% std dev

% Combined
Q10_50_ALL = horzcat(Q10_50_J, Q10_50_S);
% stats (per timestep)
l_r = mean(Q10_50_S,2);% mean
m_r = median(Q10_50_S,2);% median
n_r = quantile(Q10_50_S,0.25,2);% Q1
o_r = quantile(Q10_50_S,0.75,2);% Q3
p_r = max(Q10_50_S,[],2);% max
q_r = min(Q10_50_S,[],2);% min
r_r = std(Q10_50_S,0,2);% std dev

% create timetables
Q10_50_J = timetable(minPSI2000_1500CT_Daily.Time,Q1050_1500CT_Daily.SoilResp_CLM,minPSI20_Q1050_Daily.SoilResp_CLM,minPSI200_Q1050_Daily.SoilResp_CLM,...
    minPSI2000_Q1050_Daily.SoilResp_CLM,a,b,c,d,Q10_50_J_MaxSR,Q10_50_J_MinSR,g);
clear a b c d g

Q10_50_S = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Sturm_Q1050_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM,e,f,h,j,Q10_50_S_MaxSR,Q10_50_S_MinSR,k);
clear e f h j k

Q10_50_ALL = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Q1050_1500CT_Daily.SoilResp_CLM,minPSI20_Q1050_Daily.SoilResp_CLM,minPSI200_Q1050_Daily.SoilResp_CLM,...
    minPSI2000_Q1050_Daily.SoilResp_CLM,Sturm_Q1050_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1050_Daily.SoilResp_CLM,Sturm_minPSI200_Q1050_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1050_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r);
clear l m n o p q r

% rename variables
Q10_50_J.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_50_J.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_50_J.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_50_J.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_50_J.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_50_J.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_50_J.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_50_J.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_50_J.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_50_J.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_50_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_50_J_MaxSR = rot90(Q10_50_J_MaxSR);
Q10_50_J_MinSR = rot90(Q10_50_J_MinSR);

Q10_50_S.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_50_S.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_50_S.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_50_S.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_50_S.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_50_S.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_50_S.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_50_S.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_50_S.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_50_S.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_50_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_50_S_MaxSR = rot90(Q10_50_S_MaxSR);
Q10_50_S_MinSR = rot90(Q10_50_S_MinSR);

Q10_50_ALL.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_50_ALL.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_50_ALL.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_50_ALL.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_50_ALL.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_50_ALL.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_50_ALL.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_50_ALL.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_50_ALL.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_50_ALL.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_50_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

% Q10 = 7.5
% Jordan
Q10_75_J = horzcat(Q1075_1500CT_Daily.SoilResp_CLM,minPSI20_Q1075_Daily.SoilResp_CLM,minPSI200_Q1075_Daily.SoilResp_CLM,minPSI2000_Q1075_Daily.SoilResp_CLM);
% stats (per timestep)
a = mean(Q10_75_J,2);% mean
b = median(Q10_75_J,2);% median
c = quantile(Q10_75_J,0.25,2);% Q1
d = quantile(Q10_75_J,0.75,2);% Q3
Q10_75_J_MaxSR = max(Q10_75_J,[],2);% max
Q10_75_J_MinSR = min(Q10_75_J,[],2);% min
g = std(Q10_75_J,0,2);% std dev

% Sturm
Q10_75_S = horzcat(Sturm_Q1075_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM,Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM);
% stats (per timestep)
e = mean(Q10_75_S,2);% mean
f = median(Q10_75_S,2);% median
h = quantile(Q10_75_S,0.25,2);% Q1
j = quantile(Q10_75_S,0.75,2);% Q3
Q10_75_S_MaxSR = max(Q10_75_S,[],2);% max
Q10_75_S_MinSR = min(Q10_75_S,[],2);% min
k = std(Q10_75_S,0,2);% std dev

% Combined
Q10_75_ALL = horzcat(Q10_75_J, Q10_75_S);
% stats (per timestep)
l_r = mean(Q10_75_S,2);% mean
m_r = median(Q10_75_S,2);% median
n_r = quantile(Q10_75_S,0.25,2);% Q1
o_r = quantile(Q10_75_S,0.75,2);% Q3
p_r = max(Q10_75_S,[],2);% max
q_r = min(Q10_75_S,[],2);% min
r_r = std(Q10_75_S,0,2);% std dev

% create timetables
Q10_75_J = timetable(minPSI2000_1500CT_Daily.Time,Q1075_1500CT_Daily.SoilResp_CLM,minPSI20_Q1075_Daily.SoilResp_CLM,minPSI200_Q1075_Daily.SoilResp_CLM,...
    minPSI2000_Q1075_Daily.SoilResp_CLM,a,b,c,d,Q10_75_J_MaxSR,Q10_75_J_MinSR,g);
clear a b c d g

Q10_75_S = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Sturm_Q1075_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM,e,f,h,j,Q10_75_S_MaxSR,Q10_75_S_MinSR,k);
clear e f h j k

Q10_75_ALL = timetable(Sturm_minPSI2000_1500CT_Daily.Time,Q1075_1500CT_Daily.SoilResp_CLM,minPSI20_Q1075_Daily.SoilResp_CLM,minPSI200_Q1075_Daily.SoilResp_CLM,...
    minPSI2000_Q1075_Daily.SoilResp_CLM,Sturm_Q1075_1500CT_Daily.SoilResp_CLM,Sturm_minPSI20_Q1075_Daily.SoilResp_CLM,Sturm_minPSI200_Q1075_Daily.SoilResp_CLM,...
    Sturm_minPSI2000_Q1075_Daily.SoilResp_CLM,l_r,m_r,n_r,o_r,p_r,q_r,r_r);
clear l m n o p q r

% rename variables
Q10_75_J.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_75_J.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_75_J.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_75_J.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_75_J.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_75_J.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_75_J.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_75_J.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_75_J.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_75_J.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_75_J.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_75_J_MaxSR = rot90(Q10_75_J_MaxSR);
Q10_75_J_MinSR = rot90(Q10_75_J_MinSR);

Q10_75_S.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_75_S.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_75_S.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_75_S.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_75_S.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_75_S.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_75_S.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_75_S.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_75_S.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_75_S.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_75_S.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

Q10_75_S_MaxSR = rot90(Q10_75_S_MaxSR);
Q10_75_S_MinSR = rot90(Q10_75_S_MinSR);

Q10_75_ALL.Properties.VariableNames{1} = 'SoilResp_Ψmin_D';
Q10_75_ALL.Properties.VariableNames{2} = 'SoilResp_Ψmin_-20';
Q10_75_ALL.Properties.VariableNames{3} = 'SoilResp_Ψmin_-200';
Q10_75_ALL.Properties.VariableNames{4} = 'SoilResp_Ψmin_-2000';
Q10_75_ALL.Properties.VariableNames{5} = 'MeanSoilResp_AllPSImin';
Q10_75_ALL.Properties.VariableNames{6} = 'MedianSoilResp_AllPSImin';
Q10_75_ALL.Properties.VariableNames{7} = 'Q1SoilResp_AllPSImin';
Q10_75_ALL.Properties.VariableNames{8} = 'Q3SoilResp_AllPSImin';
Q10_75_ALL.Properties.VariableNames{9} = 'MaxSoilResp_AllPSImin';
Q10_75_ALL.Properties.VariableNames{10} = 'MinSoilResp_AllPSImin';
Q10_75_ALL.Properties.VariableNames{11} = 'StdDev_MeanSoilResp_AllPSImin';

%% ANOVA (Daily Res)

% Is Ψmin significant? > YES
minPSI_ANOVA_SR_1617 = reshape(MeanSnowSeasonResp_1617,[4,8]);% One column per Ψmin value
minPSI_ANOVA_SR_1617 = rot90(minPSI_ANOVA_SR_1617);
[p_minPSI_ANOVA_SR_1617,tbl_minPSI_ANOVA_SR_1617,stats_minPSI_ANOVA_SR_1617] = anova1(minPSI_ANOVA_SR_1617);
multcompare(stats_minPSI_ANOVA_SR_1617,'Alpha',0.001)

minPSI_ANOVA_SR_1718 = reshape(MeanSnowSeasonResp_1718,[4,8]);% One column per Ψmin value
minPSI_ANOVA_SR_1718 = rot90(minPSI_ANOVA_SR_1718);
[p_minPSI_ANOVA_SR_1718,tbl_minPSI_ANOVA_SR_1718,stats_minPSI_ANOVA_SR_1718] = anova1(minPSI_ANOVA_SR_1718);
multcompare(stats_minPSI_ANOVA_SR_1718,'Alpha',0.001)

minPSI_ANOVA_SR_1819 = reshape(MeanSnowSeasonResp_1819,[4,8]);% One column per Ψmin value
minPSI_ANOVA_SR_1819 = rot90(minPSI_ANOVA_SR_1819);
[p_minPSI_ANOVA_SR_1819,tbl_minPSI_ANOVA_SR_1819,stats_minPSI_ANOVA_SR_1819] = anova1(minPSI_ANOVA_SR_1819);
multcompare(stats_minPSI_ANOVA_SR_1819,'Alpha',0.001)

% Is Q10 significant? > No??? 
a = horzcat(MeanSnowSeasonResp_1617(1:4),MeanSnowSeasonResp_1617(17:20)); % Q10 = 1.5
b = horzcat(MeanSnowSeasonResp_1617(5:8),MeanSnowSeasonResp_1617(21:24)); % Q10 = 2.5
c = horzcat(MeanSnowSeasonResp_1617(9:12),MeanSnowSeasonResp_1617(25:28)); % Q10 = 5.0
d = horzcat(MeanSnowSeasonResp_1617(13:16),MeanSnowSeasonResp_1617(29:32)); % Q10 = 7.5
Q10_ANOVA_SR_1617 = vertcat(a,b,c,d); % One column per Q10 value
clear a b c d
Q10_ANOVA_SR_1617 = rot90(Q10_ANOVA_SR_1617);
[p_Q10_ANOVA_SR_1617,tbl_Q10_ANOVA_SR_1617,stats_Q10_ANOVA_SR_1617] = anova1(Q10_ANOVA_SR_1617);
multcompare(stats_Q10_ANOVA_SR_1617,'Alpha',0.001)

a = horzcat(MeanSnowSeasonResp_1718(1:4),MeanSnowSeasonResp_1718(17:20)); % Q10 = 1.5
b = horzcat(MeanSnowSeasonResp_1718(5:8),MeanSnowSeasonResp_1718(21:24)); % Q10 = 2.5
c = horzcat(MeanSnowSeasonResp_1718(9:12),MeanSnowSeasonResp_1718(25:28)); % Q10 = 5.0
d = horzcat(MeanSnowSeasonResp_1718(13:16),MeanSnowSeasonResp_1718(29:32)); % Q10 = 7.5
Q10_ANOVA_SR_1718 = vertcat(a,b,c,d); % One column per Q10 value
clear a b c d
Q10_ANOVA_SR_1718 = rot90(Q10_ANOVA_SR_1718);
[p_Q10_ANOVA_SR_1718,tbl_Q10_ANOVA_SR_1718,stats_Q10_ANOVA_SR_1718] = anova1(Q10_ANOVA_SR_1718);
multcompare(stats_Q10_ANOVA_SR_1718,'Alpha',0.001)

a = horzcat(MeanSnowSeasonResp_1819(1:4),MeanSnowSeasonResp_1819(17:20)); % Q10 = 1.5
b = horzcat(MeanSnowSeasonResp_1819(5:8),MeanSnowSeasonResp_1819(21:24)); % Q10 = 2.5
c = horzcat(MeanSnowSeasonResp_1819(9:12),MeanSnowSeasonResp_1819(25:28)); % Q10 = 5.0
d = horzcat(MeanSnowSeasonResp_1819(13:16),MeanSnowSeasonResp_1819(29:32)); % Q10 = 7.5
Q10_ANOVA_SR_1819 = vertcat(a,b,c,d);% One column per Q10 value
clear a b c d
Q10_ANOVA_SR_1819 = rot90(Q10_ANOVA_SR_1819);
[p_Q10_ANOVA_SR_1819,tbl_Q10_ANOVA_SR_1819,stats_Q10_ANOVA_SR_1819] = anova1(Q10_ANOVA_SR_1819);
multcompare(stats_Q10_ANOVA_SR_1819,'Alpha',0.001)

% Is Keff significant? > YES, T-test for 17-18 in DurhamPosterFigures.m
Resp_Sturm_1617 = MeanSnowSeasonResp_1617(17:32);
Resp_Jordan_1617 = MeanSnowSeasonResp_1617(1:16);
[h_keff_1617,p_keff_1617,~,stats_keff_1617] = ttest(Resp_Jordan_1617,Resp_Sturm_1617)

Resp_Sturm_1718 = MeanSnowSeasonResp_1718(17:32);
Resp_Jordan_1718 = MeanSnowSeasonResp_1718(1:16);
[h_keff_1718,p_keff_1718,~,stats_keff_1718] = ttest(Resp_Jordan_1718,Resp_Sturm_1718)

Resp_Sturm_1819 = MeanSnowSeasonResp_1819(17:32);
Resp_Jordan_1819 = MeanSnowSeasonResp_1819(1:16);
[h_keff_1819,p_keff_1819,~,stats_keff_1819] = ttest(Resp_Jordan_1819,Resp_Sturm_1819)

%% Fig 1. - CLM Sensitivity Test (Soil Resp.) 
% Give other winters in Supplement ???
% Run Paper2Stats.m prior to running this cell
T = datenum(FilledObs.TIMESTAMP);

% Obs - NEE
% Split into weekly chunks
chunklength = 7;
numchunks = (height(NEE_avg_gCd))/chunklength; % 366
chunksplit = 1:chunklength:height(NEE_avg_gCd);
NEE_toChunk = NEE_avg_gCd.NEE; % subset NEE from timetable, will also make weekly timetable later
NEE_chunked = reshape(NEE_toChunk,[],numchunks);
% Median and IQR (Or mean and std. dev?) for each chunk
WeeklyMeanNEE = mean(NEE_chunked,'omitnan');
WeeklyStdDevNEE = std(NEE_chunked,'omitnan');
WeeklyMedianNEE = median(NEE_chunked,'omitnan');
WeeklyQ1NEE = quantile(NEE_chunked, 0.25,1);
WeeklyQ3NEE = quantile(NEE_chunked, 0.75,1);
% Lasslop Uncertainities
NEEUnc_toChunk = NEE_avg_gCd.NEE_unc;
NEEUnc_chunked = reshape(NEEUnc_toChunk,[],numchunks);
WeeklyMeanNEEUnc = mean(NEEUnc_chunked,'omitnan'); % which to use on plot? How big of a difference does it make?
WeeklyMaxNEEUnc = max(NEEUnc_chunked,[],1,'omitnan');
% Subset to plot
datenums = datenum(FilledObs_Weekly.TIMESTAMP(251:283));
datenums_test = datenums + 1;
WeeklyMeanNEE_1718 = WeeklyMeanNEE(251:283);
WeeklyStdDevNEE_1718 = WeeklyStdDevNEE(251:283);
WeeklyMeanNEEUnc_1718 = WeeklyMeanNEEUnc(251:283);
WeeklyMaxNEEUnc_1718 = WeeklyMaxNEEUnc(251:283);

% Obs - 10cm Soil T
% rolling mean = movmean
% rollingmeans_SoilT = movmean(FilteredObs.SoilTprofile_10cm, 48,'omitnan');
% rolling std dev = movstd
% rollingstdev_SoilT = movstd(FilteredObs.SoilTprofile_10cm, 48,'omitnan');
% upperbound_SoilT = rot90(rollingmeans_SoilT + rollingstdev_SoilT);
% lowerbound_SoilT = rot90(rollingmeans_SoilT - rollingstdev_SoilT);

x = {'2017-08-01','2017-09-01','2017-10-01','2017-11-01','2017-12-01','2018-01-01','2018-02-01','2018-03-01','2018-04-01','2018-05-01','2018-06-01','2018-07-01','2018-08-01'};
x = datenum(x);
f = datenum(minPSI_20_J.Time);
cd 'D:\Work\Uni_Work\PHD\Modelling\CLM\Output Data From CLM\Paper 2\GitRepo\TVC\Observations' % for shaded plot function
fig = figure();
set(fig,'defaultLegendAutoUpdate','off');
% t = tiledlayout(3,1,'tilespacing', 'none');
tiledlayout(6,1,'tilespacing', 'none', 'padding', 'compact');
nexttile([2 1])
hold on
errorbar(datenums_test(1:(end-1)),WeeklyMeanNEE_1718(1:(end-1)),WeeklyStdDevNEE_1718(1:(end-1)),'k','LineStyle','none')
plot(datenums_test(1:(end-1)),WeeklyMeanNEE_1718(1:(end-1)),'kx','LineWidth',1.5) % majority of the averaging period for the last value is after snowmelt ... remove
yline(0,'k:')
datetick('x')
hold off
ylabel({'NEE'; '[g C m^2 day ^-1]'; ''; ''})
% title('Winter 2017 - 18')
ylim([-1 5])
xlim([SnowOn_1718_n SnowOff_1718_n])
yticks([])
xticks([])
% xticklabels([])
% text(736976, -1, '-1','FontSize', 14) %y axis labels (bc. issues)
text(736977, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(736977, 1, '1','FontSize', 14) %y axis labels (bc. issues)
text(736977, 2, '2','FontSize', 14) %y axis labels (bc. issues)
text(736977, 3, '3','FontSize', 14) %y axis labels (bc. issues)
text(736977, 4, '4','FontSize', 14) %y axis labels (bc. issues)
text(736977, 5, '5','FontSize', 14) %y axis labels (bc. issues)
text(736982, -0.5, 'a)','FontSize', 16)
datetick('x','mmm yy', 'keeplimits', 'keepticks')
set(gca,"FontSize",14)
set(gca,'TickDir','in');
box on
nexttile ([2 1])
% red tones = jordan
a = plot(f,Run0_1500CT_Daily.SoilResp_CLM,'Color',[0.6350 0.0780 0.1840],'LineWidth', 1.25);
hold on
% blue tones = sturm
b = shadedplot(f,minPSI_Default_S_MaxSR,minPSI_Default_S_MinSR,[0 0.2235 0.3705],[0 0.2235 0.3705]); % why does shading not show up??
alpha(0.4)
hold on
plot(f,minPSI_Default_S.MedianSoilResp_ALLQ10,'Color',[0 0.2235 0.3705],'LineWidth', 1.25);
c = shadedplot(f,minPSI_20_S_MaxSR,minPSI_20_S_MinSR,[0.1804 0.3529 0.5333],[0.1804 0.3529 0.5333]); % plot std dev as per fig 3
alpha(0.4)
hold on
plot(f,minPSI_20_S.MedianSoilResp_ALLQ10,'Color',[0.1804 0.3529 0.5333],'LineWidth', 1.25);
d = shadedplot(f,minPSI_200_S_MaxSR,minPSI_200_S_MinSR, [0.2667 0.5569 0.8941], [0.2667 0.5569 0.8941]); % plot std dev as per fig 3
alpha(0.4)
hold on
plot(f,minPSI_200_S.MedianSoilResp_ALLQ10,'Color', [0.2667 0.5569 0.8941],'LineWidth', 1.25);
e = shadedplot(f,minPSI_2000_S_MaxSR,minPSI_2000_S_MinSR,[0.5098 0.7961 0.6980],[0.5098 0.7961 0.6980]); % plot std dev as per fig 3
alpha(0.4)
hold on
plot(f,minPSI_2000_S.MedianSoilResp_ALLQ10,'Color',[0.5098 0.7961 0.6980],'LineWidth', 1.25);
yline(0,'w') % cover it up before dashes, or dashed line will be overwritten by axis
yline(0,'k:')
hold off
ylabel({'Soil Respiration'; '[g C m^2 day ^{-1}]'; ''; ''})
ylim([-1 5])
xlim([SnowOn_1718_n SnowOff_1718_n])
leg = [a b(2) c(2) d(2) e(2)];
legend(leg, {'Default CLM', 'Ψ_{min} = -2 MPa', 'Ψ_{min} = -20 MPa', 'Ψ_{min} = -200 MPa', 'Ψ_{min} = -2000 MPa'}, 'Location', 'NorthEast', 'NumColumns',2);
legend boxoff
yticks([])
xticks(x)
xticklabels([])
text(736977, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(736977, 1, '1','FontSize', 14) %y axis labels (bc. issues)
text(736977, 2, '2','FontSize', 14) %y axis labels (bc. issues)
text(736977, 3, '3','FontSize', 14) %y axis labels (bc. issues)
text(736977, 4, '4','FontSize', 14) %y axis labels (bc. issues)
text(736977, 5, '5','FontSize', 14) %y axis labels (bc. issues)
text(736982, -0.5, 'b)','FontSize', 16)
set(gca,"FontSize",14)
set(gca,'TickDir','in');
grid off
box on
nexttile
hold on
plot(f,Run0_1500CT_Daily.SnowDepth_MSC_obs,'k','LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SnowDepth_CLM,'Color',[0.4940 0.1840 0.5560],'LineWidth',1.5);
hold off
legend({'Observed','CLM'},'Location','NorthWest');
legend boxoff
yticks([])
xticks(x)
xticklabels([])
xlim([SnowOn_1718_n SnowOff_1718_n])
ylabel({'Snow'; 'Depth [m]';'';''})
% text(736977, 0, '0','FontSize', 14) %y axis labels (bc. issues)
text(736973, 0.25, '0.25','FontSize', 14) %y axis labels (bc. issues)
text(736975, 0.5, '0.5','FontSize', 14) %y axis labels (bc. issues)
text(736982, 0.1, 'c)','FontSize', 16)
set(gca,"FontSize",14)
set(gca,'TickDir','in'); 
box on
nexttile
% u = shadedplot(T,upperbound_SoilT,lowerbound_SoilT,[0.8078 0.6353 0.9922],[0.8078 0.6353 0.9922]); %IF are going to have daily simulations here, use daily rolling mean for obs?
hold on
u = plot(f,Run0_1500CT_Daily.SoilTemp_10cm_Obs,'k','LineWidth',1.5);
v = plot(f,Run0_1500CT_Daily.SoilTemp_10cm_CLM,'Color',[0.6350 0.0780 0.1840],'LineWidth',1.5);
w = plot(f,Sturm_1500CT_Daily.SoilTemp_10cm_CLM,'Color',[0 0.2235 0.3705],'LineWidth',1.5);
leg = [u v w];
legend(leg,{'Observed','CLM (Jordan)','CLM (Sturm)'}, 'Location', 'SouthWest');
legend boxoff
ylim([-25 0]) % revisit
% Convert to yyplot and add soil moisture???
xlim([SnowOn_1718_n SnowOff_1718_n])
yticks([])
xticks(x)
ylabel({'10cm Soil'; 'Temp [℃]'; ''; ''})
text(736977, 0, '0','FontSize', 14) %y axis labels (bc. issues)
% text(736976, -5, '-5','FontSize', 14) %y axis labels (bc. issues)
text(736975, -10, '-10','FontSize', 14) %y axis labels (bc. issues)
% text(736975, -15, '-15','FontSize', 14) %y axis labels (bc. issues)
text(736975, -20, '-20','FontSize', 14) %y axis labels (bc. issues)
% text(736975, -25, '-25','FontSize', 14) %y axis labels (bc. issues)
text(736982, -22, 'd)','FontSize', 16)
grid off
box on
xticklabels({'Aug 2017','Sep 2017','Oct 2017','Nov 2017','Dec 2017', 'Jan 2018', 'Feb 2018', 'Mar 2018', 'Apr 2018', 'May 2018', 'Jun 2018', 'Jul 2018', 'Aug 2018'})
set(gca,"FontSize",14)

%% Fig 2. - Cumulative NEE (for CLM sensitivity test)
Sturm_CumNEE_Winter1617_p = rot90(Sturm_CumNEE_Winter1617);
Sturm_minPSI20_CumNEE_Winter1617_p = rot90(Sturm_minPSI20_CumNEE_Winter1617);
Sturm_minPSI200_CumNEE_Winter1617_p = rot90(Sturm_minPSI200_CumNEE_Winter1617);
Sturm_minPSI2000_CumNEE_Winter1617_p = rot90(Sturm_minPSI2000_CumNEE_Winter1617);
Sturm_Q1075_CumNEE_Winter1617_p = rot90(Sturm_Q1075_CumNEE_Winter1617);
Sturm_minPSI20_Q1075_CumNEE_Winter1617_p = rot90(Sturm_minPSI20_Q1075_CumNEE_Winter1617);
Sturm_minPSI200_Q1075_CumNEE_Winter1617_p = rot90(Sturm_minPSI200_Q1075_CumNEE_Winter1617);
Sturm_minPSI2000_Q1075_CumNEE_Winter1617_p = rot90(Sturm_minPSI2000_Q1075_CumNEE_Winter1617);
numdays_1617 = [1:1:(numel(Sturm_CumNEE_Winter1617_p))];
Sturm_CumNEE_Winter1718_p = rot90(Sturm_CumNEE_Winter1718);
Sturm_minPSI20_CumNEE_Winter1718_p = rot90(Sturm_minPSI20_CumNEE_Winter1718);
Sturm_minPSI200_CumNEE_Winter1718_p = rot90(Sturm_minPSI200_CumNEE_Winter1718);
Sturm_minPSI2000_CumNEE_Winter1718_p = rot90(Sturm_minPSI2000_CumNEE_Winter1718);
Sturm_Q1075_CumNEE_Winter1718_p = rot90(Sturm_Q1075_CumNEE_Winter1718);
Sturm_minPSI20_Q1075_CumNEE_Winter1718_p = rot90(Sturm_minPSI20_Q1075_CumNEE_Winter1718);
Sturm_minPSI200_Q1075_CumNEE_Winter1718_p = rot90(Sturm_minPSI200_Q1075_CumNEE_Winter1718);
Sturm_minPSI2000_Q1075_CumNEE_Winter1718_p = rot90(Sturm_minPSI2000_Q1075_CumNEE_Winter1718);
numdays_1718 = [1:1:(numel(Sturm_CumNEE_Winter1718_p))];
Sturm_CumNEE_Winter1819_p = rot90(Sturm_CumNEE_Winter1819);
Sturm_minPSI20_CumNEE_Winter1819_p = rot90(Sturm_minPSI20_CumNEE_Winter1819);
Sturm_minPSI200_CumNEE_Winter1819_p = rot90(Sturm_minPSI200_CumNEE_Winter1819);
Sturm_minPSI2000_CumNEE_Winter1819_p = rot90(Sturm_minPSI2000_CumNEE_Winter1819);
Sturm_Q1075_CumNEE_Winter1819_p = rot90(Sturm_Q1075_CumNEE_Winter1819);
Sturm_minPSI20_Q1075_CumNEE_Winter1819_p = rot90(Sturm_minPSI20_Q1075_CumNEE_Winter1819);
Sturm_minPSI200_Q1075_CumNEE_Winter1819_p = rot90(Sturm_minPSI200_Q1075_CumNEE_Winter1819);
Sturm_minPSI2000_Q1075_CumNEE_Winter1819_p = rot90(Sturm_minPSI2000_Q1075_CumNEE_Winter1819);
numdays_1819 = [1:1:(numel(Sturm_CumNEE_Winter1819_p))];

figure()
t = tiledlayout(1,3,'tilespacing','compact');
nexttile
hold on
a = plot(Run0_CumNEE_Winter1617,'Color', [0.6350 0.0780 0.1840],'LineWidth',1.5)
b = shadedplot(numdays_1617,Sturm_CumNEE_Winter1617_p,Sturm_Q1075_CumNEE_Winter1617_p,[0 0.2235 0.3705],[0 0.2235 0.3705]);
hold on
b = plot(numdays_1617,Sturm_CumNEE_Winter1617_p,'Color', [0 0.2235 0.3705],'LineWidth',1.5)
alpha(0.4)
hold on
c = shadedplot(numdays_1617,Sturm_minPSI20_CumNEE_Winter1617_p,Sturm_minPSI20_Q1075_CumNEE_Winter1617_p,[0.1804 0.3529 0.5333],[0.1804 0.3529 0.5333]);
alpha(0.4)
hold on
d = shadedplot(numdays_1617,Sturm_minPSI200_CumNEE_Winter1617_p,Sturm_minPSI200_Q1075_CumNEE_Winter1617_p,[0.2667 0.5569 0.8941],[0.2667 0.5569 0.8941]);
alpha(0.4)
hold on
e = shadedplot(numdays_1617,Sturm_minPSI2000_CumNEE_Winter1617_p,Sturm_minPSI2000_Q1075_CumNEE_Winter1617_p,[0.5098 0.7961 0.6980],[0.5098 0.7961 0.6980]);
alpha(0.4)
ylim([0 500])
text(5, 475, sprintf('a) Snow On: \n%s',SnowOn_1617),'FontSize', 14)
grid off
leg = [a b c(2) d(2) e(2)];
set(gca,'FontSize',14)
legend(leg, {'Default CLM', 'Ψ_{min} = -2 MPa', 'Ψ_{min} = -20 MPa', 'Ψ_{min} = -200 MPa', 'Ψ_{min} = -2000 MPa'}, 'Location','NorthEast','FontSize',13);
legend boxoff

% title('Winter 16-17')
nexttile
hold on
plot(Run0_CumNEE_Winter1718,'Color', [0.6350 0.0780 0.1840],'LineWidth',1.5)
shadedplot(numdays_1718,Sturm_CumNEE_Winter1718_p,Sturm_Q1075_CumNEE_Winter1718_p,[0 0.2235 0.3705],[0 0.2235 0.3705]);
alpha(0.4)
hold on
shadedplot(numdays_1718,Sturm_minPSI20_CumNEE_Winter1718_p,Sturm_minPSI20_Q1075_CumNEE_Winter1718_p,[0.1804 0.3529 0.5333],[0.1804 0.3529 0.5333]);
alpha(0.4)
hold on
shadedplot(numdays_1718,Sturm_minPSI200_CumNEE_Winter1718_p,Sturm_minPSI200_Q1075_CumNEE_Winter1718_p,[0.2667 0.5569 0.8941],[0.2667 0.5569 0.8941]);
alpha(0.4)
hold on
shadedplot(numdays_1718,Sturm_minPSI2000_CumNEE_Winter1718_p,Sturm_minPSI2000_Q1075_CumNEE_Winter1718_p,[0.5098 0.7961 0.6980],[0.5098 0.7961 0.6980]);
alpha(0.4)
ylim([0 500])
text(5, 475, sprintf('b) Snow On: \n%s',SnowOn_1718),'FontSize', 14)
grid off
set(gca,'FontSize',14)
% title('Winter 17-18')
nexttile
hold on
plot(Run0_CumNEE_Winter1819,'Color', [0.6350 0.0780 0.1840],'LineWidth',1.5)
shadedplot(numdays_1819,Sturm_CumNEE_Winter1819_p,Sturm_Q1075_CumNEE_Winter1819_p,[0 0.2235 0.3705],[0 0.2235 0.3705]);
alpha(0.4)
hold on
shadedplot(numdays_1819,Sturm_minPSI20_CumNEE_Winter1819_p,Sturm_minPSI20_Q1075_CumNEE_Winter1819_p,[0.1804 0.3529 0.5333],[0.1804 0.3529 0.5333]);
alpha(0.4)
hold on
shadedplot(numdays_1819,Sturm_minPSI200_CumNEE_Winter1819_p,Sturm_minPSI200_Q1075_CumNEE_Winter1819_p,[0.2667 0.5569 0.8941],[0.2667 0.5569 0.8941]);
alpha(0.4)
hold on
shadedplot(numdays_1819,Sturm_minPSI2000_CumNEE_Winter1819_p,Sturm_minPSI2000_Q1075_CumNEE_Winter1819_p,[0.5098 0.7961 0.6980],[0.5098 0.7961 0.6980]);
alpha(0.4)
ylim([0 500])
grid off
% title('Winter 18-19')
% legend(t,{'Default','Sturm, Ψmin = -2000'},'Location', 'NorthWest');
% legend boxoff
text(5, 475, sprintf('c) Snow On: \n%s',SnowOn_1819), 'FontSize',14)
set(gca,'FontSize',14)
ylabel(t,'Cumulative NEE [g C m^2]','FontSize',14)
xlabel(t,'Days since Snow On','FontSize',14)

%% Fig 3 - Contour Plot (All 3 Years Combined)
% Run Paper 2 Stats prior to running this cell
Resp_Sturm = MeanSnowSeasonResp(17:32);
Resp_Jordan = MeanSnowSeasonResp(1:16);
Resp_Diff = abs(Resp_Jordan - Resp_Sturm);
Resp_Diff = reshape(Resp_Diff, 4, 4)
Resp_Sturm = reshape(Resp_Sturm, 4, 4)
Resp_Jordan = reshape(Resp_Jordan, 4, 4)

Q10_P = [1.5,2.5,5,7.5];
minPSI_P = [-2, -20, -200, -2000];
% Sort out colourmap first
cd 'D:\Work\Uni_Work\PHD\MatLab\BrewerMap'
c_new = brewermap([],'GnBu');

% Contour Plot 
figure
t = tiledlayout(1,3);
h(1) =nexttile([t]) % Jordan
pcolor(Q10_P,minPSI_P,Resp_Jordan)
shading interp
% pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
colormap(c_new)
caxis([0 2])
set(gca,'TickDir','out');
set(gca,'YScale','log')
set(gca,'ColorScale','log')
title('Jordan')
text(1.75, -3, 'a)','FontSize',14) % add letter
h(2) = nexttile([t]) % Sturm
pcolor(Q10_P,minPSI_P,Resp_Sturm)
shading interp
% pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
caxis([0 2])
set(gca,'ColorScale','log')
set(gca,'TickDir','out');
set(gca,'YScale','log')
title('Sturm')
text(1.75, -3, 'b)','FontSize',14) % add letter
h(3) = nexttile([t]) % Difference
pcolor(Q10_P,minPSI_P,Resp_Diff) % wants resp_diff as a matrix, but why?
shading interp
% pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
colormap(c_new)
caxis([0 2])
set(gca,'ColorScale','log')
xlabel(t, 'Q10','FontSize',16)
ylabel(t,'Ψ_{min} [MPa]','FontSize',16)
set(gca,'TickDir','out');
set(gca,'YScale','log')
title('Difference')
text(1.75, -3, 'c)','FontSize',14) % add letter
c = colorbar
c.Ticks = [0 0.25 0.5 0.75 1 1.5 2 ];
c.TickLabels = num2cell([ 0 0.25 0.5 0.75 1 1.5 2]);
c.Label.String = {'Mean Wintertime Soil'; 'Respiration [g C day ^{-1}]'};
c.Label.FontSize = 13.5;
set(h,'FontSize',13.5)
% Increase font size???

% T-test? does keff parameterisation make a significant difference
Resp_Sturm_t = MeanSnowSeasonResp(17:32);
Resp_Jordan_t = MeanSnowSeasonResp(1:16);
[h,p,ci,stats] = ttest(Resp_Jordan_t,Resp_Sturm_t)
% t-test for 17-18 only
Resp_Sturm_t = MeanSnowSeasonResp_1718(17:32);
Resp_Jordan_t = MeanSnowSeasonResp_1718(1:16);
[h,p,ci,stats] = ttest(Resp_Jordan_t,Resp_Sturm_t)

%% Figure 4 - RMSE 
% Root Mean Square Error = sqrt(mean((CLM - Obs).^2))

% remove negative winter values prior to thaw

A = FilledObs_Weekly.NEE_filled;
A(A<0)=NaN;
NEEObs_rm = FilledObs_Weekly.NEE_filled;
NEEObs_rm(198:230) = A(198:230); % Winter 2016-17
NEEObs_rm(251:283) = A(251:283); % Winter 2017-18
NEEObs_rm(301:334) = A(301:334); % Winter 2017-18

% Time of winter plot (9 subplots)

% Calculate RMSE:
% Winter 16-17
RMSE_Run0_NEE_1617_frz = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_NEE_1617_frz = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1617_frz = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1617_frz = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1617_frz = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1617_frz = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1617_frz = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1617_frz = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1617_frz = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1617_frz = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1617_frz = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1617_frz = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1617_frz = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1617_frz = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1617_frz = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1617_frz = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1617_frz = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(198:207) - NEEObs_rm(198:207)).^2),'omitnan'));
RMSE_NEE_1617_frz = horzcat(RMSE_Run0_NEE_1617_frz,RMSE_Sturm_Q1025_NEE_1617_frz,RMSE_Sturm_Q1050_NEE_1617_frz,RMSE_Sturm_Q1075_NEE_1617_frz,...
    RMSE_Sturm_minPSI20_NEE_1617_frz,RMSE_Sturm_minPSI20_Q1025_NEE_1617_frz,RMSE_Sturm_minPSI20_Q1050_NEE_1617_frz,RMSE_Sturm_minPSI20_Q1075_NEE_1617_frz,...
    RMSE_Sturm_minPSI200_NEE_1617_frz,RMSE_Sturm_minPSI200_Q1025_NEE_1617_frz,RMSE_Sturm_minPSI200_Q1050_NEE_1617_frz,RMSE_Sturm_minPSI200_Q1075_NEE_1617_frz,...
    RMSE_Sturm_minPSI2000_NEE_1617_frz,RMSE_Sturm_minPSI2000_Q1025_NEE_1617_frz,RMSE_Sturm_minPSI2000_Q1050_NEE_1617_frz,RMSE_Sturm_minPSI2000_Q1075_NEE_1617_frz);
Count_1617_frz = sum(~isnan(NEEObs_rm(198:207))); % Number of non-NaN values in timeseries

RMSE_Run0_NEE_1617_mw = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_NEE_1617_mw = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1617_mw = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1617_mw = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1617_mw = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1617_mw = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1617_mw = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1617_mw = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1617_mw = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1617_mw = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1617_mw = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1617_mw = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1617_mw = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1617_mw = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1617_mw = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1617_mw = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1617_mw = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(207:222) - NEEObs_rm(207:222)).^2),'omitnan'));
RMSE_NEE_1617_mw = horzcat(RMSE_Run0_NEE_1617_mw,RMSE_Sturm_Q1025_NEE_1617_mw,RMSE_Sturm_Q1050_NEE_1617_mw,RMSE_Sturm_Q1075_NEE_1617_mw,...
    RMSE_Sturm_minPSI20_NEE_1617_mw,RMSE_Sturm_minPSI20_Q1025_NEE_1617_mw,RMSE_Sturm_minPSI20_Q1050_NEE_1617_mw,RMSE_Sturm_minPSI20_Q1075_NEE_1617_mw,...
    RMSE_Sturm_minPSI200_NEE_1617_mw,RMSE_Sturm_minPSI200_Q1025_NEE_1617_mw,RMSE_Sturm_minPSI200_Q1050_NEE_1617_mw,RMSE_Sturm_minPSI200_Q1075_NEE_1617_mw,...
    RMSE_Sturm_minPSI2000_NEE_1617_mw,RMSE_Sturm_minPSI2000_Q1025_NEE_1617_mw,RMSE_Sturm_minPSI2000_Q1050_NEE_1617_mw,RMSE_Sturm_minPSI2000_Q1075_NEE_1617_mw);
Count_1617_mw = sum(~isnan(NEEObs_rm(207:222))); % Number of non-NaN values in timeseries

RMSE_Run0_NEE_1617_thw = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_NEE_1617_thw = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1617_thw = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1617_thw = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1617_thw = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1617_thw = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1617_thw = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1617_thw = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1617_thw = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1617_thw = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1617_thw = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1617_thw = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1617_thw = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1617_thw = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1617_thw = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1617_thw = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1617_thw = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(222:230) - NEEObs_rm(222:230)).^2),'omitnan'));
RMSE_NEE_1617_thw = horzcat(RMSE_Run0_NEE_1617_thw,RMSE_Sturm_Q1025_NEE_1617_thw,RMSE_Sturm_Q1050_NEE_1617_thw,RMSE_Sturm_Q1075_NEE_1617_thw,...
    RMSE_Sturm_minPSI20_NEE_1617_thw,RMSE_Sturm_minPSI20_Q1025_NEE_1617_thw,RMSE_Sturm_minPSI20_Q1050_NEE_1617_thw,RMSE_Sturm_minPSI20_Q1075_NEE_1617_thw,...
    RMSE_Sturm_minPSI200_NEE_1617_thw,RMSE_Sturm_minPSI200_Q1025_NEE_1617_thw,RMSE_Sturm_minPSI200_Q1050_NEE_1617_thw,RMSE_Sturm_minPSI200_Q1075_NEE_1617_thw,...
    RMSE_Sturm_minPSI2000_NEE_1617_thw,RMSE_Sturm_minPSI2000_Q1025_NEE_1617_thw,RMSE_Sturm_minPSI2000_Q1050_NEE_1617_thw,RMSE_Sturm_minPSI2000_Q1075_NEE_1617_thw);
Count_1617_thw = sum(~isnan(NEEObs_rm(222:230))); % Number of non-NaN values in timeseries

% Winter 17-18
RMSE_Run0_NEE_1718_frz = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_NEE_1718_frz = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1718_frz = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1718_frz = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1718_frz = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1718_frz = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1718_frz = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1718_frz = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1718_frz = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1718_frz = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1718_frz = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1718_frz = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1718_frz = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1718_frz = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1718_frz = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1718_frz = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1718_frz = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(251:264) - NEEObs_rm(251:264)).^2),'omitnan'));
RMSE_NEE_1718_frz = horzcat(RMSE_Run0_NEE_1718_frz,RMSE_Sturm_Q1025_NEE_1718_frz,RMSE_Sturm_Q1050_NEE_1718_frz,RMSE_Sturm_Q1075_NEE_1718_frz,...
    RMSE_Sturm_minPSI20_NEE_1718_frz,RMSE_Sturm_minPSI20_Q1025_NEE_1718_frz,RMSE_Sturm_minPSI20_Q1050_NEE_1718_frz,RMSE_Sturm_minPSI20_Q1075_NEE_1718_frz,...
    RMSE_Sturm_minPSI200_NEE_1718_frz,RMSE_Sturm_minPSI200_Q1025_NEE_1718_frz,RMSE_Sturm_minPSI200_Q1050_NEE_1718_frz,RMSE_Sturm_minPSI200_Q1075_NEE_1718_frz,...
    RMSE_Sturm_minPSI2000_NEE_1718_frz,RMSE_Sturm_minPSI2000_Q1025_NEE_1718_frz,RMSE_Sturm_minPSI2000_Q1050_NEE_1718_frz,RMSE_Sturm_minPSI2000_Q1075_NEE_1718_frz);
Count_1718_frz = sum(~isnan(NEEObs_rm(251:264))); % Number of non-NaN values in timeseries

RMSE_Run0_NEE_1718_mw = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_NEE_1718_mw = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1718_mw = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1718_mw = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1718_mw = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1718_mw = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1718_mw = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1718_mw = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1718_mw = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1718_mw = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1718_mw = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1718_mw = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1718_mw = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1718_mw = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1718_mw = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1718_mw = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1718_mw = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(264:278) - NEEObs_rm(264:278)).^2),'omitnan'));
RMSE_NEE_1718_mw = horzcat(RMSE_Run0_NEE_1718_mw,RMSE_Sturm_Q1025_NEE_1718_mw,RMSE_Sturm_Q1050_NEE_1718_mw,RMSE_Sturm_Q1075_NEE_1718_mw,...
    RMSE_Sturm_minPSI20_NEE_1718_mw,RMSE_Sturm_minPSI20_Q1025_NEE_1718_mw,RMSE_Sturm_minPSI20_Q1050_NEE_1718_mw,RMSE_Sturm_minPSI20_Q1075_NEE_1718_mw,...
    RMSE_Sturm_minPSI200_NEE_1718_mw,RMSE_Sturm_minPSI200_Q1025_NEE_1718_mw,RMSE_Sturm_minPSI200_Q1050_NEE_1718_mw,RMSE_Sturm_minPSI200_Q1075_NEE_1718_mw,...
    RMSE_Sturm_minPSI2000_NEE_1718_mw,RMSE_Sturm_minPSI2000_Q1025_NEE_1718_mw,RMSE_Sturm_minPSI2000_Q1050_NEE_1718_mw,RMSE_Sturm_minPSI2000_Q1075_NEE_1718_mw);
Count_1718_mw = sum(~isnan(NEEObs_rm(264:278))); % Number of non-NaN values in timeseries

RMSE_Run0_NEE_1718_thw = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_NEE_1718_thw = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1718_thw = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1718_thw = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1718_thw = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1718_thw = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1718_thw = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1718_thw = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1718_thw = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1718_thw = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1718_thw = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1718_thw = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1718_thw = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1718_thw = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1718_thw = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1718_thw = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1718_thw = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(278:283) - NEEObs_rm(278:283)).^2),'omitnan'));
RMSE_NEE_1718_thw = horzcat(RMSE_Run0_NEE_1718_thw,RMSE_Sturm_Q1025_NEE_1718_thw,RMSE_Sturm_Q1050_NEE_1718_thw,RMSE_Sturm_Q1075_NEE_1718_thw,...
    RMSE_Sturm_minPSI20_NEE_1718_thw,RMSE_Sturm_minPSI20_Q1025_NEE_1718_thw,RMSE_Sturm_minPSI20_Q1050_NEE_1718_thw,RMSE_Sturm_minPSI20_Q1075_NEE_1718_thw,...
    RMSE_Sturm_minPSI200_NEE_1718_thw,RMSE_Sturm_minPSI200_Q1025_NEE_1718_thw,RMSE_Sturm_minPSI200_Q1050_NEE_1718_thw,RMSE_Sturm_minPSI200_Q1075_NEE_1718_thw,...
    RMSE_Sturm_minPSI2000_NEE_1718_thw,RMSE_Sturm_minPSI2000_Q1025_NEE_1718_thw,RMSE_Sturm_minPSI2000_Q1050_NEE_1718_thw,RMSE_Sturm_minPSI2000_Q1075_NEE_1718_thw);
Count_1718_thw = sum(~isnan(NEEObs_rm(278:283))); % Number of non-NaN values in timeseries

% Winter 18-19
RMSE_Run0_NEE_1819_frz = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_NEE_1819_frz = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1819_frz = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1819_frz = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1819_frz = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1819_frz = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1819_frz = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1819_frz = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1819_frz = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1819_frz = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1819_frz = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1819_frz = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1819_frz = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1819_frz = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1819_frz = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1819_frz = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1819_frz = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(301:317) - NEEObs_rm(301:317)).^2),'omitnan'));
RMSE_NEE_1819_frz = horzcat(RMSE_Run0_NEE_1819_frz,RMSE_Sturm_Q1025_NEE_1819_frz,RMSE_Sturm_Q1050_NEE_1819_frz,RMSE_Sturm_Q1075_NEE_1819_frz,...
    RMSE_Sturm_minPSI20_NEE_1819_frz,RMSE_Sturm_minPSI20_Q1025_NEE_1819_frz,RMSE_Sturm_minPSI20_Q1050_NEE_1819_frz,RMSE_Sturm_minPSI20_Q1075_NEE_1819_frz,...
    RMSE_Sturm_minPSI200_NEE_1819_frz,RMSE_Sturm_minPSI200_Q1025_NEE_1819_frz,RMSE_Sturm_minPSI200_Q1050_NEE_1819_frz,RMSE_Sturm_minPSI200_Q1075_NEE_1819_frz,...
    RMSE_Sturm_minPSI2000_NEE_1819_frz,RMSE_Sturm_minPSI2000_Q1025_NEE_1819_frz,RMSE_Sturm_minPSI2000_Q1050_NEE_1819_frz,RMSE_Sturm_minPSI2000_Q1075_NEE_1819_frz);
Count_1819_frz = sum(~isnan(NEEObs_rm(301:317))); % Number of non-NaN values in timeseries

RMSE_Run0_NEE_1819_mw = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_NEE_1819_mw = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1819_mw = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1819_mw = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1819_mw = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1819_mw = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1819_mw = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1819_mw = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1819_mw = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1819_mw = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1819_mw = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1819_mw = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1819_mw = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1819_mw = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1819_mw = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1819_mw = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1819_mw = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(317:327) - NEEObs_rm(317:327)).^2),'omitnan'));
RMSE_NEE_1819_mw = horzcat(RMSE_Run0_NEE_1819_mw,RMSE_Sturm_Q1025_NEE_1819_mw,RMSE_Sturm_Q1050_NEE_1819_mw,RMSE_Sturm_Q1075_NEE_1819_mw,...
    RMSE_Sturm_minPSI20_NEE_1819_mw,RMSE_Sturm_minPSI20_Q1025_NEE_1819_mw,RMSE_Sturm_minPSI20_Q1050_NEE_1819_mw,RMSE_Sturm_minPSI20_Q1075_NEE_1819_mw,...
    RMSE_Sturm_minPSI200_NEE_1819_mw,RMSE_Sturm_minPSI200_Q1025_NEE_1819_mw,RMSE_Sturm_minPSI200_Q1050_NEE_1819_mw,RMSE_Sturm_minPSI200_Q1075_NEE_1819_mw,...
    RMSE_Sturm_minPSI2000_NEE_1819_mw,RMSE_Sturm_minPSI2000_Q1025_NEE_1819_mw,RMSE_Sturm_minPSI2000_Q1050_NEE_1819_mw,RMSE_Sturm_minPSI2000_Q1075_NEE_1819_mw);
Count_1819_mw = sum(~isnan(NEEObs_rm(317:327))); % Number of non-NaN values in timeseries

RMSE_Run0_NEE_1819_thw = sqrt(mean(((Run0_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_NEE_1819_thw = sqrt(mean(((Sturm_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_Q1025_NEE_1819_thw = sqrt(mean(((Sturm_Q1025_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_Q1050_NEE_1819_thw = sqrt(mean(((Sturm_Q1050_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_Q1075_NEE_1819_thw = sqrt(mean(((Sturm_Q1075_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI20_NEE_1819_thw = sqrt(mean(((Sturm_minPSI20_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1025_NEE_1819_thw = sqrt(mean(((Sturm_minPSI20_Q1025_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1050_NEE_1819_thw = sqrt(mean(((Sturm_minPSI20_Q1050_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI20_Q1075_NEE_1819_thw = sqrt(mean(((Sturm_minPSI20_Q1075_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI200_NEE_1819_thw = sqrt(mean(((Sturm_minPSI200_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1025_NEE_1819_thw = sqrt(mean(((Sturm_minPSI200_Q1025_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1050_NEE_1819_thw = sqrt(mean(((Sturm_minPSI200_Q1050_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI200_Q1075_NEE_1819_thw = sqrt(mean(((Sturm_minPSI200_Q1075_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_NEE_1819_thw = sqrt(mean(((Sturm_minPSI2000_1500CT_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1025_NEE_1819_thw = sqrt(mean(((Sturm_minPSI2000_Q1025_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1050_NEE_1819_thw = sqrt(mean(((Sturm_minPSI2000_Q1050_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_Sturm_minPSI2000_Q1075_NEE_1819_thw = sqrt(mean(((Sturm_minPSI2000_Q1075_Weekly.NEE_CLM(327:334) - NEEObs_rm(327:334)).^2),'omitnan'));
RMSE_NEE_1819_thw = horzcat(RMSE_Run0_NEE_1819_thw,RMSE_Sturm_Q1025_NEE_1819_thw,RMSE_Sturm_Q1050_NEE_1819_thw,RMSE_Sturm_Q1075_NEE_1819_thw,...
    RMSE_Sturm_minPSI20_NEE_1819_thw,RMSE_Sturm_minPSI20_Q1025_NEE_1819_thw,RMSE_Sturm_minPSI20_Q1050_NEE_1819_thw,RMSE_Sturm_minPSI20_Q1075_NEE_1819_thw,...
    RMSE_Sturm_minPSI200_NEE_1819_thw,RMSE_Sturm_minPSI200_Q1025_NEE_1819_thw,RMSE_Sturm_minPSI200_Q1050_NEE_1819_thw,RMSE_Sturm_minPSI200_Q1075_NEE_1819_thw,...
    RMSE_Sturm_minPSI2000_NEE_1819_thw,RMSE_Sturm_minPSI2000_Q1025_NEE_1819_thw,RMSE_Sturm_minPSI2000_Q1050_NEE_1819_thw,RMSE_Sturm_minPSI2000_Q1075_NEE_1819_thw);
Count_1819_thw = sum(~isnan(NEEObs_rm(327:334))); % Number of non-NaN values in timeseries

RMSE_NEE_toplot_frz_1617 = rot90(reshape(RMSE_NEE_1617_frz, 4, 4),2);
RMSE_NEE_toplot_mw_1617 = rot90(reshape(RMSE_NEE_1617_mw, 4, 4),2);
RMSE_NEE_toplot_thw_1617 = rot90(reshape(RMSE_NEE_1617_thw, 4, 4),2);
RMSE_NEE_toplot_frz_1718 = rot90(reshape(RMSE_NEE_1718_frz, 4, 4),2);
RMSE_NEE_toplot_mw_1718 = rot90(reshape(RMSE_NEE_1718_mw, 4, 4),2);
RMSE_NEE_toplot_thw_1718 = rot90(reshape(RMSE_NEE_1718_thw, 4, 4),2);
RMSE_NEE_toplot_frz_1819 = rot90(reshape(RMSE_NEE_1819_frz, 4, 4),2);
RMSE_NEE_toplot_mw_1819 = rot90(reshape(RMSE_NEE_1819_mw, 4, 4),2);
RMSE_NEE_toplot_thw_1819 = rot90(reshape(RMSE_NEE_1819_thw, 4, 4),2);

Q10_P = [1.5,2.5,5,7.5];
minPSI_P = [-2, -20, -200, -2000];
% Sort out colourmap first
cd 'D:\Work\Uni_Work\PHD\MatLab\BrewerMap'
c_new = brewermap([],'GnBu');
% note to self: log axis colourbar does not help

figure
t = tiledlayout(3,3,"tilespacing","compact")
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_frz_1617)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
title('Freeze-up')
ylabel('16-17')
text(5.5, -5,sprintf('n = %d',Count_1617_frz))
text(2,-5,'a)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_mw_1617)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
title('Midwinter')
text(5.5, -5,sprintf('n = %d',Count_1617_mw))
text(2,-5,'b)')
caxis([0 2.5])
colormap(c_new)
c = colorbar  % one shared colourbar
c.Label.String = {'RMSE - Weekly Averaged NEE [g C day ^{-1}]'};
% c.Label.Location ='South'
c.Location = 'NorthOutside'; % Move so as not to cause confusion with Q10 label ... where to?
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_thw_1617)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
title('Thaw')
text(5.5, -5,sprintf('n = %d',Count_1617_thw))
text(2,-5,'c)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_frz_1718)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
ylabel('17-18')
text(5.5, -5,sprintf('n = %d',Count_1718_frz))
text(2,-5,'d)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_mw_1718)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
text(5.5, -5,sprintf('n = %d',Count_1718_mw))
text(2,-5,'e)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_thw_1718)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
text(5.5, -5,sprintf('n = %d',Count_1718_thw))
text(2,-5,'f)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_frz_1819)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
ylabel('18-19')
text(5.5, -5,sprintf('n = %d',Count_1819_frz))
text(2,-5,'g)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_mw_1819)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
text(5.5, -5,sprintf('n = %d',Count_1819_mw))
text(2,-5,'h)')
caxis([0 2.5])
colormap(c_new)
nexttile
pcolor(Q10_P,minPSI_P,RMSE_NEE_toplot_thw_1819)
shading interp
pbaspect ([1 1 1])
xlim([1.5 7.5])
ylim([-2000 0])
xticks([1.5 3 4.5 6 7.5])
yticks([-1000 -100 -10 0])
set(gca,'TickDir','out');
set(gca,'YScale','log')
text(5.5, -5,sprintf('n = %d',Count_1819_thw))
text(2,-5,'i)')
colormap(c_new)
caxis([0 2.5])
xlabel(t,'Q10')
ylabel(t,'Ψ min [MPa]')

%% Modelled Cumulative Winter Flux
Run0_1500CT_Daily.Properties.VariableNames{123} = 'SoilRespFlux';
minPSI20_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI200_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI2000_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Q1025_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI20_Q1025_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI200_Q1025_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI2000_Q1025_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Q1050_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI20_Q1050_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI200_Q1050_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI2000_Q1050_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Q1075_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI20_Q1075_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI200_Q1075_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
minPSI2000_Q1075_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_1500CT_Daily.Properties.VariableNames{121} = 'SoilRespFlux';
Sturm_minPSI20_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI200_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI2000_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_Q1025_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI20_Q1025_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI200_Q1025_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI2000_Q1025_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_Q1050_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI20_Q1050_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI200_Q1050_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI2000_Q1050_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_Q1075_1500CT_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI20_Q1075_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI200_Q1075_Daily.Properties.VariableNames{115} = 'SoilRespFlux';
Sturm_minPSI2000_Q1075_Daily.Properties.VariableNames{115} = 'SoilRespFlux';

% Rename "NEE" to "NEE flux"
Run0_1500CT_Daily.Properties.VariableNames{113} = 'NEEFlux';
minPSI20_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI200_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI2000_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Q1025_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI20_Q1025_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI200_Q1025_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI2000_Q1025_Daily.Properties.VariableNames{107} = 'NEEFlux';
Q1050_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI20_Q1050_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI200_Q1050_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI2000_Q1050_Daily.Properties.VariableNames{107} = 'NEEFlux';
Q1075_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI20_Q1075_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI200_Q1075_Daily.Properties.VariableNames{107} = 'NEEFlux';
minPSI2000_Q1075_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_1500CT_Daily.Properties.VariableNames{113} = 'NEEFlux';
Sturm_minPSI20_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI200_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI2000_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_Q1025_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI20_Q1025_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI200_Q1025_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI2000_Q1025_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_Q1050_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI20_Q1050_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI200_Q1050_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI2000_Q1050_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_Q1075_1500CT_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI20_Q1075_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI200_Q1075_Daily.Properties.VariableNames{107} = 'NEEFlux';
Sturm_minPSI2000_Q1075_Daily.Properties.VariableNames{107} = 'NEEFlux';

% Convert flux per second to total per DAY
% (hourly total = flux * (60*60))*24);
Run0_1500CT_Daily.DailyTotalNEE = (Run0_1500CT_Daily.NEEFlux*(60*60))*24;
minPSI20_1500CT_Daily.DailyTotalNEE = (minPSI20_1500CT_Daily.NEEFlux*(60*60))*24;
minPSI200_1500CT_Daily.DailyTotalNEE = (minPSI200_1500CT_Daily.NEEFlux*(60*60))*24;
minPSI2000_1500CT_Daily.DailyTotalNEE = (minPSI2000_1500CT_Daily.NEEFlux*(60*60))*24;
Q1025_1500CT_Daily.DailyTotalNEE = (Q1025_1500CT_Daily.NEEFlux*(60*60))*24;
minPSI20_Q1025_Daily.DailyTotalNEE = (minPSI20_Q1025_Daily.NEEFlux*(60*60))*24;
minPSI200_Q1025_Daily.DailyTotalNEE = (minPSI200_Q1025_Daily.NEEFlux*(60*60))*24;
minPSI2000_Q1025_Daily.DailyTotalNEE = (minPSI2000_Q1025_Daily.NEEFlux*(60*60))*24;
Q1050_1500CT_Daily.DailyTotalNEE = (Q1050_1500CT_Daily.NEEFlux*(60*60))*24;
minPSI20_Q1050_Daily.DailyTotalNEE = (minPSI20_Q1050_Daily.NEEFlux*(60*60))*24;
minPSI200_Q1050_Daily.DailyTotalNEE = (minPSI200_Q1050_Daily.NEEFlux*(60*60))*24;
minPSI2000_Q1050_Daily.DailyTotalNEE = (minPSI2000_Q1050_Daily.NEEFlux*(60*60))*24;
Q1075_1500CT_Daily.DailyTotalNEE = (Q1075_1500CT_Daily.NEEFlux*(60*60))*24;
minPSI20_Q1075_Daily.DailyTotalNEE = (minPSI20_Q1075_Daily.NEEFlux*(60*60))*24;
minPSI200_Q1075_Daily.DailyTotalNEE = (minPSI200_Q1075_Daily.NEEFlux*(60*60))*24;
minPSI2000_Q1075_Daily.DailyTotalNEE = (minPSI2000_Q1075_Daily.NEEFlux*(60*60))*24;
Sturm_1500CT_Daily.DailyTotalNEE = (Sturm_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI20_1500CT_Daily.DailyTotalNEE = (Sturm_minPSI20_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI200_1500CT_Daily.DailyTotalNEE = (Sturm_minPSI200_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI2000_1500CT_Daily.DailyTotalNEE = (Sturm_minPSI2000_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_Q1025_1500CT_Daily.DailyTotalNEE = (Sturm_Q1025_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI20_Q1025_Daily.DailyTotalNEE = (Sturm_minPSI20_Q1025_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI200_Q1025_Daily.DailyTotalNEE = (Sturm_minPSI200_Q1025_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI2000_Q1025_Daily.DailyTotalNEE = (Sturm_minPSI2000_Q1025_Daily.NEEFlux*(60*60))*24;
Sturm_Q1050_1500CT_Daily.DailyTotalNEE = (Sturm_Q1050_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI20_Q1050_Daily.DailyTotalNEE = (Sturm_minPSI20_Q1050_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI200_Q1050_Daily.DailyTotalNEE = (Sturm_minPSI200_Q1050_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI2000_Q1050_Daily.DailyTotalNEE = (Sturm_minPSI2000_Q1050_Daily.NEEFlux*(60*60))*24;
Sturm_Q1075_1500CT_Daily.DailyTotalNEE = (Sturm_Q1075_1500CT_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI20_Q1075_Daily.DailyTotalNEE = (Sturm_minPSI20_Q1075_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI200_Q1075_Daily.DailyTotalNEE = (Sturm_minPSI200_Q1075_Daily.NEEFlux*(60*60))*24;
Sturm_minPSI2000_Q1075_Daily.DailyTotalNEE = (Sturm_minPSI2000_Q1075_Daily.NEEFlux*(60*60))*24;

Run0_1500CT_Daily.DailyTotalSoilResp = (Run0_1500CT_Daily.SoilRespFlux*(60*60))*24;
minPSI20_1500CT_Daily.DailyTotalSoilResp = (minPSI20_1500CT_Daily.SoilRespFlux*(60*60))*24;
minPSI200_1500CT_Daily.DailyTotalSoilResp = (minPSI200_1500CT_Daily.SoilRespFlux*(60*60))*24;
minPSI2000_1500CT_Daily.DailyTotalSoilResp = (minPSI2000_1500CT_Daily.SoilRespFlux*(60*60))*24;
Q1025_1500CT_Daily.DailyTotalSoilResp = (Q1025_1500CT_Daily.SoilRespFlux*(60*60))*24;
minPSI20_Q1025_Daily.DailyTotalSoilResp = (minPSI20_Q1025_Daily.SoilRespFlux*(60*60))*24;
minPSI200_Q1025_Daily.DailyTotalSoilResp = (minPSI200_Q1025_Daily.SoilRespFlux*(60*60))*24;
minPSI2000_Q1025_Daily.DailyTotalSoilResp = (minPSI2000_Q1025_Daily.SoilRespFlux*(60*60))*24;
Q1050_1500CT_Daily.DailyTotalSoilResp = (Q1050_1500CT_Daily.SoilRespFlux*(60*60))*24;
minPSI20_Q1050_Daily.DailyTotalSoilResp = (minPSI20_Q1050_Daily.SoilRespFlux*(60*60))*24;
minPSI200_Q1050_Daily.DailyTotalSoilResp = (minPSI200_Q1050_Daily.SoilRespFlux*(60*60))*24;
minPSI2000_Q1050_Daily.DailyTotalSoilResp = (minPSI2000_Q1050_Daily.SoilRespFlux*(60*60))*24;
Q1075_1500CT_Daily.DailyTotalSoilResp = (Q1075_1500CT_Daily.SoilRespFlux*(60*60))*24;
minPSI20_Q1075_Daily.DailyTotalSoilResp = (minPSI20_Q1075_Daily.SoilRespFlux*(60*60))*24;
minPSI200_Q1075_Daily.DailyTotalSoilResp = (minPSI200_Q1075_Daily.SoilRespFlux*(60*60))*24;
minPSI2000_Q1075_Daily.DailyTotalSoilResp = (minPSI2000_Q1075_Daily.SoilRespFlux*(60*60))*24;
Sturm_1500CT_Daily.DailyTotalSoilResp = (Sturm_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI20_1500CT_Daily.DailyTotalSoilResp = (Sturm_minPSI20_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI200_1500CT_Daily.DailyTotalSoilResp = (Sturm_minPSI200_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI2000_1500CT_Daily.DailyTotalSoilResp = (Sturm_minPSI2000_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_Q1025_1500CT_Daily.DailyTotalSoilResp = (Sturm_Q1025_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI20_Q1025_Daily.DailyTotalSoilResp = (Sturm_minPSI20_Q1025_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI200_Q1025_Daily.DailyTotalSoilResp = (Sturm_minPSI200_Q1025_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI2000_Q1025_Daily.DailyTotalSoilResp = (Sturm_minPSI2000_Q1025_Daily.SoilRespFlux*(60*60))*24;
Sturm_Q1050_1500CT_Daily.DailyTotalSoilResp = (Sturm_Q1050_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI20_Q1050_Daily.DailyTotalSoilResp = (Sturm_minPSI20_Q1050_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI200_Q1050_Daily.DailyTotalSoilResp = (Sturm_minPSI200_Q1050_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI2000_Q1050_Daily.DailyTotalSoilResp = (Sturm_minPSI2000_Q1050_Daily.SoilRespFlux*(60*60))*24;
Sturm_Q1075_1500CT_Daily.DailyTotalSoilResp = (Sturm_Q1075_1500CT_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI20_Q1075_Daily.DailyTotalSoilResp = (Sturm_minPSI20_Q1075_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI200_Q1075_Daily.DailyTotalSoilResp = (Sturm_minPSI200_Q1075_Daily.SoilRespFlux*(60*60))*24;
Sturm_minPSI2000_Q1075_Daily.DailyTotalSoilResp = (Sturm_minPSI2000_Q1075_Daily.SoilRespFlux*(60*60))*24;

% Subset winters
% 2016/17
% Snow-on: 9th Oct (1378 - Daily; 33049 - Hourly)
% Snow-off: 23rd May (1604 - Daily; 38473 - Hourly)
Run0_NEETotals_Winter1617 = Run0_1500CT_Daily.DailyTotalNEE(1378:1604);
minPSI20_NEETotals_Winter1617 = minPSI20_1500CT_Daily.DailyTotalNEE(1378:1604);
minPSI200_NEETotals_Winter1617 = minPSI200_1500CT_Daily.DailyTotalNEE(1378:1604);
minPSI2000_NEETotals_Winter1617 = minPSI2000_1500CT_Daily.DailyTotalNEE(1378:1604);
Q1025_NEETotals_Winter1617 = Q1025_1500CT_Daily.DailyTotalNEE(1378:1604);
minPSI20_Q1025_NEETotals_Winter1617 = minPSI20_Q1025_Daily.DailyTotalNEE(1378:1604);
minPSI200_Q1025_NEETotals_Winter1617 = minPSI200_Q1025_Daily.DailyTotalNEE(1378:1604);
minPSI2000_Q1025_NEETotals_Winter1617 = minPSI2000_Q1025_Daily.DailyTotalNEE(1378:1604);
Q1050_NEETotals_Winter1617 = Q1050_1500CT_Daily.DailyTotalNEE(1378:1604);
minPSI20_Q1050_NEETotals_Winter1617 = minPSI20_Q1050_Daily.DailyTotalNEE(1378:1604);
minPSI200_Q1050_NEETotals_Winter1617 = minPSI200_Q1050_Daily.DailyTotalNEE(1378:1604);
minPSI2000_Q1050_NEETotals_Winter1617 = minPSI2000_Q1050_Daily.DailyTotalNEE(1378:1604);
Q1075_NEETotals_Winter1617 = Q1075_1500CT_Daily.DailyTotalNEE(1378:1604);
minPSI20_Q1075_NEETotals_Winter1617 = minPSI20_Q1075_Daily.DailyTotalNEE(1378:1604);
minPSI200_Q1075_NEETotals_Winter1617 = minPSI200_Q1075_Daily.DailyTotalNEE(1378:1604);
minPSI2000_Q1075_NEETotals_Winter1617 = minPSI2000_Q1075_Daily.DailyTotalNEE(1378:1604);
Sturm_NEETotals_Winter1617 = Sturm_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI20_NEETotals_Winter1617 = Sturm_minPSI20_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI200_NEETotals_Winter1617 = Sturm_minPSI200_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI2000_NEETotals_Winter1617 = Sturm_minPSI2000_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_Q1025_NEETotals_Winter1617 = Sturm_Q1025_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI20_Q1025_NEETotals_Winter1617 = Sturm_minPSI20_Q1025_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI200_Q1025_NEETotals_Winter1617 = Sturm_minPSI200_Q1025_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI2000_Q1025_NEETotals_Winter1617 = Sturm_minPSI2000_Q1025_Daily.DailyTotalNEE(1378:1604);
Sturm_Q1050_NEETotals_Winter1617 = Sturm_Q1050_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI20_Q1050_NEETotals_Winter1617 = Sturm_minPSI20_Q1050_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI200_Q1050_NEETotals_Winter1617 = Sturm_minPSI200_Q1050_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI2000_Q1050_NEETotals_Winter1617 = Sturm_minPSI2000_Q1050_Daily.DailyTotalNEE(1378:1604);
Sturm_Q1075_NEETotals_Winter1617 = Sturm_Q1075_1500CT_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI20_Q1075_NEETotals_Winter1617 = Sturm_minPSI20_Q1075_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI200_Q1075_NEETotals_Winter1617 = Sturm_minPSI200_Q1075_Daily.DailyTotalNEE(1378:1604);
Sturm_minPSI2000_Q1075_NEETotals_Winter1617 = Sturm_minPSI2000_Q1075_Daily.DailyTotalNEE(1378:1604);

% 2017/18
% Snow-on: 12th Oct (1746 - Daily; 41881 - Hourly)
% Snow-off: 30th May (1976 - Daily; 47401 - Hourly)
Run0_NEETotals_Winter1718 = Run0_1500CT_Daily.DailyTotalNEE(1746:1976);
minPSI20_NEETotals_Winter1718 = minPSI20_1500CT_Daily.DailyTotalNEE(1746:1976);
minPSI200_NEETotals_Winter1718 = minPSI200_1500CT_Daily.DailyTotalNEE(1746:1976);
minPSI2000_NEETotals_Winter1718 = minPSI2000_1500CT_Daily.DailyTotalNEE(1746:1976);
Q1025_NEETotals_Winter1718 = Q1025_1500CT_Daily.DailyTotalNEE(1746:1976);
minPSI20_Q1025_NEETotals_Winter1718 = minPSI20_Q1025_Daily.DailyTotalNEE(1746:1976);
minPSI200_Q1025_NEETotals_Winter1718 = minPSI200_Q1025_Daily.DailyTotalNEE(1746:1976);
minPSI2000_Q1025_NEETotals_Winter1718 = minPSI2000_Q1025_Daily.DailyTotalNEE(1746:1976);
Q1050_NEETotals_Winter1718 = Q1050_1500CT_Daily.DailyTotalNEE(1746:1976);
minPSI20_Q1050_NEETotals_Winter1718 = minPSI20_Q1050_Daily.DailyTotalNEE(1746:1976);
minPSI200_Q1050_NEETotals_Winter1718 = minPSI200_Q1050_Daily.DailyTotalNEE(1746:1976);
minPSI2000_Q1050_NEETotals_Winter1718 = minPSI2000_Q1050_Daily.DailyTotalNEE(1746:1976);
Q1075_NEETotals_Winter1718 = Q1075_1500CT_Daily.DailyTotalNEE(1746:1976);
minPSI20_Q1075_NEETotals_Winter1718 = minPSI20_Q1075_Daily.DailyTotalNEE(1746:1976);
minPSI200_Q1075_NEETotals_Winter1718 = minPSI200_Q1075_Daily.DailyTotalNEE(1746:1976);
minPSI2000_Q1075_NEETotals_Winter1718 = minPSI2000_Q1075_Daily.DailyTotalNEE(1746:1976);
Sturm_NEETotals_Winter1718 = Sturm_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI20_NEETotals_Winter1718 = Sturm_minPSI20_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI200_NEETotals_Winter1718 = Sturm_minPSI200_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI2000_NEETotals_Winter1718 = Sturm_minPSI2000_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_Q1025_NEETotals_Winter1718 = Sturm_Q1025_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI20_Q1025_NEETotals_Winter1718 = Sturm_minPSI20_Q1025_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI200_Q1025_NEETotals_Winter1718 = Sturm_minPSI200_Q1025_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI2000_Q1025_NEETotals_Winter1718 = Sturm_minPSI2000_Q1025_Daily.DailyTotalNEE(1746:1976);
Sturm_Q1050_NEETotals_Winter1718 = Sturm_Q1050_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI20_Q1050_NEETotals_Winter1718 = Sturm_minPSI20_Q1050_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI200_Q1050_NEETotals_Winter1718 = Sturm_minPSI200_Q1050_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI2000_Q1050_NEETotals_Winter1718 = Sturm_minPSI2000_Q1050_Daily.DailyTotalNEE(1746:1976);
Sturm_Q1075_NEETotals_Winter1718 = Sturm_Q1075_1500CT_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI20_Q1075_NEETotals_Winter1718 = Sturm_minPSI20_Q1075_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI200_Q1075_NEETotals_Winter1718 = Sturm_minPSI200_Q1075_Daily.DailyTotalNEE(1746:1976);
Sturm_minPSI2000_Q1075_NEETotals_Winter1718 = Sturm_minPSI2000_Q1075_Daily.DailyTotalNEE(1746:1976);

% 2018/19
% Snow-on: 24th Sept (2093 - Daily; 50209 - Hourly)
% Snow-off: 23rd May (2334 - Daily; 55993 - Hourly)
Run0_NEETotals_Winter1819 = Run0_1500CT_Daily.DailyTotalNEE(2093:2334);
minPSI20_NEETotals_Winter1819 = minPSI20_1500CT_Daily.DailyTotalNEE(2093:2334);
minPSI200_NEETotals_Winter1819 = minPSI200_1500CT_Daily.DailyTotalNEE(2093:2334);
minPSI2000_NEETotals_Winter1819 = minPSI2000_1500CT_Daily.DailyTotalNEE(2093:2334);
Q1025_NEETotals_Winter1819 = Q1025_1500CT_Daily.DailyTotalNEE(2093:2334);
minPSI20_Q1025_NEETotals_Winter1819 = minPSI20_Q1025_Daily.DailyTotalNEE(2093:2334);
minPSI200_Q1025_NEETotals_Winter1819 = minPSI200_Q1025_Daily.DailyTotalNEE(2093:2334);
minPSI2000_Q1025_NEETotals_Winter1819 = minPSI2000_Q1025_Daily.DailyTotalNEE(2093:2334);
Q1050_NEETotals_Winter1819 = Q1050_1500CT_Daily.DailyTotalNEE(2093:2334);
minPSI20_Q1050_NEETotals_Winter1819 = minPSI20_Q1050_Daily.DailyTotalNEE(2093:2334);
minPSI200_Q1050_NEETotals_Winter1819 = minPSI200_Q1050_Daily.DailyTotalNEE(2093:2334);
minPSI2000_Q1050_NEETotals_Winter1819 = minPSI2000_Q1050_Daily.DailyTotalNEE(2093:2334);
Q1075_NEETotals_Winter1819 = Q1075_1500CT_Daily.DailyTotalNEE(2093:2334);
minPSI20_Q1075_NEETotals_Winter1819 = minPSI20_Q1075_Daily.DailyTotalNEE(2093:2334);
minPSI200_Q1075_NEETotals_Winter1819 = minPSI200_Q1075_Daily.DailyTotalNEE(2093:2334);
minPSI2000_Q1075_NEETotals_Winter1819 = minPSI2000_Q1075_Daily.DailyTotalNEE(2093:2334);
Sturm_NEETotals_Winter1819 = Sturm_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI20_NEETotals_Winter1819 = Sturm_minPSI20_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI200_NEETotals_Winter1819 = Sturm_minPSI200_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI2000_NEETotals_Winter1819 = Sturm_minPSI2000_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_Q1025_NEETotals_Winter1819 = Sturm_Q1025_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI20_Q1025_NEETotals_Winter1819 = Sturm_minPSI20_Q1025_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI200_Q1025_NEETotals_Winter1819 = Sturm_minPSI200_Q1025_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI2000_Q1025_NEETotals_Winter1819 = Sturm_minPSI2000_Q1025_Daily.DailyTotalNEE(2093:2334);
Sturm_Q1050_NEETotals_Winter1819 = Sturm_Q1050_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI20_Q1050_NEETotals_Winter1819 = Sturm_minPSI20_Q1050_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI200_Q1050_NEETotals_Winter1819 = Sturm_minPSI200_Q1050_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI2000_Q1050_NEETotals_Winter1819 = Sturm_minPSI2000_Q1050_Daily.DailyTotalNEE(2093:2334);
Sturm_Q1075_NEETotals_Winter1819 = Sturm_Q1075_1500CT_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI20_Q1075_NEETotals_Winter1819 = Sturm_minPSI20_Q1075_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI200_Q1075_NEETotals_Winter1819 = Sturm_minPSI200_Q1075_Daily.DailyTotalNEE(2093:2334);
Sturm_minPSI2000_Q1075_NEETotals_Winter1819 = Sturm_minPSI2000_Q1075_Daily.DailyTotalNEE(2093:2334);

% CumSum
% NEE - Would different units also be more appropriate?
Run0_CumNEE_Winter1617 = cumsum(Run0_NEETotals_Winter1617);
Run0_CumNEE_Winter1718 = cumsum(Run0_NEETotals_Winter1718);
Run0_CumNEE_Winter1819 = cumsum(Run0_NEETotals_Winter1819);
minPSI20_CumNEE_Winter1617 = cumsum(minPSI20_NEETotals_Winter1617);
minPSI20_CumNEE_Winter1718 = cumsum(minPSI20_NEETotals_Winter1718);
minPSI20_CumNEE_Winter1819 = cumsum(minPSI20_NEETotals_Winter1819);
minPSI200_CumNEE_Winter1617 = cumsum(minPSI200_NEETotals_Winter1617);
minPSI200_CumNEE_Winter1718 = cumsum(minPSI200_NEETotals_Winter1718);
minPSI200_CumNEE_Winter1819 = cumsum(minPSI200_NEETotals_Winter1819);
minPSI2000_CumNEE_Winter1617 = cumsum(minPSI2000_NEETotals_Winter1617);
minPSI2000_CumNEE_Winter1718 = cumsum(minPSI2000_NEETotals_Winter1718);
minPSI2000_CumNEE_Winter1819 = cumsum(minPSI2000_NEETotals_Winter1819);
Q1025_CumNEE_Winter1617 = cumsum(Q1025_NEETotals_Winter1617);
Q1025_CumNEE_Winter1718 = cumsum(Q1025_NEETotals_Winter1718);
Q1025_CumNEE_Winter1819 = cumsum(Q1025_NEETotals_Winter1819);
minPSI20_Q1025_CumNEE_Winter1617 = cumsum(minPSI20_Q1025_NEETotals_Winter1617);
minPSI20_Q1025_CumNEE_Winter1718 = cumsum(minPSI20_Q1025_NEETotals_Winter1718);
minPSI20_Q1025_CumNEE_Winter1819 = cumsum(minPSI20_Q1025_NEETotals_Winter1819);
minPSI200_Q1025_CumNEE_Winter1617 = cumsum(minPSI200_Q1025_NEETotals_Winter1617);
minPSI200_Q1025_CumNEE_Winter1718 = cumsum(minPSI200_Q1025_NEETotals_Winter1718);
minPSI200_Q1025_CumNEE_Winter1819 = cumsum(minPSI200_Q1025_NEETotals_Winter1819);
minPSI2000_Q1025_CumNEE_Winter1617 = cumsum(minPSI2000_Q1025_NEETotals_Winter1617);
minPSI2000_Q1025_CumNEE_Winter1718 = cumsum(minPSI2000_Q1025_NEETotals_Winter1718);
minPSI2000_Q1025_CumNEE_Winter1819 = cumsum(minPSI2000_Q1025_NEETotals_Winter1819);
Q1050_CumNEE_Winter1617 = cumsum(Q1050_NEETotals_Winter1617);
Q1050_CumNEE_Winter1718 = cumsum(Q1050_NEETotals_Winter1718);
Q1050_CumNEE_Winter1819 = cumsum(Q1050_NEETotals_Winter1819);
minPSI20_Q1050_CumNEE_Winter1617 = cumsum(minPSI20_Q1050_NEETotals_Winter1617);
minPSI20_Q1050_CumNEE_Winter1718 = cumsum(minPSI20_Q1050_NEETotals_Winter1718);
minPSI20_Q1050_CumNEE_Winter1819 = cumsum(minPSI20_Q1050_NEETotals_Winter1819);
minPSI200_Q1050_CumNEE_Winter1617 = cumsum(minPSI200_Q1050_NEETotals_Winter1617);
minPSI200_Q1050_CumNEE_Winter1718 = cumsum(minPSI200_Q1050_NEETotals_Winter1718);
minPSI200_Q1050_CumNEE_Winter1819 = cumsum(minPSI200_Q1050_NEETotals_Winter1819);
minPSI2000_Q1050_CumNEE_Winter1617 = cumsum(minPSI2000_Q1050_NEETotals_Winter1617);
minPSI2000_Q1050_CumNEE_Winter1718 = cumsum(minPSI2000_Q1050_NEETotals_Winter1718);
minPSI2000_Q1050_CumNEE_Winter1819 = cumsum(minPSI2000_Q1050_NEETotals_Winter1819);
Q1075_CumNEE_Winter1617 = cumsum(Q1075_NEETotals_Winter1617);
Q1075_CumNEE_Winter1718 = cumsum(Q1075_NEETotals_Winter1718);
Q1075_CumNEE_Winter1819 = cumsum(Q1075_NEETotals_Winter1819);
minPSI20_Q1075_CumNEE_Winter1617 = cumsum(minPSI20_Q1075_NEETotals_Winter1617);
minPSI20_Q1075_CumNEE_Winter1718 = cumsum(minPSI20_Q1075_NEETotals_Winter1718);
minPSI20_Q1075_CumNEE_Winter1819 = cumsum(minPSI20_Q1075_NEETotals_Winter1819);
minPSI200_Q1075_CumNEE_Winter1617 = cumsum(minPSI200_Q1075_NEETotals_Winter1617);
minPSI200_Q1075_CumNEE_Winter1718 = cumsum(minPSI200_Q1075_NEETotals_Winter1718);
minPSI200_Q1075_CumNEE_Winter1819 = cumsum(minPSI200_Q1075_NEETotals_Winter1819);
minPSI2000_Q1075_CumNEE_Winter1617 = cumsum(minPSI2000_Q1075_NEETotals_Winter1617);
minPSI2000_Q1075_CumNEE_Winter1718 = cumsum(minPSI2000_Q1075_NEETotals_Winter1718);
minPSI2000_Q1075_CumNEE_Winter1819 = cumsum(minPSI2000_Q1075_NEETotals_Winter1819);
Sturm_CumNEE_Winter1617 = cumsum(Sturm_NEETotals_Winter1617);
Sturm_CumNEE_Winter1718 = cumsum(Sturm_NEETotals_Winter1718);
Sturm_CumNEE_Winter1819 = cumsum(Sturm_NEETotals_Winter1819);
Sturm_minPSI20_CumNEE_Winter1617 = cumsum(Sturm_minPSI20_NEETotals_Winter1617);
Sturm_minPSI20_CumNEE_Winter1718 = cumsum(Sturm_minPSI20_NEETotals_Winter1718);
Sturm_minPSI20_CumNEE_Winter1819 = cumsum(Sturm_minPSI20_NEETotals_Winter1819);
Sturm_minPSI200_CumNEE_Winter1617 = cumsum(Sturm_minPSI200_NEETotals_Winter1617);
Sturm_minPSI200_CumNEE_Winter1718 = cumsum(Sturm_minPSI200_NEETotals_Winter1718);
Sturm_minPSI200_CumNEE_Winter1819 = cumsum(Sturm_minPSI200_NEETotals_Winter1819);
Sturm_minPSI2000_CumNEE_Winter1617 = cumsum(Sturm_minPSI2000_NEETotals_Winter1617);
Sturm_minPSI2000_CumNEE_Winter1718 = cumsum(Sturm_minPSI2000_NEETotals_Winter1718);
Sturm_minPSI2000_CumNEE_Winter1819 = cumsum(Sturm_minPSI2000_NEETotals_Winter1819);
Sturm_Q1025_CumNEE_Winter1617 = cumsum(Sturm_Q1025_NEETotals_Winter1617);
Sturm_Q1025_CumNEE_Winter1718 = cumsum(Sturm_Q1025_NEETotals_Winter1718);
Sturm_Q1025_CumNEE_Winter1819 = cumsum(Sturm_Q1025_NEETotals_Winter1819);
Sturm_minPSI20_Q1025_CumNEE_Winter1617 = cumsum(Sturm_minPSI20_Q1025_NEETotals_Winter1617);
Sturm_minPSI20_Q1025_CumNEE_Winter1718 = cumsum(Sturm_minPSI20_Q1025_NEETotals_Winter1718);
Sturm_minPSI20_Q1025_CumNEE_Winter1819 = cumsum(Sturm_minPSI20_Q1025_NEETotals_Winter1819);
Sturm_minPSI200_Q1025_CumNEE_Winter1617 = cumsum(Sturm_minPSI200_Q1025_NEETotals_Winter1617);
Sturm_minPSI200_Q1025_CumNEE_Winter1718 = cumsum(Sturm_minPSI200_Q1025_NEETotals_Winter1718);
Sturm_minPSI200_Q1025_CumNEE_Winter1819 = cumsum(Sturm_minPSI200_Q1025_NEETotals_Winter1819);
Sturm_minPSI2000_Q1025_CumNEE_Winter1617 = cumsum(Sturm_minPSI2000_Q1025_NEETotals_Winter1617);
Sturm_minPSI2000_Q1025_CumNEE_Winter1718 = cumsum(Sturm_minPSI2000_Q1025_NEETotals_Winter1718);
Sturm_minPSI2000_Q1025_CumNEE_Winter1819 = cumsum(Sturm_minPSI2000_Q1025_NEETotals_Winter1819);
Sturm_Q1050_CumNEE_Winter1617 = cumsum(Sturm_Q1050_NEETotals_Winter1617);
Sturm_Q1050_CumNEE_Winter1718 = cumsum(Sturm_Q1050_NEETotals_Winter1718);
Sturm_Q1050_CumNEE_Winter1819 = cumsum(Sturm_Q1050_NEETotals_Winter1819);
Sturm_minPSI20_Q1050_CumNEE_Winter1617 = cumsum(Sturm_minPSI20_Q1050_NEETotals_Winter1617);
Sturm_minPSI20_Q1050_CumNEE_Winter1718 = cumsum(Sturm_minPSI20_Q1050_NEETotals_Winter1718);
Sturm_minPSI20_Q1050_CumNEE_Winter1819 = cumsum(Sturm_minPSI20_Q1050_NEETotals_Winter1819);
Sturm_minPSI200_Q1050_CumNEE_Winter1617 = cumsum(Sturm_minPSI200_Q1050_NEETotals_Winter1617);
Sturm_minPSI200_Q1050_CumNEE_Winter1718 = cumsum(Sturm_minPSI200_Q1050_NEETotals_Winter1718);
Sturm_minPSI200_Q1050_CumNEE_Winter1819 = cumsum(Sturm_minPSI200_Q1050_NEETotals_Winter1819);
Sturm_minPSI2000_Q1050_CumNEE_Winter1617 = cumsum(Sturm_minPSI2000_Q1050_NEETotals_Winter1617);
Sturm_minPSI2000_Q1050_CumNEE_Winter1718 = cumsum(Sturm_minPSI2000_Q1050_NEETotals_Winter1718);
Sturm_minPSI2000_Q1050_CumNEE_Winter1819 = cumsum(Sturm_minPSI2000_Q1050_NEETotals_Winter1819);
Sturm_Q1075_CumNEE_Winter1617 = cumsum(Sturm_Q1075_NEETotals_Winter1617);
Sturm_Q1075_CumNEE_Winter1718 = cumsum(Sturm_Q1075_NEETotals_Winter1718);
Sturm_Q1075_CumNEE_Winter1819 = cumsum(Sturm_Q1075_NEETotals_Winter1819);
Sturm_minPSI20_Q1075_CumNEE_Winter1617 = cumsum(Sturm_minPSI20_Q1075_NEETotals_Winter1617);
Sturm_minPSI20_Q1075_CumNEE_Winter1718 = cumsum(Sturm_minPSI20_Q1075_NEETotals_Winter1718);
Sturm_minPSI20_Q1075_CumNEE_Winter1819 = cumsum(Sturm_minPSI20_Q1075_NEETotals_Winter1819);
Sturm_minPSI200_Q1075_CumNEE_Winter1617 = cumsum(Sturm_minPSI200_Q1075_NEETotals_Winter1617);
Sturm_minPSI200_Q1075_CumNEE_Winter1718 = cumsum(Sturm_minPSI200_Q1075_NEETotals_Winter1718);
Sturm_minPSI200_Q1075_CumNEE_Winter1819 = cumsum(Sturm_minPSI200_Q1075_NEETotals_Winter1819);
Sturm_minPSI2000_Q1075_CumNEE_Winter1617 = cumsum(Sturm_minPSI2000_Q1075_NEETotals_Winter1617);
Sturm_minPSI2000_Q1075_CumNEE_Winter1718 = cumsum(Sturm_minPSI2000_Q1075_NEETotals_Winter1718);
Sturm_minPSI2000_Q1075_CumNEE_Winter1819 = cumsum(Sturm_minPSI2000_Q1075_NEETotals_Winter1819);

%% Gapfilling of Cumulative Obs

% Gapfill weekly means
NEEObs_Weekly_1718 = (FilledObs_Weekly.NEE_filled(251:283));

figure()
hold on
plot(NEEObs_Weekly_1718(1:6))
plot(NEEObs_Weekly_1718(16:21))
% check to see if major gradient to line either side of hole, doesn't look
% it to me
z = vertcat(NEEObs_Weekly_1718(1:6),NEEObs_Weekly_1718(16:21));
fillvalue = mean(z);
NEEObs_WeeklyFilled_1718= fillmissing(NEEObs_Weekly_1718,'constant',fillvalue);

% Cumulative obs
NEEObs_WeeklyTotals_1718 = (NEEObs_WeeklyFilled_1718*(60*60))*24*7;
CumNEEObsFilled_1718 = cumsum(NEEObs_WeeklyTotals_1718);
b = 0.1; % starts from zero, but zero won't plot on log axis
CumNEEObsFilled_1718 = vertcat(b,CumNEEObsFilled_1718);
CumNEEObs_1718 = CumNEEObsFilled_1718;
CumNEEObs_1718(8:16)=NaN;

% Cumulative error
c = FilledObs_Weekly.NEE_filled_unc(251:283);
c = c*60*60*24*7; % converts from per second to weekly total
c = fillmissing(c,'nearest'); 
a = zeros(1,(1+length(CumNEEObs_1718)));
a(1) = c(1);
for i = 2:length(CumNEEObs_1718)
    b = a(i-1);
    a(i) = sqrt((b.^2)+((c(i)).^2));
    clear b
end
b = 0.1; % starts from zero, but zero won't plot on log axis
a = horzcat(b,a);
CumNEEUnc_1718 = a;
% clear a b

%% ANOVA for cum sum

% Ψmin
% 16-17
a = horzcat(Run0_CumNEE_Winter1617(end),Q1025_CumNEE_Winter1617(end),Q1050_CumNEE_Winter1617(end),Q1075_CumNEE_Winter1617(end),...
    Sturm_CumNEE_Winter1617(end),Sturm_Q1025_CumNEE_Winter1617(end),Sturm_Q1050_CumNEE_Winter1617(end),Sturm_Q1075_CumNEE_Winter1617(end)); % Default Ψmin
b = horzcat(minPSI20_CumNEE_Winter1617(end),minPSI20_Q1025_CumNEE_Winter1617(end),minPSI20_Q1050_CumNEE_Winter1617(end),minPSI20_Q1075_CumNEE_Winter1617(end),...
    Sturm_minPSI20_CumNEE_Winter1617(end),Sturm_minPSI20_Q1025_CumNEE_Winter1617(end),Sturm_minPSI20_Q1050_CumNEE_Winter1617(end),Sturm_minPSI20_Q1075_CumNEE_Winter1617(end)); % Ψmin = -20
c = horzcat(minPSI200_CumNEE_Winter1617(end),minPSI200_Q1025_CumNEE_Winter1617(end),minPSI200_Q1050_CumNEE_Winter1617(end),minPSI200_Q1075_CumNEE_Winter1617(end),...
    Sturm_minPSI200_CumNEE_Winter1617(end),Sturm_minPSI200_Q1025_CumNEE_Winter1617(end),Sturm_minPSI200_Q1050_CumNEE_Winter1617(end),Sturm_minPSI200_Q1075_CumNEE_Winter1617(end)); % Ψmin = -200
d = horzcat(minPSI2000_CumNEE_Winter1617(end),minPSI2000_Q1025_CumNEE_Winter1617(end),minPSI2000_Q1050_CumNEE_Winter1617(end),minPSI2000_Q1075_CumNEE_Winter1617(end),...
    Sturm_minPSI2000_CumNEE_Winter1617(end),Sturm_minPSI2000_Q1025_CumNEE_Winter1617(end),Sturm_minPSI2000_Q1050_CumNEE_Winter1617(end),Sturm_minPSI2000_Q1075_CumNEE_Winter1617(end)); % Ψmin = -2000

minPSI_ANOVA_CumSumNEE_1617 = vertcat(a,b,c,d); % One column per Ψmin value
clear a b c d
minPSI_ANOVA_CumSumNEE_1617 = rot90(minPSI_ANOVA_CumSumNEE_1617);
[p_minPSI_ANOVA_CumSumNEE_1617,tbl_minPSI_ANOVA_CumSumNEE_1617,stats_minPSI_ANOVA_CumSumNEE_1617] = anova1(minPSI_ANOVA_CumSumNEE_1617);
multcompare(stats_minPSI_ANOVA_CumSumNEE_1617,'Alpha',0.001)

% 17-18
a = horzcat(Run0_CumNEE_Winter1718(end),Q1025_CumNEE_Winter1718(end),Q1050_CumNEE_Winter1718(end),Q1075_CumNEE_Winter1718(end),...
    Sturm_CumNEE_Winter1718(end),Sturm_Q1025_CumNEE_Winter1718(end),Sturm_Q1050_CumNEE_Winter1718(end),Sturm_Q1075_CumNEE_Winter1718(end)); % Default Ψmin
b = horzcat(minPSI20_CumNEE_Winter1718(end),minPSI20_Q1025_CumNEE_Winter1718(end),minPSI20_Q1050_CumNEE_Winter1718(end),minPSI20_Q1075_CumNEE_Winter1718(end),...
    Sturm_minPSI20_CumNEE_Winter1718(end),Sturm_minPSI20_Q1025_CumNEE_Winter1718(end),Sturm_minPSI20_Q1050_CumNEE_Winter1718(end),Sturm_minPSI20_Q1075_CumNEE_Winter1718(end)); % Ψmin = -20
c = horzcat(minPSI200_CumNEE_Winter1718(end),minPSI200_Q1025_CumNEE_Winter1718(end),minPSI200_Q1050_CumNEE_Winter1718(end),minPSI200_Q1075_CumNEE_Winter1718(end),...
    Sturm_minPSI200_CumNEE_Winter1718(end),Sturm_minPSI200_Q1025_CumNEE_Winter1718(end),Sturm_minPSI200_Q1050_CumNEE_Winter1718(end),Sturm_minPSI200_Q1075_CumNEE_Winter1718(end)); % Ψmin = -200
d = horzcat(minPSI2000_CumNEE_Winter1718(end),minPSI2000_Q1025_CumNEE_Winter1718(end),minPSI2000_Q1050_CumNEE_Winter1718(end),minPSI2000_Q1075_CumNEE_Winter1718(end),...
    Sturm_minPSI2000_CumNEE_Winter1718(end),Sturm_minPSI2000_Q1025_CumNEE_Winter1718(end),Sturm_minPSI2000_Q1050_CumNEE_Winter1718(end),Sturm_minPSI2000_Q1075_CumNEE_Winter1718(end)); % Ψmin = -2000

minPSI_ANOVA_CumSumNEE_1718 = vertcat(a,b,c,d); % One column per Ψmin value
clear a b c d
minPSI_ANOVA_CumSumNEE_1718 = rot90(minPSI_ANOVA_CumSumNEE_1718);
[p_minPSI_ANOVA_CumSumNEE_1718,tbl_minPSI_ANOVA_CumSumNEE_1718,stats_minPSI_ANOVA_CumSumNEE_1718] = anova1(minPSI_ANOVA_CumSumNEE_1718);
multcompare(stats_minPSI_ANOVA_CumSumNEE_1718,'Alpha',0.001)

% 18-19
a = horzcat(Run0_CumNEE_Winter1819(end),Q1025_CumNEE_Winter1819(end),Q1050_CumNEE_Winter1819(end),Q1075_CumNEE_Winter1819(end),...
    Sturm_CumNEE_Winter1819(end),Sturm_Q1025_CumNEE_Winter1819(end),Sturm_Q1050_CumNEE_Winter1819(end),Sturm_Q1075_CumNEE_Winter1819(end)); % Default Ψmin
b = horzcat(minPSI20_CumNEE_Winter1819(end),minPSI20_Q1025_CumNEE_Winter1819(end),minPSI20_Q1050_CumNEE_Winter1819(end),minPSI20_Q1075_CumNEE_Winter1819(end),...
    Sturm_minPSI20_CumNEE_Winter1819(end),Sturm_minPSI20_Q1025_CumNEE_Winter1819(end),Sturm_minPSI20_Q1050_CumNEE_Winter1819(end),Sturm_minPSI20_Q1075_CumNEE_Winter1819(end)); % Ψmin = -20
c = horzcat(minPSI200_CumNEE_Winter1819(end),minPSI200_Q1025_CumNEE_Winter1819(end),minPSI200_Q1050_CumNEE_Winter1819(end),minPSI200_Q1075_CumNEE_Winter1819(end),...
    Sturm_minPSI200_CumNEE_Winter1819(end),Sturm_minPSI200_Q1025_CumNEE_Winter1819(end),Sturm_minPSI200_Q1050_CumNEE_Winter1819(end),Sturm_minPSI200_Q1075_CumNEE_Winter1819(end)); % Ψmin = -200
d = horzcat(minPSI2000_CumNEE_Winter1819(end),minPSI2000_Q1025_CumNEE_Winter1819(end),minPSI2000_Q1050_CumNEE_Winter1819(end),minPSI2000_Q1075_CumNEE_Winter1819(end),...
    Sturm_minPSI2000_CumNEE_Winter1819(end),Sturm_minPSI2000_Q1025_CumNEE_Winter1819(end),Sturm_minPSI2000_Q1050_CumNEE_Winter1819(end),Sturm_minPSI2000_Q1075_CumNEE_Winter1819(end)); % Ψmin = -2000

minPSI_ANOVA_CumSumNEE_1819 = vertcat(a,b,c,d); % One column per Ψmin value
clear a b c d
minPSI_ANOVA_CumSumNEE_1819 = rot90(minPSI_ANOVA_CumSumNEE_1819);
[p_minPSI_ANOVA_CumSumNEE_1819,tbl_minPSI_ANOVA_CumSumNEE_1819,stats_minPSI_ANOVA_CumSumNEE_1819] = anova1(minPSI_ANOVA_CumSumNEE_1819);
multcompare(stats_minPSI_ANOVA_CumSumNEE_1819,'Alpha',0.001)

% Q10

% 16-17
a = horzcat(Run0_CumNEE_Winter1617(end),minPSI20_CumNEE_Winter1617(end),minPSI200_CumNEE_Winter1617(end),minPSI2000_CumNEE_Winter1617(end), ...
    Sturm_CumNEE_Winter1617(end),Sturm_minPSI20_CumNEE_Winter1617(end),Sturm_minPSI200_CumNEE_Winter1617(end),Sturm_minPSI2000_CumNEE_Winter1617(end)); % Q10 = 1.5
b = horzcat(Q1025_CumNEE_Winter1617(end),minPSI20_Q1025_CumNEE_Winter1617(end),minPSI200_Q1025_CumNEE_Winter1617(end),minPSI2000_Q1025_CumNEE_Winter1617(end), ...
    Sturm_Q1025_CumNEE_Winter1617(end),Sturm_minPSI20_Q1025_CumNEE_Winter1617(end),Sturm_minPSI200_Q1025_CumNEE_Winter1617(end),Sturm_minPSI2000_Q1025_CumNEE_Winter1617(end)); %Q10 = 2.5
c = horzcat(Q1050_CumNEE_Winter1617(end),minPSI20_Q1050_CumNEE_Winter1617(end),minPSI200_Q1050_CumNEE_Winter1617(end),minPSI2000_Q1050_CumNEE_Winter1617(end), ...
    Sturm_Q1050_CumNEE_Winter1617(end),Sturm_minPSI20_Q1050_CumNEE_Winter1617(end),Sturm_minPSI200_Q1050_CumNEE_Winter1617(end),Sturm_minPSI2000_Q1050_CumNEE_Winter1617(end)); % Q10 = 5.0
d = horzcat(Q1075_CumNEE_Winter1617(end),minPSI20_Q1075_CumNEE_Winter1617(end),minPSI200_Q1075_CumNEE_Winter1617(end),minPSI2000_Q1075_CumNEE_Winter1617(end), ...
    Sturm_Q1075_CumNEE_Winter1617(end),Sturm_minPSI20_Q1075_CumNEE_Winter1617(end),Sturm_minPSI200_Q1075_CumNEE_Winter1617(end),Sturm_minPSI2000_Q1075_CumNEE_Winter1617(end)); % Q10 = 7.5

Q10_ANOVA_CumSumNEE_1617 = vertcat(a,b,c,d); % One column per Q10 value
clear a b c d
Q10_ANOVA_CumSumNEE_1617 = rot90(Q10_ANOVA_CumSumNEE_1617);
[p_Q10_ANOVA_CumSumNEE_1617,tbl_Q10_ANOVA_CumSumNEE_1617,stats_Q10_ANOVA_CumSumNEE_1617] = anova1(Q10_ANOVA_CumSumNEE_1617);
multcompare(stats_Q10_ANOVA_CumSumNEE_1617,'Alpha',0.001)

% 17-18
a = horzcat(Run0_CumNEE_Winter1718(end),minPSI20_CumNEE_Winter1718(end),minPSI200_CumNEE_Winter1718(end),minPSI2000_CumNEE_Winter1718(end), ...
    Sturm_CumNEE_Winter1718(end),Sturm_minPSI20_CumNEE_Winter1718(end),Sturm_minPSI200_CumNEE_Winter1718(end),Sturm_minPSI2000_CumNEE_Winter1718(end)); % Q10 = 1.5
b = horzcat(Q1025_CumNEE_Winter1718(end),minPSI20_Q1025_CumNEE_Winter1718(end),minPSI200_Q1025_CumNEE_Winter1718(end),minPSI2000_Q1025_CumNEE_Winter1718(end), ...
    Sturm_Q1025_CumNEE_Winter1718(end),Sturm_minPSI20_Q1025_CumNEE_Winter1718(end),Sturm_minPSI200_Q1025_CumNEE_Winter1718(end),Sturm_minPSI2000_Q1025_CumNEE_Winter1718(end)); %Q10 = 2.5
c = horzcat(Q1050_CumNEE_Winter1718(end),minPSI20_Q1050_CumNEE_Winter1718(end),minPSI200_Q1050_CumNEE_Winter1718(end),minPSI2000_Q1050_CumNEE_Winter1718(end), ...
    Sturm_Q1050_CumNEE_Winter1718(end),Sturm_minPSI20_Q1050_CumNEE_Winter1718(end),Sturm_minPSI200_Q1050_CumNEE_Winter1718(end),Sturm_minPSI2000_Q1050_CumNEE_Winter1718(end)); % Q10 = 5.0
d = horzcat(Q1075_CumNEE_Winter1718(end),minPSI20_Q1075_CumNEE_Winter1718(end),minPSI200_Q1075_CumNEE_Winter1718(end),minPSI2000_Q1075_CumNEE_Winter1718(end), ...
    Sturm_Q1075_CumNEE_Winter1718(end),Sturm_minPSI20_Q1075_CumNEE_Winter1718(end),Sturm_minPSI200_Q1075_CumNEE_Winter1718(end),Sturm_minPSI2000_Q1075_CumNEE_Winter1718(end)); % Q10 = 7.5

Q10_ANOVA_CumSumNEE_1718 = vertcat(a,b,c,d); % One column per Q10 value
clear a b c d
Q10_ANOVA_CumSumNEE_1718 = rot90(Q10_ANOVA_CumSumNEE_1718);
[p_Q10_ANOVA_CumSumNEE_1718,tbl_Q10_ANOVA_CumSumNEE_1718,stats_Q10_ANOVA_CumSumNEE_1718] = anova1(Q10_ANOVA_CumSumNEE_1718);
multcompare(stats_Q10_ANOVA_CumSumNEE_1718,'Alpha',0.001)

% 18-19
a = horzcat(Run0_CumNEE_Winter1819(end),minPSI20_CumNEE_Winter1819(end),minPSI200_CumNEE_Winter1819(end),minPSI2000_CumNEE_Winter1819(end), ...
    Sturm_CumNEE_Winter1819(end),Sturm_minPSI20_CumNEE_Winter1819(end),Sturm_minPSI200_CumNEE_Winter1819(end),Sturm_minPSI2000_CumNEE_Winter1819(end)); % Q10 = 1.5
b = horzcat(Q1025_CumNEE_Winter1819(end),minPSI20_Q1025_CumNEE_Winter1819(end),minPSI200_Q1025_CumNEE_Winter1819(end),minPSI2000_Q1025_CumNEE_Winter1819(end), ...
    Sturm_Q1025_CumNEE_Winter1819(end),Sturm_minPSI20_Q1025_CumNEE_Winter1819(end),Sturm_minPSI200_Q1025_CumNEE_Winter1819(end),Sturm_minPSI2000_Q1025_CumNEE_Winter1819(end)); %Q10 = 2.5
c = horzcat(Q1050_CumNEE_Winter1819(end),minPSI20_Q1050_CumNEE_Winter1819(end),minPSI200_Q1050_CumNEE_Winter1819(end),minPSI2000_Q1050_CumNEE_Winter1819(end), ...
    Sturm_Q1050_CumNEE_Winter1819(end),Sturm_minPSI20_Q1050_CumNEE_Winter1819(end),Sturm_minPSI200_Q1050_CumNEE_Winter1819(end),Sturm_minPSI2000_Q1050_CumNEE_Winter1819(end)); % Q10 = 5.0
d = horzcat(Q1075_CumNEE_Winter1819(end),minPSI20_Q1075_CumNEE_Winter1819(end),minPSI200_Q1075_CumNEE_Winter1819(end),minPSI2000_Q1075_CumNEE_Winter1819(end), ...
    Sturm_Q1075_CumNEE_Winter1819(end),Sturm_minPSI20_Q1075_CumNEE_Winter1819(end),Sturm_minPSI200_Q1075_CumNEE_Winter1819(end),Sturm_minPSI2000_Q1075_CumNEE_Winter1819(end)); % Q10 = 7.5

Q10_ANOVA_CumSumNEE_1819 = vertcat(a,b,c,d); % One column per Q10 value
clear a b c d
Q10_ANOVA_CumSumNEE_1819 = rot90(Q10_ANOVA_CumSumNEE_1819);
[p_Q10_ANOVA_CumSumNEE_1819,tbl_Q10_ANOVA_CumSumNEE_1819,stats_Q10_ANOVA_CumSumNEE_1819] = anova1(Q10_ANOVA_CumSumNEE_1819);
multcompare(stats_Q10_ANOVA_CumSumNEE_1819,'Alpha',0.001)

%% Figure 5 - Cumulative plot with observations
% plot
cd 'D:\Work\Uni_Work\PHD\Modelling\CLM\Output Data From CLM\Paper 2\GitRepo\TVC\Observations' % for shaded plot command
% use datenums for shadedplot command
T = datenum(Run0_1500CT_Daily.Time(1746:1976));
t = datenum(FilledObs_Weekly.TIMESTAMP(250:283));
Sturm_CumNEE_Winter1718_p = rot90(Sturm_CumNEE_Winter1718);
Sturm_minPSI20_CumNEE_Winter1718_p = rot90(Sturm_minPSI20_CumNEE_Winter1718);
Sturm_minPSI200_CumNEE_Winter1718_p = rot90(Sturm_minPSI200_CumNEE_Winter1718);
Sturm_minPSI2000_CumNEE_Winter1718_p = rot90(Sturm_minPSI2000_CumNEE_Winter1718);
Sturm_Q1075_CumNEE_Winter1718_p = rot90(Sturm_Q1075_CumNEE_Winter1718);
Sturm_minPSI20_Q1075_CumNEE_Winter1718_p = rot90(Sturm_minPSI20_Q1075_CumNEE_Winter1718);
Sturm_minPSI200_Q1075_CumNEE_Winter1718_p = rot90(Sturm_minPSI200_Q1075_CumNEE_Winter1718);
Sturm_minPSI2000_Q1075_CumNEE_Winter1718_p = rot90(Sturm_minPSI2000_Q1075_CumNEE_Winter1718);

figure()
hold on
% model runs
z = plot(T,Run0_CumNEE_Winter1718,'Color', [0.6350 0.0780 0.1840],'LineWidth',1.5)
y = shadedplot(T,Sturm_CumNEE_Winter1718_p,Sturm_Q1075_CumNEE_Winter1718_p,[0 0.2235 0.3705],[0 0.2235 0.3705]);
alpha(0.4)
hold on
y = plot(T,Sturm_CumNEE_Winter1718_p,'Color', [0 0.2235 0.3705],'LineWidth',1.5)
hold on
x = shadedplot(T,Sturm_minPSI20_CumNEE_Winter1718_p,Sturm_minPSI20_Q1075_CumNEE_Winter1718_p,[0.1804 0.3529 0.5333],[0.1804 0.3529 0.5333]);
alpha(0.4)
hold on
w = shadedplot(T,Sturm_minPSI200_CumNEE_Winter1718_p,Sturm_minPSI200_Q1075_CumNEE_Winter1718_p,[0.2667 0.5569 0.8941],[0.2667 0.5569 0.8941]);
alpha(0.4)
hold on
v = shadedplot(T,Sturm_minPSI2000_CumNEE_Winter1718_p,Sturm_minPSI2000_Q1075_CumNEE_Winter1718_p,[0.5098 0.7961 0.6980],[0.5098 0.7961 0.6980]);
alpha(0.4)
hold on
% obs and uncertainity
% for i = 1:length(CumNEEObs_1718)
% curve1(i) = CumNEEObs_1718(i) + CumNEEUnc_1718(i);
% curve2(i) = CumNEEObs_1718(i) - CumNEEUnc_1718(i);
% end
% u = shadedplot(t,curve1,curve2,[0.6 0.6 0.6],[0.6 0.6 0.6]);
% hold on
% plot(T,curve1, 'Color', [0.6 0.6 0.6], 'LineWidth', 2);
% plot(T,curve2, 'Color', [0.6 0.6 0.6], 'LineWidth', 2);
errorbar(t,CumNEEObs_1718,CumNEEUnc_1718,'k','LineStyle','none', 'LineWidth', 1.25)
u = plot(t,CumNEEObs_1718,'kx','LineWidth',1.5)
stairs(t,CumNEEObsFilled_1718,'k--', 'LineWidth', 1.25)
shading_x = [t(8) t(16) t(16) t(8)]
shading_y = [0 0 450 450 ]
xline(t(16));
patch('XData',shading_x,'YData',shading_y,'FaceColor',[0.6 0.6 0.6],'FaceAlpha',0.4)
% set(gca, 'YScale', 'log')
ylim([0 450]) 
ylabel('Cumulative NEE [g C m^2]')
datetick('x')
leg = [z y x(2) w(2) v(2) u] %
legend(leg, {'Default CLM', 'Ψ_{min} = -2 MPa', 'Ψ_{min} = -20 MPa', 'Ψ_{min} = -200 MPa', 'Ψ_{min} = -2000 MPa', 'Obs'}, 'Location','NorthWest');
legend boxoff
set(gca,'FontSize',14)

%% EC Data Coverage
% Count_NaNNEE = sum(isnan(FilteredObs.NEE_filt(RANGE))); % number of NaN values for whole timeseries, add range once decided exactly when you're looking at/triple check period when NEE tower in use.
% Count_NEE = numel(FilteredObs.NEE_filt(RANGE));
% Percent_NaNNEE = (Count_NaNNEE/Count_NEE)*100;
% for gapfilled data
Count_NaNNEE_Winter1617 = sum(isnan(FilledObs.NEE_filled(66435:76692)));
Count_NaNNEE_Winter1718 = sum(isnan(FilledObs.NEE_filled(84155:94849)));
Count_NaNNEE_Winter1819 = sum(isnan(FilledObs.NEE_filled(100437:111979)));
Count_NEE_Winter1617 = numel(FilledObs.NEE_filled(66435:76692));
Count_NEE_Winter1718 = numel(FilledObs.NEE_filled(84155:94849));
Count_NEE_Winter1819 = numel(FilledObs.NEE_filled(100437:111979));
Percent_NaNNEE_Winter1617_Filled = (Count_NaNNEE_Winter1617/Count_NEE_Winter1617)*100;
Percent_NaNNEE_Winter1718_Filled = (Count_NaNNEE_Winter1718/Count_NEE_Winter1718)*100;
Percent_NaNNEE_Winter1819_Filled = (Count_NaNNEE_Winter1819/Count_NEE_Winter1819)*100;
Percent_DataAvail_Winter1617_Filled = 100 - Percent_NaNNEE_Winter1617_Filled
Percent_DataAvail_Winter1718_Filled = 100 - Percent_NaNNEE_Winter1718_Filled
Percent_DataAvail_Winter1819_Filled = 100 - Percent_NaNNEE_Winter1819_Filled

% daily min, mean, max, median, std dev?
% meanNEE_Obs_Winter1617 = nanmean(RawObs.NEE_Filt_4SD(66435:76692));
% meanNEE_Obs_Winter1718 = nanmean(RawObs.NEE_Filt_4SD(84155:94849));
% meanNEE_Obs_Winter1819 = nanmean(RawObs.NEE_Filt_4SD(100437:111979));
% stdevNEE_Obs_Winter1617 = nanstd(RawObs.NEE_Filt_4SD(66435:76692));
% stdevNEE_Obs_Winter1718 = nanstd(RawObs.NEE_Filt_4SD(84155:94849));
% stdevNEE_Obs_Winter1819 = nanstd(RawObs.NEE_Filt_4SD(100437:111979));

%% Supp. Fig.  1
% EC Data Quality
cd 'D:\PhD Work\Data\Paper2Data_ToUpload\GitRepo_19.01.2023\TVCObs'
FluxCorrections = readtimetable('FluxCorrections_threasholds.csv');

% Plot
figure()
t = tiledlayout(3,1,'TileSpacing','compact');
nexttile % Winter 16-17
hold on
plot(FilledObs.TIMESTAMP,FilledObs.NEE_filled,'Color',[0.5 0.5 0.5]);
plot(FluxCorrections.date, FluxCorrections.co2_flux,'Color',[0.6350 0.0780 0.1840]);
plot(FluxCorrections.date, FluxCorrections.Flux_QWPL_threashold1,'Color', [0.4660 0.6740 0.1880]);
% plot(FluxCorrections.date, FluxCorrections.Flux_QWPL_threashold05);
hold off
xlim([SnowOn_1617 SnowOff_1617])
xline(start_mw_1617,'k--')
xline(start_thw_1617,'k--')
ylim([-10 10])
nexttile % Winter 17-18
hold on
plot(FilledObs.TIMESTAMP,FilledObs.NEE_filled,'Color',[0.5 0.5 0.5]);
plot(FluxCorrections.date, FluxCorrections.co2_flux,'Color',[0.6350 0.0780 0.1840]);
plot(FluxCorrections.date, FluxCorrections.Flux_QWPL_threashold1,'Color', [0.4660 0.6740 0.1880]);
% plot(FluxCorrections.date, FluxCorrections.Flux_QWPL_threashold05);
hold off
xlim([SnowOn_1718 SnowOff_1718])
xline(start_mw_1718,'k--')
xline(start_thw_1718,'k--')
ylim([-10 10])
nexttile % Winter 18-19
hold on
plot(FilledObs.TIMESTAMP,FilledObs.NEE_filled,'Color',[0.5 0.5 0.5]);
plot(FluxCorrections.date, FluxCorrections.co2_flux,'Color',[0.6350 0.0780 0.1840]); % why has a lot of this data not plotted?
plot(FluxCorrections.date, FluxCorrections.Flux_QWPL_threashold1,'Color', [0.4660 0.6740 0.1880]);
% plot(FluxCorrections.date, FluxCorrections.Flux_QWPL_threashold05);
hold off
xlim([SnowOn_1819 SnowOff_1819])
xline(start_mw_1819,'k--')
xline(start_thw_1819,'k--')
ylim([-10 10])
legend('Gapfilled','QWPL > 1', 'QWPL < 1')%, 'QWPL > 0.5');
legend boxoff
ylabel(t,'CO_2 Flux [μmol m^{-2} s^{-1}]');

%% Supp. Fig. 2: QWPL Box Plot

% colours
a = [0.4660 0.6740 0.1880];
b = [0.6350 0.0780 0.1840];
c = [0.5 0.5 0.5];
colours = vertcat(a,b,c);
clear a b c

% reorder to plot
a = FluxCorrections.Flux_QWPL_threashold1(SnowOn_1617:SnowOff_1617); % Good QWPL
b = FluxCorrections.co2_flux(SnowOn_1617:SnowOff_1617); % Poor QWPL
c = FilledObs.NEE_filled(SnowOn_1617:SnowOff_1617); % Gapfilled
n = (numel(c)) - (numel(a));
x = NaN(n,1);
a = vertcat(a,x);
b = vertcat(b,x);
EC_1617bp = horzcat(a,b,c);
clear a b c n x

a = FluxCorrections.Flux_QWPL_threashold1(SnowOn_1718:SnowOff_1718); % Good QWPL
b = FluxCorrections.co2_flux(SnowOn_1718:SnowOff_1718); % Poor QWPL
c = FilledObs.NEE_filled(SnowOn_1718:SnowOff_1718); % Gapfilled
n = (numel(c)) - (numel(a));
x = NaN(n,1);
a = vertcat(a,x);
b = vertcat(b,x);
EC_1718bp = horzcat(a,b,c);
clear a b c n x

a = FluxCorrections.Flux_QWPL_threashold1(SnowOn_1819:SnowOff_1819); % Good QWPL
b = FluxCorrections.co2_flux(SnowOn_1819:SnowOff_1819); % Poor QWPL
c = FilledObs.NEE_filled(SnowOn_1819:SnowOff_1819); % Gapfilled
n = (numel(c)) - (numel(a));
x = NaN(n,1);
a = vertcat(a,x);
b = vertcat(b,x);
EC_1819bp = horzcat(a,b,c);
clear a b c n x

figure()
t = tiledlayout(3,1,'tilespacing','none')
nexttile
boxplot(EC_1617bp,'Colors', colours,'Symbol', '');
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),get(h(j),'Color'),'FaceAlpha',.5);
end
ylim([-1.2 3])
set(gca,'TickDir','out');
box off
% title('Winter 16-17')
text(0.75, 2.5, 'a) Winter 16 - 17') % add letter
xticks([])
nexttile
boxplot(EC_1718bp,'Colors', colours,'Symbol', '');
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),get(h(j),'Color'),'FaceAlpha',.5);
end
ylim([-1.2 3])
set(gca,'TickDir','out');
box off
% title('Winter 17-18')
text(0.75, 2.5, 'b) Winter 17 - 18') % add letter
xticks([])
ylabel('NEE [μmol CO_2 m^{-2} s^{-1}]')
nexttile()
boxplot(EC_1819bp,'Colors', colours,'Symbol', '', 'Labels', {'QWPL < 1','QWPL > 1','Gapfilled'});
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),get(h(j),'Color'),'FaceAlpha',.5);
end
ylim([-1.2 3])
set(gca,'TickDir','out');
box off
text(0.75, 2.5, 'c) Winter 18 - 19') % add letter

%% Stats for Supplement
% Percentages for Supp Table
% Percent QC of whole winter
Count_Winter1617 = numel(FluxCorrections.date(SnowOn_1617:SnowOff_1617));
QWPL_threashold1_Count_Winter1617 = sum(FluxCorrections.QWPL_threashold1_logical(SnowOn_1617:SnowOff_1617));
QWPL_threashold1_Percent_Winter1617 = (QWPL_threashold1_Count_Winter1617/Count_Winter1617)*100
QWPL_threashold1_FAIL_Count_Winter1617 = sum(FluxCorrections.QWPL_threashold1_FAIL_logical(SnowOn_1617:SnowOff_1617),'omitnan');
QWPL_threashold1_FAIL_Percent_Winter1617 = (QWPL_threashold1_FAIL_Count_Winter1617/Count_Winter1617)*100
Percent_Gapfilled_Winter1617 = Percent_DataAvail_Winter1617_Filled - (QWPL_threashold1_FAIL_Percent_Winter1617 + QWPL_threashold1_Percent_Winter1617)

Count_Winter1718 = numel(FluxCorrections.date(SnowOn_1718:SnowOff_1718));
QWPL_threashold1_Count_Winter1718 = sum(FluxCorrections.QWPL_threashold1_logical(SnowOn_1718:SnowOff_1718));
QWPL_threashold1_Percent_Winter1718 = (QWPL_threashold1_Count_Winter1718/Count_Winter1718)*100;
QWPL_threashold1_FAIL_Count_Winter1718 = sum(FluxCorrections.QWPL_threashold1_FAIL_logical(SnowOn_1718:SnowOff_1718),'omitnan');
QWPL_threashold1_FAIL_Percent_Winter1718 = (QWPL_threashold1_FAIL_Count_Winter1718/Count_Winter1718)*100;
Percent_Gapfilled_Winter1718 = Percent_DataAvail_Winter1718_Filled - (QWPL_threashold1_FAIL_Percent_Winter1718 + QWPL_threashold1_Percent_Winter1718);

Count_Winter1819 = numel(FluxCorrections.date(SnowOn_1819:SnowOff_1819));
QWPL_threashold1_Count_Winter1819 = sum(FluxCorrections.QWPL_threashold1_logical(SnowOn_1819:SnowOff_1819));
QWPL_threashold1_Percent_Winter1819 = (QWPL_threashold1_Count_Winter1819/Count_Winter1819)*100;
QWPL_threashold1_FAIL_Count_Winter1819 = sum(FluxCorrections.QWPL_threashold1_FAIL_logical(SnowOn_1819:SnowOff_1819),'omitnan');
QWPL_threashold1_FAIL_Percent_Winter1819 = (QWPL_threashold1_FAIL_Count_Winter1819/Count_Winter1819)*100;
Percent_Gapfilled_Winter1819 = Percent_DataAvail_Winter1819_Filled - (QWPL_threashold1_FAIL_Percent_Winter1819 + QWPL_threashold1_Percent_Winter1819);

% Percent QC of measured winter values
Count_NotNaN_Winter1617 = sum(~isnan(FluxCorrections.co2_flux(SnowOn_1617:SnowOff_1617)));
QWPL_threashold1_Percent_Avail_Winter1617 = (QWPL_threashold1_Count_Winter1617/Count_NotNaN_Winter1617)*100;
QWPL_threashold1_FAIL_Percent_Avail_Winter1617 = 100 - QWPL_threashold1_Percent_Avail_Winter1617;
Count_NotNaN_Winter1718 = sum(~isnan(FluxCorrections.co2_flux(SnowOn_1718:SnowOff_1718)));
QWPL_threashold1_Percent_Avail_Winter1718 = (QWPL_threashold1_Count_Winter1718/Count_NotNaN_Winter1718)*100;
QWPL_threashold1_FAIL_Percent_Avail_Winter1718 = 100 - QWPL_threashold1_Percent_Avail_Winter1718;
Count_NotNaN_Winter1819 = sum(~isnan(FluxCorrections.co2_flux(SnowOn_1819:SnowOff_1819)));
QWPL_threashold1_Percent_Avail_Winter1819 = (QWPL_threashold1_Count_Winter1819/Count_NotNaN_Winter1819)*100;
QWPL_threashold1_FAIL_Percent_Avail_Winter1819 = 100 - QWPL_threashold1_Percent_Avail_Winter1819;

% ANOVA - do 3 groups significantly differ???
a = FluxCorrections.Flux_QWPL_threashold1(SnowOn_1617:SnowOff_1617); % Good QWPL
b = FluxCorrections.co2_flux(SnowOn_1617:SnowOff_1617); % Poor QWPL
c = FilledObs.NEE_filled(SnowOn_1617:SnowOff_1617); % Gapfilled
n = numel(c);
a(end:n) = NaN;
b(end:n) = NaN;
M_ANOVA_1617 = horzcat(a,b,c);
[p_1617,tbl_1617,stats_1617] = anova1(M_ANOVA_1617);
multcompare(stats_1617,'Alpha',0.001)
clear a b c n

a = FluxCorrections.Flux_QWPL_threashold1(SnowOn_1718:SnowOff_1718); % Good QWPL
b = FluxCorrections.co2_flux(SnowOn_1718:SnowOff_1718); % Poor QWPL
c = FilledObs.NEE_filled(SnowOn_1718:SnowOff_1718); % Gapfilled
n = numel(c);
a(end:n) = NaN;
b(end:n) = NaN;
M_ANOVA_1718 = horzcat(a,b,c);
[p_1718,tbl_1718,stats_1718] = anova1(M_ANOVA_1718);
multcompare(stats_1718,'Alpha',0.001)
clear a b c n

a = FluxCorrections.Flux_QWPL_threashold1(SnowOn_1819:SnowOff_1819); % Good QWPL
b = FluxCorrections.co2_flux(SnowOn_1819:SnowOff_1819); % Poor QWPL
c = FilledObs.NEE_filled(SnowOn_1819:SnowOff_1819); % Gapfilled
n = numel(c);
a(end:n) = NaN;
b(end:n) = NaN;
M_ANOVA_1819 = horzcat(a,b,c);
[p_1819,tbl_1819,stats_1819] = anova1(M_ANOVA_1819);
multcompare(stats_1819,'Alpha',0.001)
clear a b c n

%% Supplementary Fig 3
% NEE Boxplot - 3 subplots (16-17,17-18,18-19), each with all runs on

% colours
a = [0.6350 0.0780 0.1840];
b = [0.8510 0.3294 0.3020];
c = [0.7922 0.4824 0.5020];
d = [1.0000 0.7176 0.8078];
e = [0 0.2235 0.3705];
f = [0.1804 0.3529 0.5333];
g = [0.2667 0.5569 0.8941];
h = [0.5098 0.7961 0.6980];
k = [0.3 0.3 0.3];
colours = vertcat(a,a,a,a,b,b,b,b,c,c,c,c,d,d,d,d,e,e,e,e,f,f,f,f,g,g,g,g,h,h,h,h);
colours2 = vertcat(a,b,c,d,e,f,g,h);
clear a b c d e f g h

% reorder to plot
% NEEObs_1617_Filt = FilteredObs.NEE_Filt_4SD(66435:76692);
NEEObs_1617_GF = FilteredObs.NEE_filled(66435:76692);
% NEEObs_1617 = horzcat(NEEObs_1617_Filt, NEEObs_1617_GF);
a = horzcat(SnowSeasonNEE_1617(:,1), SnowSeasonNEE_1617(:,5), SnowSeasonNEE_1617(:,9),SnowSeasonNEE_1617(:,13)); % Ψmin default J
b = horzcat(SnowSeasonNEE_1617(:,2), SnowSeasonNEE_1617(:,6), SnowSeasonNEE_1617(:,10),SnowSeasonNEE_1617(:,14)); %Ψmin -20 J
c = horzcat(SnowSeasonNEE_1617(:,3), SnowSeasonNEE_1617(:,7), SnowSeasonNEE_1617(:,11),SnowSeasonNEE_1617(:,15)); %Ψmin -200 J
d = horzcat(SnowSeasonNEE_1617(:,4), SnowSeasonNEE_1617(:,8), SnowSeasonNEE_1617(:,12),SnowSeasonNEE_1617(:,16)); %Ψmin -2000 J 
e = horzcat(SnowSeasonNEE_1617(:,17), SnowSeasonNEE_1617(:,21), SnowSeasonNEE_1617(:,25),SnowSeasonNEE_1617(:,29)); % Ψmin default S
f = horzcat(SnowSeasonNEE_1617(:,18), SnowSeasonNEE_1617(:,22), SnowSeasonNEE_1617(:,26),SnowSeasonNEE_1617(:,30)); % Ψmin -20 S
g = horzcat(SnowSeasonNEE_1617(:,19), SnowSeasonNEE_1617(:,23), SnowSeasonNEE_1617(:,27),SnowSeasonNEE_1617(:,31)); % Ψmin -200 S
h = horzcat(SnowSeasonNEE_1617(:,20), SnowSeasonNEE_1617(:,24), SnowSeasonNEE_1617(:,28),SnowSeasonNEE_1617(:,32)); % Ψmin -2000 S 
SnowSeasonNEE_1617bp = horzcat(a,b,c,d,e,f,g,h);
clear a b c d e f g h

% NEEObs_1718_Filt = FilteredObs.NEE_Filt_4SD(84155:94849);
NEEObs_1718_GF = FilteredObs.NEE_filled(84155:94849);
% NEEObs_1718 = horzcat(NEEObs_1718_Filt, NEEObs_1718_GF);
a = horzcat(SnowSeasonNEE_1718(:,1), SnowSeasonNEE_1718(:,5), SnowSeasonNEE_1718(:,9),SnowSeasonNEE_1718(:,13)); % Ψmin default J
b = horzcat(SnowSeasonNEE_1718(:,2), SnowSeasonNEE_1718(:,6), SnowSeasonNEE_1718(:,10),SnowSeasonNEE_1718(:,14)); %Ψmin -20 J
c = horzcat(SnowSeasonNEE_1718(:,3), SnowSeasonNEE_1718(:,7), SnowSeasonNEE_1718(:,11),SnowSeasonNEE_1718(:,15)); %Ψmin -200 J
d = horzcat(SnowSeasonNEE_1718(:,4), SnowSeasonNEE_1718(:,8), SnowSeasonNEE_1718(:,12),SnowSeasonNEE_1718(:,16)); %Ψmin -2000 J 
e = horzcat(SnowSeasonNEE_1718(:,17), SnowSeasonNEE_1718(:,21), SnowSeasonNEE_1718(:,25),SnowSeasonNEE_1718(:,29)); % Ψmin default S
f = horzcat(SnowSeasonNEE_1718(:,18), SnowSeasonNEE_1718(:,22), SnowSeasonNEE_1718(:,26),SnowSeasonNEE_1718(:,30)); % Ψmin -20 S
g = horzcat(SnowSeasonNEE_1718(:,19), SnowSeasonNEE_1718(:,23), SnowSeasonNEE_1718(:,27),SnowSeasonNEE_1718(:,31)); % Ψmin -200 S
h = horzcat(SnowSeasonNEE_1718(:,20), SnowSeasonNEE_1718(:,24), SnowSeasonNEE_1718(:,28),SnowSeasonNEE_1718(:,32)); % Ψmin -2000 S 
SnowSeasonNEE_1718bp = horzcat(a,b,c,d,e,f,g,h);
clear a b c d e f g h

% NEEObs_1819_Filt = FilteredObs.NEE_Filt_4SD(100437:111979);
NEEObs_1819_GF = FilteredObs.NEE_filled(100437:111979);
% NEEObs_1819 = horzcat(NEEObs_1819_Filt, NEEObs_1819_GF);
a = horzcat(SnowSeasonNEE_1819(:,1), SnowSeasonNEE_1819(:,5), SnowSeasonNEE_1819(:,9),SnowSeasonNEE_1819(:,13)); % Ψmin default J
b = horzcat(SnowSeasonNEE_1819(:,2), SnowSeasonNEE_1819(:,6), SnowSeasonNEE_1819(:,10),SnowSeasonNEE_1819(:,14)); %Ψmin -20 J
c = horzcat(SnowSeasonNEE_1819(:,3), SnowSeasonNEE_1819(:,7), SnowSeasonNEE_1819(:,11),SnowSeasonNEE_1819(:,15)); %Ψmin -200 J
d = horzcat(SnowSeasonNEE_1819(:,4), SnowSeasonNEE_1819(:,8), SnowSeasonNEE_1819(:,12),SnowSeasonNEE_1819(:,16)); %Ψmin -2000 J 
e = horzcat(SnowSeasonNEE_1819(:,17), SnowSeasonNEE_1819(:,21), SnowSeasonNEE_1819(:,25),SnowSeasonNEE_1819(:,29)); % Ψmin default S
f = horzcat(SnowSeasonNEE_1819(:,18), SnowSeasonNEE_1819(:,22), SnowSeasonNEE_1819(:,26),SnowSeasonNEE_1819(:,30)); % Ψmin -20 S
g = horzcat(SnowSeasonNEE_1819(:,19), SnowSeasonNEE_1819(:,23), SnowSeasonNEE_1819(:,27),SnowSeasonNEE_1819(:,31)); % Ψmin -200 S
h = horzcat(SnowSeasonNEE_1819(:,20), SnowSeasonNEE_1819(:,24), SnowSeasonNEE_1819(:,28),SnowSeasonNEE_1819(:,32)); % Ψmin -2000 S 
SnowSeasonNEE_1819bp = horzcat(a,b,c,d,e,f,g,h);
clear a b c d e f g h

figure()
t = tiledlayout(3,7,'tilespacing','none')
nexttile([1 6])
boxplot(SnowSeasonNEE_1617bp,'BoxStyle','outline','Color', colours, 'Symbol',''); 
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),get(h(j),'Color'),'FaceAlpha',.5);
end
clear h j 
ylim([-1 3.5])
line([4.5 4.5], [-2 10],'Color','k','Linestyle', ':')
line([8.5 8.5], [-2 10],'Color','k','Linestyle', ':')
line([12.5 12.5], [-2 10],'Color','k','Linestyle', ':')
line([16.5 16.5], [-2 10],'Color','k','Linestyle', '--')
line([20.5 20.5], [-2 10],'Color','k','Linestyle', ':')
line([24.5 24.5], [-2 10],'Color','k','Linestyle', ':')
line([28.5 28.5], [-2 10],'Color','k','Linestyle', ':')
text(3,3,'Ψ_{min} = -2','FontSize',8)
text(7.5,3,'-20','FontSize',8)
text(11.5,3,'-200','FontSize',8)
text(15.5,3,'-2000','FontSize',8)
text(19.5,3,'-2','FontSize',8)
text(23.5,3,'-20','FontSize',8)
text(27.5,3,'-200','FontSize',8)
text(31.5,3,'-2000','FontSize',8)
set(gca,'TickDir','out');
box off
% title('Winter 16-17')
text(0.75, 3, 'a)') % add letter
xticks([])
nexttile
boxplot(NEEObs_1617_GF,'Colors', k,'Symbol',''); 
ylim([-1 3.5])
box off
xticks([])
yticks([])
% subplot(3,1,2)
nexttile([1 6])
boxplot(SnowSeasonNEE_1718bp,'BoxStyle','outline','Color', colours, 'Symbol',''); 
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),get(h(j),'Color'),'FaceAlpha',.5);
end
clear h j 
ylim([-1 3.5])
line([4.5 4.5], [-2 10],'Color','k','Linestyle', ':')
line([8.5 8.5], [-2 10],'Color','k','Linestyle', ':')
line([12.5 12.5], [-2 10],'Color','k','Linestyle', ':')
line([16.5 16.5], [-2 10],'Color','k','Linestyle', '--')
line([20.5 20.5], [-2 10],'Color','k','Linestyle', ':')
line([24.5 24.5], [-2 10],'Color','k','Linestyle', ':')
line([28.5 28.5], [-2 10],'Color','k','Linestyle', ':')
set(gca,'TickDir','out');
box off
% title('Winter 17-18')
text(0.75, 3, 'b)') % add letter
xticks([])
ylabel('NEE [μmol CO_2 m^{-2} s^{-1}]')
nexttile
boxplot(NEEObs_1718_GF,'Colors', k,'Symbol',''); 
ylim([-1 3])
box off
xticks([])
yticks([])
% subplot(3,1,3)
nexttile([1 6])
boxplot(SnowSeasonNEE_1819bp,'BoxStyle','outline','Color', colours, 'Symbol','', ...
    'Labels',{'Q10 = 1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5','1.5','2.5','5.0','7.5'});
h = findobj(gca,'Tag','Box');
for j=1:length(h)
    patch(get(h(j),'XData'),get(h(j),'YData'),get(h(j),'Color'),'FaceAlpha',.5);
end
clear h j 
ylim([-1 3.5])
line([4.5 4.5], [-2 10],'Color','k','Linestyle', ':')
line([8.5 8.5], [-2 10],'Color','k','Linestyle', ':')
line([12.5 12.5], [-2 10],'Color','k','Linestyle', ':')
line([16.5 16.5], [-2 10],'Color','k','Linestyle', '--')
line([20.5 20.5], [-2 10],'Color','k','Linestyle', ':')
line([24.5 24.5], [-2 10],'Color','k','Linestyle', ':')
line([28.5 28.5], [-2 10],'Color','k','Linestyle', ':')
set(gca,'TickDir','out');
box off
% title('Winter 18-19')
text(0.75, 3, 'c)') % add letter
nexttile
boxplot(NEEObs_1819_GF,'Colors', k,'Symbol','', 'Labels',{'Gapfilled Obs'}); 
ylim([-1 3.5])
box off
yticks([])

%% Soil Temp Profile for Reviewer response
addpath 'D:\Work\Uni_Work\PHD\MatLab\BrewerMap'

figure
cmap = brewermap(11,'RdPu');
cmap = flipud(cmap);
set(0,'DefaultAxesColorOrder',cmap)
t = tiledlayout(2,1)
nexttile % Jordan
hold on
plot(f,Run0_1500CT_Daily.SoilPSI_1cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_26cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_40cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_80cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_136cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_170cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_250cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_427cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_595cm_CLM,'LineWidth',1.5);
plot(f,Run0_1500CT_Daily.SoilPSI_803cm_CLM,'LineWidth',1.5);
ylim([-25 0]) % revisit
title('Soil Profile - Jordan')
xlim([SnowOn_1718_n SnowOff_1718_n])
datetick('x','KeepLimits')
nexttile % Sturm
hold on
plot(f,Sturm_1500CT_Daily.SoilPSI_1cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_26cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_40cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_80cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_136cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_170cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_250cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_427cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_595cm_CLM,'LineWidth',1.5);
plot(f,Sturm_1500CT_Daily.SoilPSI_803cm_CLM,'LineWidth',1.5);
ylim([-25 0]) % revisit
title('Soil Profile - Sturm')
ylabel(t,'Soil Temp [℃]')
xlim([SnowOn_1718_n SnowOff_1718_n])
datetick('x','KeepLimits')
legend({'10 cm','26 cm','0.4m','0.8m','1.4m','1.7m','2.5m','4.3m','6m','8m'},'Location','SouthEast','NumColumns',2)
legend boxoff