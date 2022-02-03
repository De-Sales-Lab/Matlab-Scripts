%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%     PREC VALIDATION         %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%   AND HFLS (EVT)  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Get a list of all nc files in the current folder or subfolder
%MOD= pr,tas & OBS= precip (all), air (CAMS,UDEL), tmp (CRU)
%All have lat, lon, time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%   TRY PR OBS FIRST  (precip var & ET)%%%%%%%%%%%%%%%
%%%%%%%%%%%  Do this within /Analysis_CMIP6/Final_Files/OBS%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%GLDAS et var is named 'evt'
%MAKE SURE TO TRANSFER ALL NC FILES TO Final_Files/OBS!
ncdisp 'UDEL_pr2.nc'
ncdisp 'GLDAS_et_ensmean.nc'
ncdisp 'GLDAS_pr_ensmean.nc'
ncdisp 'tmp1.nc'
ncdisp 'lhtfl_20cRv2C_1981-2014.nc'
ncdisp 'prate_20cRv2C_1981-2014.nc'

lat = double(ncread('UDEL_pr2.nc','lat'));
lon = double(ncread('UDEL_pr2.nc','lon'));

UDELpr = double(ncread('UDEL_pr2.nc','precip'));
CHIRPSpr = double(ncread('CHIRPS_pr2.nc','precip'));
CMAPpr = double(ncread('CMAP_pr2.nc','precip'));
GLDASet = double(ncread('GLDAS_et_ensmean.nc','evt'));
GLDASpr = double(ncread('GLDAS_pr_ensmean.nc','pr'));
NOAAet = double(ncread('lhtfl_20cRv2C_1981-2014.nc','lhtfl'));  %NOAA-CIRES 20cRv2C
NOAApr = double(ncread('prate_20cRv2C_1981-2014.nc','prate'));  %NOAA-CIRES 20cRv2C

%These are tmp files from /data2/cmonteverde/GLDAS on HURR
%The sh file seems to produce only data for years 2000-2014
%Test these against model hfls data (mult by 86400 to get mm/day)

TMP1et = double(ncread('tmp1.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP1et = permute(TMP1et,[2 1 3]);

TMP2et = double(ncread('tmp2.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2et = permute(TMP2et,[2 1 3]);

TMP1979et = double(ncread('tmp1.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP1979et = permute(TMP1979et,[2 1 3]);
TMP2000et = double(ncread('tmp7.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2000et = permute(TMP2000et,[2 1 3]);
TMP2001et = double(ncread('tmp8.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2001et = permute(TMP2001et,[2 1 3]);
TMP2002et = double(ncread('tmp9.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2002et = permute(TMP2002et,[2 1 3]);
TMP2003et = double(ncread('tmp10.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2003et = permute(TMP2003et,[2 1 3]);
TMP2004et = double(ncread('tmp11.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2004et = permute(TMP2004et,[2 1 3]);
TMP2005et = double(ncread('tmp12.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2005et = permute(TMP2005et,[2 1 3]);
TMP2006et = double(ncread('tmp13.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2006et = permute(TMP2006et,[2 1 3]);
TMP2007et = double(ncread('tmp14.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2007et = permute(TMP2007et,[2 1 3]);
TMP2008et = double(ncread('tmp15.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2008et = permute(TMP2008et,[2 1 3]);
TMP2009et = double(ncread('tmp16.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2009et = permute(TMP2009et,[2 1 3]);
TMP2010et = double(ncread('tmp2.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2010et = permute(TMP2010et,[2 1 3]);
TMP2011et = double(ncread('tmp3.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2011et = permute(TMP2011et,[2 1 3]);
TMP2012et = double(ncread('tmp4.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2012et = permute(TMP2012et,[2 1 3]);
TMP2013et = double(ncread('tmp5.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2013et = permute(TMP2013et,[2 1 3]);
TMP2014et = double(ncread('tmp6.nc','evt'));   %this is just to test a tmp GLDAS file 1 yr
TMP2014et = permute(TMP2014et,[2 1 3]);





%'hours since 1900-1-1 0:0:0' UDEL
%'days since 1980-1-1 0:0:0' CHIRPS
%'hours since 1800-01-01 00:00:0' CMAP
%'months since 1979-01-01 00:00' GLDAS
%'hours since 1800-1-1 00:00:0.0' NOAA
UDELt = double(ncread('UDEL_pr2.nc','time'));   %get time
CHIRPSt = double(ncread('CHIRPS_pr2.nc','time'));   %get time
CMAPt = double(ncread('CMAP_pr2.nc','time'));   %get time
GLDASt = double(ncread('GLDAS_et_ensmean.nc','time'));   %get time
GLDASt = double(ncread('GLDAS_pr_ensmean.nc','time'));   %get time
NOAAt = double(ncread('lhtfl_20cRv2C_1981-2014.nc','time'));   %get time

UDELt = datenum(1900,1,1,UDELt,0,0);
CHIRPSt = datenum(1980,1,CHIRPSt);
CMAPt = datenum(1800,1,1,CMAPt,0,0);
GLDASt = datenum(1979,GLDASt,1);
NOAAt = datenum(1800,1,1,NOAAt,0,0);

%Check times
UDELt=datetime(UDELt,'ConvertFrom','datenum');
UDELt = datenum(UDELt);

%Save OBS nc files as mat
UDELpr = permute(UDELpr,[2 1 3]);
save('UDEL_pr.mat','lat','lon','UDELt','UDELpr')

CHIRPSpr = permute(CHIRPSpr,[2 1 3]);
save('CHIRPS_pr.mat','lat','lon','CHIRPSt','CHIRPSpr')

CMAPpr = permute(CMAPpr,[2 1 3]);
save('CMAP_pr.mat','lat','lon','CMAPt','CMAPpr')

GLDASet = permute(GLDASet,[2 1 3]);
save('GLDAS_et.mat','lat','lon','GLDASt','GLDASet')

GLDASpr = permute(GLDASpr,[2 1 3]);
save('GLDAS_pr.mat','lat','lon','GLDASt','GLDASpr')

NOAAet = permute(NOAAet,[2 1 3]);
save('NOAA_et.mat','lat','lon','NOAAt','NOAAet')

NOAApr = permute(NOAApr,[2 1 3]);
save('NOAA_pr.mat','lat','lon','NOAAt','NOAApr')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%  NOW MOD pr (pr) & hfls (ET)  %%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  lat, lon, time should all be the same %%%%%%%%%%%%%%
%%%%%%%%%%%  Do this within /Analysis_CMIP6/Final_Files/MOD%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%MAKE SURE TO TRANSFER ALL ENSMEAN FILES TO Final_Files/MOD!
clear all;
close all;
clc;
%Change current folder to Final_Files
cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6\Final_Files\MOD'

ncdisp BCC-CSM2-MR_pr_ensmean2.nc    %historical pr

ncdisp BCC-CSM2-MR_pr585_ensmean.nc    %future pr

ncdisp BCC-CSM2-MR_hfls_ensmean.nc    %historical ET

%Load in lat/lon/time for ALL mod pr nc files
lat = double(ncread('BCC-CSM2-MR_pr_ensmean2.nc','lat'));
lon = double(ncread('BCC-CSM2-MR_pr_ensmean2.nc','lon'));

%'days since 1850-01-01' for historical (432 time steps)
modtime = double(ncread('BCC-CSM2-MR_pr_ensmean2.nc','time'));
modtime = datenum(1850,1,modtime);

%'days since 2015-01-01' (612 time steps) for ssp585
modtime585 = double(ncread('BCC-CSM2-MR_pr585_ensmean.nc','time'));
modtime585 = datenum(2015,1,modtime585);

%Load individual pr nc files for each model ensmean historical
BCCCSM2MRpr = double(ncread('BCC-CSM2-MR_pr_ensmean2.nc','pr'));
BCCESM1pr = double(ncread('BCC-ESM1_pr_ensmean2.nc','pr'));
CanESM5pr = double(ncread('CanESM5_pr_ensmean2.nc','pr'));
CESM2pr = double(ncread('CESM2_pr_ensmean2.nc','pr'));
CESM2WACCMpr = double(ncread('CESM2-WACCM_pr_ensmean2.nc','pr'));
E3SM10pr = double(ncread('E3SM-1-0_pr_ensmean2.nc','pr'));
ECEarth3pr = double(ncread('EC-Earth3_pr_ensmean2.nc','pr'));
ECEarth3Vegpr = double(ncread('EC-Earth3-Veg_pr_ensmean2.nc','pr'));
GISSE21Gpr = double(ncread('GISS-E2-1-G_pr_ensmean2.nc','pr'));
GISSE21Hpr = double(ncread('GISS-E2-1-H_pr_ensmean2.nc','pr'));
MIROC6pr = double(ncread('MIROC6_pr_ensmean2.nc','pr'));
MRIESM20pr = double(ncread('MRI-ESM2-0_pr_ensmean2.nc','pr'));
SAM0UNICONpr = double(ncread('SAM0-UNICON_pr_ensmean2.nc','pr'));

%Load individual hfls nc files for each model ensmean historical
BCCCSM2MRhfls = double(ncread('BCC-CSM2-MR_hfls_ensmean.nc','hfls'));
BCCESM1hfls = double(ncread('BCC-ESM1_hfls_ensmean.nc','hfls'));
CanESM5hfls = double(ncread('CanESM5_hfls_ensmean.nc','hfls'));
CESM2hfls = double(ncread('CESM2_hfls_ensmean.nc','hfls'));
CESM2WACCMhfls = double(ncread('CESM2-WACCM_hfls_ensmean.nc','hfls'));
E3SM10hfls = double(ncread('E3SM-1-0_hfls_ensmean.nc','hfls'));
ECEarth3hfls = double(ncread('EC-Earth3_hfls_ensmean.nc','hfls'));
ECEarth3Veghfls = double(ncread('EC-Earth3-Veg_hfls_ensmean.nc','hfls'));
GISSE21Ghfls = double(ncread('GISS-E2-1-G_hfls_ensmean.nc','hfls'));
GISSE21Hhfls = double(ncread('GISS-E2-1-H_hfls_ensmean.nc','hfls'));
MIROC6hfls = double(ncread('MIROC6_hfls_ensmean.nc','hfls'));
MRIESM20hfls = double(ncread('MRI-ESM2-0_hfls_ensmean.nc','hfls'));
SAM0UNICONhfls = double(ncread('SAM0-UNICON_hfls_ensmean.nc','hfls'));

%Load individual pr nc files for each model ensmean ssp585
BCCCSM2MRpr585 = double(ncread('BCC-CSM2-MR_pr585_ensmean.nc','pr'));
CanESM5pr585 = double(ncread('CanESM5_pr585_ensmean.nc','pr'));
CESM2pr585 = double(ncread('CESM2_pr585_ensmean.nc','pr'));
CESM2WACCMpr585 = double(ncread('CESM2-WACCM_pr585_ensmean.nc','pr'));
ECEarth3pr585 = double(ncread('EC-Earth3_pr585_ensmean.nc','pr'));
ECEarth3Vegpr585 = double(ncread('EC-Earth3-Veg_pr585_ensmean.nc','pr'));
MIROC6pr585 = double(ncread('MIROC6_pr585_ensmean.nc','pr'));
MRIESM20pr585 = double(ncread('MRI-ESM2-0_pr585_ensmean.nc','pr'));

%Save MOD pr nc files as mat
BCCCSM2MRpr = permute(BCCCSM2MRpr,[2 1 3]);
save('BCCCSM2MR_pr.mat','lat','lon','modtime','BCCCSM2MRpr')

BCCESM1pr = permute(BCCESM1pr,[2 1 3]);
save('BCCESM1_pr.mat','lat','lon','modtime','BCCESM1pr')

CanESM5pr = permute(CanESM5pr,[2 1 3]);
save('CanESM5_pr.mat','lat','lon','modtime','CanESM5pr')

CESM2pr = permute(CESM2pr,[2 1 3]);
save('CESM2_pr.mat','lat','lon','modtime','CESM2pr')

CESM2WACCMpr = permute(CESM2WACCMpr,[2 1 3]);
save('CESM2WACCM_pr.mat','lat','lon','modtime','CESM2WACCMpr')

E3SM10pr = permute(E3SM10pr,[2 1 3]);
save('E3SM10_pr.mat','lat','lon','modtime','E3SM10pr')

ECEarth3pr = permute(ECEarth3pr,[2 1 3]);
save('ECEarth3_pr.mat','lat','lon','modtime','ECEarth3pr')

ECEarth3Vegpr = permute(ECEarth3Vegpr,[2 1 3]);
save('ECEarth3Veg_pr.mat','lat','lon','modtime','ECEarth3Vegpr')

GISSE21Gpr = permute(GISSE21Gpr,[2 1 3]);
save('GISSE21G_pr.mat','lat','lon','modtime','GISSE21Gpr')

GISSE21Hpr = permute(GISSE21Hpr,[2 1 3]);
save('GISSE21H_pr.mat','lat','lon','modtime','GISSE21Hpr')

MIROC6pr = permute(MIROC6pr,[2 1 3]);
save('MIROC6_pr.mat','lat','lon','modtime','MIROC6pr')

MRIESM20pr = permute(MRIESM20pr,[2 1 3]);
save('MRIESM20_pr.mat','lat','lon','modtime','MRIESM20pr')

SAM0UNICONpr = permute(SAM0UNICONpr,[2 1 3]);
save('SAM0UNICON_pr.mat','lat','lon','modtime','SAM0UNICONpr')

%Save MOD hfls nc files as mat
BCCCSM2MRhfls = permute(BCCCSM2MRhfls,[2 1 3]);
save('BCCCSM2MR_hfls.mat','lat','lon','modtime','BCCCSM2MRhfls')

BCCESM1hfls = permute(BCCESM1hfls,[2 1 3]);
save('BCCESM1_hfls.mat','lat','lon','modtime','BCCESM1hfls')

CanESM5hfls = permute(CanESM5hfls,[2 1 3]);
save('CanESM5_hfls.mat','lat','lon','modtime','CanESM5hfls')

CESM2hfls = permute(CESM2hfls,[2 1 3]);
save('CESM2_hfls.mat','lat','lon','modtime','CESM2hfls')

CESM2WACCMhfls = permute(CESM2WACCMhfls,[2 1 3]);
save('CESM2WACCM_hfls.mat','lat','lon','modtime','CESM2WACCMhfls')

E3SM10hfls = permute(E3SM10hfls,[2 1 3]);
save('E3SM10_hfls.mat','lat','lon','modtime','E3SM10hfls')

ECEarth3hfls = permute(ECEarth3hfls,[2 1 3]);
save('ECEarth3_hfls.mat','lat','lon','modtime','ECEarth3hfls')

ECEarth3Veghfls = permute(ECEarth3Veghfls,[2 1 3]);
save('ECEarth3Veg_hfls.mat','lat','lon','modtime','ECEarth3Veghfls')

GISSE21Ghfls = permute(GISSE21Ghfls,[2 1 3]);
save('GISSE21G_hfls.mat','lat','lon','modtime','GISSE21Ghfls')

GISSE21Hhfls = permute(GISSE21Hhfls,[2 1 3]);
save('GISSE21H_hfls.mat','lat','lon','modtime','GISSE21Hhfls')

MIROC6hfls = permute(MIROC6hfls,[2 1 3]);
save('MIROC6_hfls.mat','lat','lon','modtime','MIROC6hfls')

MRIESM20hfls = permute(MRIESM20hfls,[2 1 3]);
save('MRIESM20_hfls.mat','lat','lon','modtime','MRIESM20hfls')

SAM0UNICONhfls = permute(SAM0UNICONhfls,[2 1 3]);
save('SAM0UNICON_hfls.mat','lat','lon','modtime','SAM0UNICONhfls')

%Save MOD ssp585 pr nc files as mat
BCCCSM2MRpr585 = permute(BCCCSM2MRpr585,[2 1 3]);
save('BCCCSM2MR_pr585.mat','lat','lon','modtime585','BCCCSM2MRpr585')

CanESM5pr585 = permute(CanESM5pr585,[2 1 3]);
save('CanESM5_pr585.mat','lat','lon','modtime585','CanESM5pr585')

CESM2pr585 = permute(CESM2pr585,[2 1 3]);
save('CESM2_pr585.mat','lat','lon','modtime585','CESM2pr585')

CESM2WACCMpr585 = permute(CESM2WACCMpr585,[2 1 3]);
save('CESM2WACCM_pr585.mat','lat','lon','modtime585','CESM2WACCMpr585')

ECEarth3pr585 = permute(ECEarth3pr585,[2 1 3]);
save('ECEarth3_pr585.mat','lat','lon','modtime585','ECEarth3pr585')

ECEarth3Vegpr585 = permute(ECEarth3Vegpr585,[2 1 3]);
save('ECEarth3Veg_pr585.mat','lat','lon','modtime585','ECEarth3Vegpr585')

MIROC6pr585 = permute(MIROC6pr585,[2 1 3]);
save('MIROC6_pr585.mat','lat','lon','modtime585','MIROC6pr585')

MRIESM20pr585 = permute(MRIESM20pr585,[2 1 3]);
save('MRIESM20_pr585.mat','lat','lon','modtime585','MRIESM20pr585')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   LOAD .mat files for pr OBS + MOD  %%%%%%%%%%%%%%%
%%%%%%%%   LOAD lon lat and obs time, modtime   %%%%%%%%%%%%%%%%%%%%
%%%%%%%%   MOD is modeled data OBS is observed  %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BCCCSM2MR	
% BCCESM1 	
% CanESM5 
% CESM2 		
% CESM2WACCM 	
% E3SM10	
% ECEarth3
% ECEarth3Veg
% GISSE21G 
% GISSE21H
% MIROC6 
% MRIESM20 
% SAM0UNICON 

clear all;
close all;
clc;
%Change current folder to Final_Files
%cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6\Final_Files'
cd 'C:\Users\User\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6\Final_Files'
%Load in lat/lon/time for all files using 1 file (all the same lat/lon)
lat = double(ncread('.\MOD\BCC-CSM2-MR_pr_ensmean2.nc','lat'));
lon = double(ncread('.\MOD\BCC-CSM2-MR_pr_ensmean2.nc','lon'));

%THIS IS MOD PREC TIMES HISTORICAL
%'days since 1850-01-01' (all the same for MOD)
modtime = double(ncread('.\MOD\BCC-CSM2-MR_pr_ensmean2.nc','time'));
modtime = datenum(1850,1,modtime);

%THIS IS MOD PREC TIMES SSP585
%'days since 2015-01-01' (612 time steps) for ssp585
modtime585 = double(ncread('..\..\BCC-CSM2-MR\BCC-CSM2-MR_pr585_ensmean.nc','time'));
modtime585 = datenum(2015,1,modtime);


%THIS IS OBS PREC/ET TIMES (this is diff for each obs dataset)
%'hours since 1900-1-1 0:0:0' UDEL
%'days since 1980-1-1 0:0:0' CHIRPS
%'hours since 1800-01-01 00:00: CMAP
UDELt = double(ncread('.\OBS\UDEL_pr2.nc','time'));   %get time
CHIRPSt = double(ncread('.\OBS\CHIRPS_pr2.nc','time'));   %get time
CMAPt = double(ncread('.\OBS\CMAP_pr2.nc','time'));   %get time
GLDASt = double(ncread('.\OBS\GLDAS_et_ensmean.nc','time'));   %get time

UDELt = datenum(1900,1,1,UDELt,0,0);
CHIRPSt = datenum(1980,1,CHIRPSt);
CMAPt = datenum(1800,1,1,CMAPt,0,0);
GLDASt = datenum(1979,GLDASt,1);


% Load in MOD pr mat files in MOD folder
fds = fileDatastore('.\MOD\*pr.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

% Load in MOD hfls mat files in MOD folder
fds = fileDatastore('.\MOD\*hfls.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

% Load in MOD SSP585 pr mat files in MOD folder
fds = fileDatastore('.\MOD\*pr585.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%Load in OBS pr mat files in OBS folder
fds2 = fileDatastore('.\OBS\*pr.mat', 'ReadFcn', @importdata);
fullFileNames2 = fds2.Files;
numFiles2 = length(fullFileNames2);
for k = 1 : numFiles2
    fprintf('Now reading file %s\n', fullFileNames2{k});
    load(fullFileNames2{k});
end

%Load in OBS et mat files in OBS folder
fds2 = fileDatastore('.\OBS\*et.mat', 'ReadFcn', @importdata);
fullFileNames2 = fds2.Files;
numFiles2 = length(fullFileNames2);
for k = 1 : numFiles2
    fprintf('Now reading file %s\n', fullFileNames2{k});
    load(fullFileNames2{k});
end

%%%%%%%%%%%%    Load in already cropped prec files  %%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
%cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6'
cd 'C:\Users\User\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6'

%These are cropped files
fds = fileDatastore('.\Final_Files\*c.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end
fds = fileDatastore('.\Final_Files\*c585.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end
%These are cropped files
fds = fileDatastore('.\Final_Files\*chfls.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5

%Create repeating day matrices for CHIRPS/UDEL
%Units for these are mm/month. I need mm/day
n = 34;   %for chirps years
x = 36;   %for udel years
%days = [31,28,31,30,31,30,31,31,30,31,30,31];   %days/month
jan = repmat(31,220,261); feb= repmat(28,220,261); mar = repmat(31,220,261);...
    apr = repmat(30,220,261); may = repmat(31,220,261); jun = repmat(30,220,261);...
    jul = repmat(31,220,261); aug = repmat(31,220,261); sep = repmat(30,220,261);...
    oct = repmat(31,220,261); nov = repmat(30,220,261); dec = repmat(31,220,261);
days = cat(3,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);
CHIRPSdays = repmat(days,[1 1 n]);
UDELdays = repmat(days,[1 1 x]);   %and for all other models

%Divide CHIRPS/UDEL by days
CHIRPSc = CHIRPSc./CHIRPSdays;
UDELc = UDELc./CHIRPSdays;   %or CHIRPSdays if UDEL is time cropped

mean(CHIRPSc,'all','omitnan')


%Turn lat/lon into grid
[Lon,Lat] = meshgrid(lon,lat);

%load basic image of mean pr
figure
pcolor(Lon,Lat,mean(CanESM5pr,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 30])

%load basic image of mean ET (hfls)
figure
pcolor(Lon,Lat,mean(CanESM5hfls(:,:,240:432),3))  %(:,:,240:432) is around 2000-2014
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 10])

%concatenate tmp GLDAS et files along 3 dim
GLDASet = cat(3,TMP2000et,TMP2001et,TMP2000et,TMP2002et,TMP2003et,...
    TMP2004et,TMP2005et,TMP2006et,TMP2007et,TMP2008et,TMP2009et,...
    TMP2010et,TMP2011et,TMP2012et,TMP2013et,TMP2014et);

%load basic image of mean ET (hfls)
figure
%pcolor(Lon,Lat,mean(TMP2000et*86400,3))  %get mm/day
pcolor(Lon,Lat,mean(GLDASet*86400,3)) 
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude


%Mask out all points that correspond to ocean (set ocean grid cells to NaN)
%new name for each dataset includes 'm' for ocean mask
land = island(Lat,Lon);
ocean = ~land;   %ocean is NOT land

UDELm = mask3(UDELpr,ocean);  %OBS pr and et
CHIRPSm = mask3(CHIRPSpr,ocean);
CMAPm= mask3(CMAPpr,ocean);
GLDASprm= mask3(GLDASpr,ocean);  %GLDAS pr
GLDASetm= mask3(GLDASet,ocean);   %GLDAS et
NOAAetm= mask3(NOAAet,ocean);   %NOAA et
NOAAprm= mask3(NOAApr,ocean);   %NOAA pr

BCCCSM2MRm = mask3(BCCCSM2MRpr,ocean);    %MOD pr (just m)
BCCESM1m = mask3(BCCESM1pr,ocean);
CanESM5m = mask3(CanESM5pr,ocean);
CESM2m	= mask3(CESM2pr,ocean);
CESM2WACCMm = mask3(CESM2WACCMpr,ocean);
E3SM10m = mask3(E3SM10pr,ocean);
ECEarth3m = mask3(ECEarth3pr,ocean);
ECEarth3Vegm = mask3(ECEarth3Vegpr,ocean);
GISSE21Gm = mask3(GISSE21Gpr,ocean);
GISSE21Hm = mask3(GISSE21Hpr,ocean);
MIROC6m = mask3(MIROC6pr,ocean);
MRIESM20m = mask3(MRIESM20pr,ocean);
SAM0UNICONm = mask3(SAM0UNICONpr,ocean);

BCCCSM2MRmhfls = mask3(BCCCSM2MRhfls,ocean);    %MOD hfls (mhfls)
BCCESM1mhfls = mask3(BCCESM1hfls,ocean);
CanESM5mhfls = mask3(CanESM5hfls,ocean);
CESM2mhfls	= mask3(CESM2hfls,ocean);
CESM2WACCMmhfls = mask3(CESM2WACCMhfls,ocean);
E3SM10mhfls = mask3(E3SM10hfls,ocean);
ECEarth3mhfls = mask3(ECEarth3hfls,ocean);
ECEarth3Vegmhfls = mask3(ECEarth3Veghfls,ocean);
GISSE21Gmhfls = mask3(GISSE21Ghfls,ocean);
GISSE21Hmhfls = mask3(GISSE21Hhfls,ocean);
MIROC6mhfls = mask3(MIROC6hfls,ocean);
MRIESM20mhfls = mask3(MRIESM20hfls,ocean);
SAM0UNICONmhfls = mask3(SAM0UNICONhfls,ocean);

BCCCSM2MRm585 = mask3(BCCCSM2MRpr585,ocean);    %MOD585 pr (m585)
CanESM5m585 = mask3(CanESM5pr585,ocean);
CESM2m585 = mask3(CESM2pr585,ocean);
CESM2WACCMm585 = mask3(CESM2WACCMpr585,ocean);
ECEarth3m585 = mask3(ECEarth3pr585,ocean);
ECEarth3Vegm585 = mask3(ECEarth3Vegpr585,ocean);
MIROC6m585 = mask3(MIROC6pr585,ocean);
MRIESM20m585 = mask3(MRIESM20pr585,ocean);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Create plots for 35-year annual mean pre & hfls        %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Replot with masked out ocean (change mod/obs) to quick check
%REMEMBER THAT UDEL/CHIRPS are in mm/month!!!!! /30
figure
pcolor(Lon,Lat,mean(SAM0UNICONm,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 30])

figure   %hfls
pcolor(Lon,Lat,mean(SAM0UNICONmhfls,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 5])


%Create a mask to crop to smaller domain and plot mask to check domain
% mask = geomask(Lat,Lon,[-14 2],[-68 -50]);  %just a square
lon2 = lon-360;
mask = geomask(Lat,Lon,[-18 6],[-76 -42]);  %just a square around Brazilian Amazon
% NAZmask = geomask(Lat,Lon,[-5 5],[-70 -50]); %this is old (boxed split)
% SAZmask = geomask(Lat,Lon,[-15.5 -5],[-70 -50]); %this is old (boxed split)
NAZmask = geomask(Lat,Lon,[-5 5],[-75 -43]);
SAZmask = geomask(Lat,Lon,[-19 -5],[-75 -43]);
Rondoniamask = geomask(Lat,Lon,[-13.67 -7.95],[-66.9 -59.7]);  %Rondonia square mask

figure
imagescn(lon2,lat,SAZmask)   %just for box mask
axis xy tight
title 'Southern Amazon mask'
xlabel 'longitude'
ylabel 'latitude'
ax = axis;
borders('countries')
axis(ax)

figure   %this is to create a study figure quickly
imagescn(lon2,lat,mean(CHIRPSc,3,'omitnan'))   %just for box mask
axis xy tight
title 'Masks'
xlabel 'longitude'
ylabel 'latitude'
caxis([0 100000])
ax = axis;
borders('countries')
axis(ax)


%This is all of the Brazilian biomes
A = shaperead('..\Shapefiles\Amazon_biome\biome.shp');  %all BRAZILIAN biomes
mapshow(A)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude

%This is the Amazon biome for JUST Brazil
B = shaperead('..\Shapefiles\Amazon_biome\biome.shp','Selector',...
    {@(v1) (v1 == 1),'ID'});  %Amazon biome JUST BRAZIL
figure
mapshow(B)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude

%This is the Legal Amazon of Brazil boundary from terrabrasilis !!!USE THIS ONE!!!!
%From Final Files folder (go up and down one folder to Shapefiles)
C = shaperead('..\Shapefiles\brazilian_legal_amazon_border\brazilian_legal_amazon.shp',...
    'Selector',{@(v1) (v1 == 1),'ID'});  %Amazon biome JUST BRAZIL LEGAL
figure
mapshow(C)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
xlim([-90 -30])
ylim([-35 15])


%This is a tif for Brazil vegetation cover
[Veg,R] = geotiffread('..\Shapefiles\Brazil_Vegetation_Soils\data\BrazilVegMap_13class.tif');
mapshow(Veg,R)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude

[Veg,cmap] = imread('..\Shapefiles\Brazil_Vegetation_Soils\data\BrazilVegMap_13class.tif');
imshow(Veg,cmap);

%Now use the shapefile to CROP (c) the nc files
%Use maskregion to do this
%new name for each dataset includes 'c' for crop

% filelon = lon2;
% filelat = lat;
% filevar = UDELp;
% W = S;
% varout = UDELc;

% [xx,yy]=meshgrid(filelon,filelat);
% index=zeros(size(filevar,2),size(filevar,1));
% for kk=1:length(W)
%     out=[W(kk).X ;W(kk).Y]';
%     aa=inpolygon(xx,yy,out(:,1),out(:,2)) +0;
%     try
%         index=index+aa;
%     catch
%         index=index+aa';
%     end
% end
% index(index==0)=nan;
% for kk=1:size(filevar,3)
%     varout(:,:,kk)=filevar(:,:,kk).*index';
% end
% end

%Use C: the Legal Amazon biome JUST BRAZIL
lon2 = lon-360;
StartDate2 = datetime(1981,01,01);
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;

UDELc = maskregion(lon2,lat,UDELm,C);   %OBS pr and et
CHIRPSc = maskregion(lon2,lat,CHIRPSm,C);
CMAPc = maskregion(lon2,lat,CMAPm,C);
GLDASprc = maskregion(lon2,lat,GLDASprm,C);   %GLDAS pr crop
GLDASetc = maskregion(lon2,lat,GLDASetm,C);   %GLDAS et crop
NOAAetc = maskregion(lon2,lat,NOAAetm,C);   %NOAA et crop
NOAAprc = maskregion(lon2,lat,NOAAprm,C);   %NOAA pr crop

%NOAAprc = NOAAprc(:,:,:); 
%save('NOAAprc.mat','lat','lon','modtime2','NOAAprc')   %save cropped
%files 1981-2014

BCCCSM2MRc = maskregion(lon2,lat,BCCCSM2MRm,C);   %MOD pr (just c)
BCCESM1c = maskregion(lon2,lat,BCCESM1m,C);
CanESM5c = maskregion(lon2,lat,CanESM5m,C);
CESM2c	= maskregion(lon2,lat,CESM2m,C);
CESM2WACCMc = maskregion(lon2,lat,CESM2WACCMm,C);
E3SM10c = maskregion(lon2,lat,E3SM10m,C);
ECEarth3c = maskregion(lon2,lat,ECEarth3m,C);
ECEarth3Vegc = maskregion(lon2,lat,ECEarth3Vegm,C);
GISSE21Gc = maskregion(lon2,lat,GISSE21Gm,C);
GISSE21Hc = maskregion(lon2,lat,GISSE21Hm,C);
MIROC6c = maskregion(lon2,lat,MIROC6m,C);
MRIESM20c = maskregion(lon2,lat,MRIESM20m,C);
SAM0UNICONc = maskregion(lon2,lat,SAM0UNICONm,C);

%SAM0UNICONc = SAM0UNICONc(:,:,25:432); 
%save('SAM0UNICONc.mat','lat','lon','modtime2','SAM0UNICONc') 

BCCCSM2MRchfls = maskregion(lon2,lat,BCCCSM2MRmhfls,C);   %MOD hfls (chfls)
BCCESM1chfls = maskregion(lon2,lat,BCCESM1mhfls,C);
CanESM5chfls = maskregion(lon2,lat,CanESM5mhfls,C);
CESM2chfls	= maskregion(lon2,lat,CESM2mhfls,C);
CESM2WACCMchfls = maskregion(lon2,lat,CESM2WACCMmhfls,C);
E3SM10chfls = maskregion(lon2,lat,E3SM10mhfls,C);
ECEarth3chfls = maskregion(lon2,lat,ECEarth3mhfls,C);
ECEarth3Vegchfls = maskregion(lon2,lat,ECEarth3Vegmhfls,C);
GISSE21Gchfls = maskregion(lon2,lat,GISSE21Gmhfls,C);
GISSE21Hchfls = maskregion(lon2,lat,GISSE21Hmhfls,C);
MIROC6chfls = maskregion(lon2,lat,MIROC6mhfls,C);
MRIESM20chfls = maskregion(lon2,lat,MRIESM20mhfls,C);
SAM0UNICONchfls = maskregion(lon2,lat,SAM0UNICONmhfls,C);

%BCCCSM2MRchfls = BCCCSM2MRchfls(:,:,25:432); 
%save('BCCCSM2MRchfls.mat','lat','lon','modtime2','BCCCSM2MRchfls')
%GLDASet = GLDASet(:,:,25:432); 
%save('GLDASetc.mat','lat','lon','modtime2','GLDASet')

BCCCSM2MRc585 = maskregion(lon2,lat,BCCCSM2MRm585,C);   %MOD585 pr (c585)
CanESM5c585 = maskregion(lon2,lat,CanESM5m585,C);
CESM2c585 = maskregion(lon2,lat,CESM2m585,C);
CESM2WACCMc585 = maskregion(lon2,lat,CESM2WACCMm585,C);
ECEarth3c585 = maskregion(lon2,lat,ECEarth3m585,C);
ECEarth3Vegc585 = maskregion(lon2,lat,ECEarth3Vegm585,C);
MIROC6c585 = maskregion(lon2,lat,MIROC6m585,C);
MRIESM20c585 = maskregion(lon2,lat,MRIESM20m585,C);

%save('BCCCSM2MRc585.mat','lat','lon','modtime585','MRIESM20c585')   %save cropped
%files 2051-2100

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   This is a topo map of study area  %%%%%
[latgrid,longrid] = cdtgrid(0.25);
landgrid = island(latgrid,longrid);    %mask out ocean
oceangrid = ~landgrid;
Z = topo_interp(latgrid,longrid);
Zm = mask3(Z,oceangrid); 
   
Zc = maskregion(longrid,latgrid,Zm,C);   %mask out Brazil

pcolor(longrid,latgrid,Zm)
shading interp
cb = colorbar;
ylabel(cb,'elevation (m)')
cmocean curl
caxis([0 500])
xlim([-75 -43])
ylim([-18 7])

%Create repeating day vector for CHIRPS/UDEL
n = 34;   %for chirps
x = 36;   %for udel
days = [31,28,31,30,31,30,31,31,30,31,30,31];
CHIRPSdays = repmat(days,1,n);
UDELdays = repmat(days,1,x);   %and for all other models
CHIRPSdays = CHIRPSdays';
UDELdays = UDELdays';

%Create repeating day matrices for CHIRPS/UDEL
%Units for these are mm/month. I need mm/day
n = 34;   %for chirps years
x = 36;   %for udel years
%days = [31,28,31,30,31,30,31,31,30,31,30,31];   %days/month
jan = repmat(31,220,261); feb= repmat(28,220,261); mar = repmat(31,220,261);...
    apr = repmat(30,220,261); may = repmat(31,220,261); jun = repmat(30,220,261);...
    jul = repmat(31,220,261); aug = repmat(31,220,261); sep = repmat(30,220,261);...
    oct = repmat(31,220,261); nov = repmat(30,220,261); dec = repmat(31,220,261);
days = cat(3,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);
CHIRPSdays = repmat(days,[1 1 n]);
UDELdays = repmat(days,[1 1 x]);   %and for all other models

%Divide CHIRPS/UDEL by days
CHIRPSc = CHIRPSc./CHIRPSdays;
UDELc = UDELc./CHIRPSdays;   %or CHIRPSdays if UDEL is time cropped

mean(CHIRPSc,'all','omitnan')

%Check crop
%REMEMBER THAT UDEL/CHIRPS are in mm/month!!!!!

% BCCCSM2MRc
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc 
% UDELc
% CMAPc
% CHIRPSc

Longlist =  ["BCCCSM2MRc","BCCESM1c","CanESM5c","CESM2c","CESM2WACCMc",...
    "E3SM10c","ECEarth3c","ECEarth3Vegc","GISSE21Gc","GISSE21Hc","MIROC6c","MRIESM20c",...
    "SAM0UNICONc","UDELc","CMAPc","CHIRPSc"];

for i = 1:length(Longlist)
    mean([i]*30.4167,'all','omitnan')
end

mean(CMAPc*30.4167,'all','omitnan')   %this is to get the mean over all dims
mean(CHIRPSc,'all','omitnan')   %tfor UDEL and CHIRPS
%mean(CMAPc(:,:,240:432)*30.4167,'all','omitnan')   %for 2000-2014
%mean(CHIRPSc(:,:,216:408),'all','omitnan')   %for 2000-2014
%mean(UDELc(:,:,240:432),'all','omitnan')   %for 2000-2014

Ensemblemean_3D = cat(3,BCCCSM2MRc,BCCESM1c,CanESM5c,CESM2c,CESM2WACCMc,...
    E3SM10c,ECEarth3c,ECEarth3Vegc,GISSE21Gc,GISSE21Hc,MIROC6c,...
    MRIESM20c,SAM0UNICONc);
Ensemblemean_3D_et = cat(3,BCCCSM2MRchfls,BCCESM1chfls,CanESM5chfls,CESM2chfls,CESM2WACCMchfls,...
    E3SM10chfls,ECEarth3chfls,ECEarth3Vegchfls,GISSE21Gchfls,GISSE21Hchfls,MIROC6chfls,...
    MRIESM20chfls,SAM0UNICONchfls);

%MEAN PLOTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is a cropped plot with contour + green color scheme for PR
figure
%pcolor(lon2,lat,mean(NOAApr*30.4167,3))  %/30.4167 CHIRPS/UDEL
contourf(lon2,lat,mean(NOAAprc*30.4167,3),'edgecolor','none') %for mm/month *30.4167 for all but CHIRPS/UDEL
shading interp
axis tight
%cmocean dense    %this is blue color scheme
cmocean rain      %this is white, tan to blue
cb = colorbar;
hold on
%borders('countries','color',rgb('dark gray'))
%xlabel longitude
%ylabel latitude
caxis([0 300])
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])  %this is for crop B

%STANDARD DEVIATION PLOTS  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is a cropped plot with contour + blue color scheme for PR
figure
%pcolor(lon2,lat,mean(SAM0UNICONc*30.4167,3))  %/30.4167 CHIRPS/UDEL
contourf(lon2,lat,std(Ensemblemean_3D,[],3,'omitnan'),'edgecolor','none')
shading interp
axis tight
cmocean dense    %this is blue color scheme
%cmocean rain      %this is white, tan to blue
cb = colorbar;
hold on
%borders('countries','color',rgb('dark gray'))
%xlabel longitude
%ylabel latitude
caxis([0 8])
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])  %this is for crop B

%RMSE PLOTS pr &hfls %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Equation: 1)sub mod - obs 2)square difference 3)sum of diff 4)Divide sum
%by data points 5)take square root of that total
%yt is theoretical (obs) and ye is experimental (model)
mycolormap_gyr = customcolormap(linspace(0,1,11), {'#a60126','#d7302a','#f36e43','#faac5d','#fedf8d','#fcffbf','#d7f08b','#a5d96b','#68bd60','#1a984e','#006936'});
mycolormap_gp = customcolormap(linspace(0,1,11), {'#523107','#523107','#bf812c','#e2c17e','#f3e9c4','#f6f4f4','#cae9e3','#81cdc1','#379692','#01665e','#003d2e'});

yt = CHIRPSc;
%yt = GLDASetc(:,:,25:432);   %For ET obs
%yt = mean(CHIRPSc,3);    %For ensemble mean!!!

ye = GLDASprc;    %just change variable c or chfls(:,:,25:432)
%ye = mean(Ensemblemean_3D,3);   %for ensemble mean!!!

E = (ye-yt);  %Errors
SQE = E.^2;  %square errors
MSE = mean(SQE,3);  %Mean square error
RMSE = sqrt(MSE);  %Root mean square errors  (USE THIS for plot)

figure
contourf(lon2,lat,RMSE,'edgecolor','none')
shading interp
axis tight
colormap(mycolormap_gyr);
%cmocean thermal   % this is blue to yellow scheme
%cmocean dense    %this is blue color scheme
%cmocean rain      %this is white, tan to blue
hold on
cb = colorbar;
%borders('countries','color',rgb('dark gray'))
%xlabel longitude
%ylabel latitude
caxis([0 6])   %6 for pr & 3 for hfls
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])  %this is for crop B

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is a cropped plot with contour + green color scheme for PR FUTURE
figure
%pcolor(lon2,lat,mean(SAM0UNICONc*30.4167,3))  %/30.4167 CHIRPS/UDEL
contourf(lon2,lat,mean(BCCCSM2MRc585(:,:,373:612)*30.4167,3),'edgecolor','none') %for mm/month *30.4167 for all but CHIRPS/UDEL
shading interp
axis tight
%cmocean dense    %this is blue color scheme
cmocean rain      %this is white, tan to blue
cb = colorbar;
hold on
%borders('countries','color',rgb('dark gray'))
%xlabel longitude
%ylabel latitude
caxis([0 300])
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])  %this is for crop B

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is a cropped plot with contour for mean HFLS 'chfls' for MOD
%GLDASetc/NOAAetc is final file
figure
contourf(lon2,lat,mean(NOAAetc*30.4167,3),'edgecolor','none') %for mm/month *30.4167 for all but CHIRPS/UDEL
shading interp
axis tight
%cmocean -thermal      %this is yellow,indigo,purple
cmocean -haline
cb = colorbar;
hold on
caxis([50 150])   %0-200 normally
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])  %this is for crop B

 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%     MFC plots      %%%%%%%%%%%
%Evap: HFLS 'chfls' for MOD    Prec: 'c' for MOD
%Evap: NOAA 'etc; for OBS      Prec: 'prc' for OBS
%    Eqn:  Pr - Et = MFC    (all in mm/day) *30.4167 for mm/month
%GLDASetc/NOAAetc CHIRPSc/CMAPc/UDELc.NOAAprc/GLDASprc  
figure
pcolor(lon2,lat,(mean(NOAAprc*30.4167,3)-mean(NOAAetc*30.4167,3)))
shading interp
%s.FaceColor = 'interp';
axis tight
caxis([-40 120])   %for pr
%cmocean balance
%colormap(flip(mycolormap_bwp));   %for et bias
cmocean('tarn','pivot',0)   %for pr bias
cb = colorbar;
hold on
%caxis([-200 100])   %for pr
%caxis([-40 40])   %for et
%caxis([-3 3])  %for mm/day
xlim([-75 -43])
ylim([-20 7])

% PR, ET bias%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is a cropped plot with contour for et (hfls) and pr BIAS!!!!
%GLDASetc/NOAAetc is final file (all are in mm/day)   ----
%GLDASet(:,:,25:432), but can use GLDASet now!
%   *30.4167   to get mm/month
%Don't forget Ensemblemean_3D & Ensemblemean_3D_et !!!!!!!!!!!!!!
mycolormap_gyr2 = customcolormap(linspace(0,1,6), {'#f36e43','#faac5d','#fedf8d','#fcffbf','#d7f08b','#a5d96b',});
mycolormap_bwp = customcolormap_preset('brown-white-pool');

figure
pcolor(lon2,lat,(mean(NOAAprc*30.4167,3)-mean(CHIRPSc*30.4167,3)))
shading interp
%s.FaceColor = 'interp';
axis tight
caxis([-200 100])   %for pr
%cmocean balance
%colormap(flip(mycolormap_bwp));   %for et bias
cmocean('tarn','pivot',0)   %for pr bias
cb = colorbar;
hold on
%caxis([-200 100])   %for pr
%caxis([-40 40])   %for et
%caxis([-3 3])  %for mm/day
xlim([-75 -43])
ylim([-20 7])

%This is an attempt to interpolate missing GLDAS values

% BCCCSM2MRchfls
% BCCESM1chfls
% CanESM5chfls 
% CESM2chfls 		
% CESM2WACCMchfls 	
% E3SM10chfls	
% ECEarth3chfls
% ECEarth3Vegchfls
% GISSE21Gchfls 
% GISSE21Hchfls
% MIROC6chfls 
% MRIESM20chfls 
% SAM0UNICONchfls 
% UDELchfls
% CMAPchfls
% CHIRPSchfls
mean(SAM0UNICONchfls*30.4167,'all','omitnan')   %this is to get the mean over all dims
%mean(CMAPchfls(:,:,240:432)*30.4167,'all','omitnan')   %for 2000-2014


%%%%%%%%%     MFC PLOT     %%%%%%%%%%%%%%
% BCCCSM2MR
% BCCESM1
% CanESM5
% CESM2 		
% CESM2WACCM	
% E3SM10	
% ECEarth3
% ECEarth3Veg
% GISSE21G 
% GISSE21H
% MIROC6
% MRIESM20 
% SAM0UNICON
% UDEL
% CMAP
% CHIRPS
% NOAAprc and NOAAetc
% Ensemblemean_3D and Ensemblemean_3D_et

mean((NOAAprc-NOAAetc)*30.4167,'all','omitnan') %MFC mean over all dims

%This is a MFC plot with contour + tan-blue color scheme for PR-HFLS
%You have to adjust the pivot for EACH ONE! To get it to move down, pos(+)
%numbers (like 15 or 50) to move up more neg(-) numbers
figure
pcolor(lon2,lat,mean((Ensemblemean_3D-Ensemblemean_3D_et)*30.4167,3))
%contourf(lon2,lat,mean((SAM0UNICONpr-SAM0UNICONchfls)*30.4167,3),'edgecolor','none') %for mm/month *30.4167 for all but CHIRPS/UDEL
%or use tarn for neg/pos values
shading interp
axis tight
%cmocean tempo      %this is tan,green,blue
cmocean('tarn','pivot',37) 
cb = colorbar;
hold on
caxis([-50 120])
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])   %for brazil amazon crop


%%%%%  THIS IS ALSO MFC BUT OBS (CHIRPS AND GLDAS) for 2000-2014 for now
%This is a MFC plot with contour + tan-blue color scheme for PR-HFLS
%You have to adjust the pivot for EACH ONE! To get it to move down, pos(+)
%numbers (like 15 or 50) to move up more neg(-) numbers
%for 2003-2013 (:,:,289:420) and for CHIRPSc(:,:,265:396)

CHIRPS_MFC = CHIRPSc(:,:,1:408);   %get 2000-2014
UDEL_MFC = UDELc(:,:,25:432);   %get 1981-2014
CMAP_MFC = CMAPc(:,:,25:432);   %get 1981-2014
GLDAS_MFC = GLDASet(:,:,25:432);   %get 1981-2014

mean((CHIRPSc-GLDAS_MFC),'all','omitnan');

figure
%pcolor(lon2,lat,mean((CHIRPSc(:,:,217:408)-(GLDASet*86400*30.4167)),3))
pcolor(lon2,lat,mean(((CMAP_MFC*30.4167)-GLDAS_MFC),3))
%contourf(lon2,lat,mean((SAM0UNICONpr-SAM0UNICONchfls)*30.4167,3),'edgecolor','none') %for mm/month *30.4167 for all but CHIRPS/UDEL
%or use tarn for neg/pos values
shading interp
axis tight
%cmocean tempo      %this is tan,green,blue
cmocean('tarn','pivot',55) 
cb = colorbar;
hold on
caxis([-50 120])
xlim([-75 -43])
ylim([-20 7])
%ylim([-18 7])   %for brazil amazon crop


%This is a cropped plot with NO contour + blue color scheme
figure
pcolor(lon2,lat,mean(SAM0UNICONc*30.4167,3))  %for mm/month *30.4167 for all but CHIRPS/UDEL
shading interp
axis tight
cmocean dense    %this is blue color scheme
cb = colorbar;
hold on
caxis([0 300])
xlim([-75 -43])
ylim([-20 7])

%check = UDELc(:,:,1);   %check single layer


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%             THIS IS EOF ANALYSIS            %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  https://github.com/zelunwu/eof    %%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BCCCSM2MRc
% BCCESM1c
% CanESM5c
% CESM2c		
% CESM2WACCMc	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c
% MRIESM20c 
% SAM0UNICONc
% UDELc
% CMAPc
% CHIRPSc
StartDate2 = datetime(1981,01,01);  %for CHIRPS
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;
modtimeColumn2 = modtime2.';
modtime2 = datenum(modtime2');

[eof_maps1, eof_maps2, pcs, expvar, eig_values] = meof(UDELc,BCCCSM2MRc);

figure
imagesc(lon2,lat,eof_maps1)
axis xy image
%axis tight
cmocean('curl','pivot')
%cmocean('curl')
title 'The first EOF mode!'
xlim([-75 -43])
ylim([-20 7])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%             THIS IS EOF ANALYSIS            %%%%%%%%%%%%%%%%%%
%%%%%  https://www.chadagreene.com/CDT/eof_documentation.html  %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BCCCSM2MRc
% BCCESM1c
% CanESM5c
% CESM2c		
% CESM2WACCMc	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c
% MRIESM20c 
% SAM0UNICONc
% UDELc
% CMAPc
% CHIRPSc

%This is if you just want to perforrm eof with the prepped files- all same
%time steps (408, 1981-2014)
clear all

%Change current folder
cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6'

% Load in pr mat files in Final_Files folder
%Just change '.\Final_Files\
%Data is 1981-2014 monthly data with 408 timesteps
%Lat is 220 and Lon is 261 
%CHIRPS and UDEL are mm/month all others are mm/day
fds = fileDatastore('.\Final_Files\*c.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%These are NOT cropped files (OBS)
fds = fileDatastore('.\Final_Files\OBS\*pr.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%These are NOT cropped files (MOD)
fds = fileDatastore('.\Final_Files\MOD\*pr.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end


%Create repeating day matrices for CHIRPS/UDEL
%Units for these are mm/month. I need mm/day
n = 34;   %for chirps years
x = 36;   %for udel years
%days = [31,28,31,30,31,30,31,31,30,31,30,31];   %days/month
jan = repmat(31,220,261); feb= repmat(28,220,261); mar = repmat(31,220,261);...
    apr = repmat(30,220,261); may = repmat(31,220,261); jun = repmat(30,220,261);...
    jul = repmat(31,220,261); aug = repmat(31,220,261); sep = repmat(30,220,261);...
    oct = repmat(31,220,261); nov = repmat(30,220,261); dec = repmat(31,220,261);
days = cat(3,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);
CHIRPSdays = repmat(days,[1 1 n]);
UDELdays = repmat(days,[1 1 x]);   %and for all other models

%Divide CHIRPS/UDEL by days
CHIRPSpr = CHIRPSpr./CHIRPSdays;
UDELpr = UDELpr./UDELdays;

mean(CHIRPSpr,'all','omitnan')

StartDate2 = datetime(1981,01,01);  %for all if you load in new files
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;
modtimeColumn2 = modtime2.';
modtime2 = datenum(modtime2');

lon2 = lon-360;   %adjust lon

%calc first eof of pr and its PC time series NOT DETRENDED
[eofmap,pc] = eof(CHIRPSc,1);  %/30.4167 for CHIRPS/UDEL

%plot the first eof map and PC time series NOT DETRENDED
figure
pcolor(lon2,lat,eofmap)  
shading interp
axis tight
cmocean('delta','pivot',0) 
cb = colorbar;
hold on
xlim([-75 -43])
ylim([-20 7])

figure %seasonal!
anomaly(modtime2,pc)
axis tight
xlim([datenum('jan 1, 1981') datenum('dec 1, 2014')])
datetick('x','keeplimits')

%plot trend in data mm/day original (decadal- multiply by *365*12)
figure
imagescn(lon2,lat,365*12*trend(CHIRPSc,modtime2,3)) %modtime2 for all
shading interp
axis tight
cb = colorbar;
ylabel(cb,' precipitation trend mm/day per decade ')
cmocean('-balance','pivot')
xlim([-75 -43])
ylim([-20 7])

StartDate2 = datetime(1981,01,01);  %create new modtime for combined data
EndDate3 = datetime(2048,12,31);
modtime3= StartDate2:calmonths(1):EndDate3;
modtimeColumn3 = modtime3.';
modtime3 = datenum(modtime3');

%Method 1
%REMOVE long-term trend and mean from individual datasets before cat (Method 1)
%Use either original data [mod]c or Combine_2datasets
CHIRPSc = detrend3(CHIRPSc,modtime2);  %modtime3 for combined datasets
CESM2c = detrend3(CESM2c,modtime2);
%REMOVE seasonal cycles
CHIRPSc = deseason(CHIRPSc,modtime2);
CESM2c = deseason(CESM2c,modtime2);

%try to cat 2 datasets (for end of Method 1, beginning of method 2 &3)
Combine_2datasets = cat(3,CHIRPSc,CESM2c);%already detrended, mean removed, seasonality removed

%Method 2
%REMOVE long-term trend and mean (Method 2)
%Use either original data [mod]c or Combine_2datasets
EOF_detrended1 = detrend3(Combine_2datasets,modtime3);  %modtime3 for combined datasets
%REMOVE seasonal cycles
EOF_detrended = deseason(EOF_detrended1,modtime3);

%Method 3
%Remove total mean from data (Method 3)
nx0=261;   %lon
ny0=220;   %lat
nt=816;  %time 408 each dataset
nd=2; %number of datasets
mm = mean(Combine_2datasets,3,'omitnan');    %get mean in 3D, 'omitnan'
ff=NaN(ny0,nx0,nt);    %create array of NaN values lat/lon/time/datasets
for i=1:nt
    ff(:,:,i) = Combine_2datasets(:,:,i) - mm(:,:,1);
end
Combine_2datasets=ff; 

%Now that's left is the anomalies (things that changed that are not
%long-term trends or short-term annual cycles. Remaining is vaiance
figure
imagescn(lon2,lat,var(EOF_detrended,[],3));
shading interp
axis tight
colorbar
title('variance of precipitation')
colormap(jet) % jet is inexcusable except when recreating old plots
%caxis([0 1])
xlim([-75 -43])
ylim([-20 7])

%EOF analysis: where things vary, but how often and what regions tend to
%vary together or out of phase.
[eof_maps,pc,expv] = eof(EOF_detrended);
%[eof_maps,pc,expv] = eof(Combine_2datasets);   %for 2 datasets

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  THIS IS AN ATTEMPT TO COMBINE OTHER METHOD FOR CEOF  %%%%%%%
%%%%%%%%%%  DO THIS AFTER YOU COMPUTE THE EOF ANLAYSIS ABOVE     %%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
reg=[-90 -25;-34.875 19.875];   %lon/lat (S. America roughly)
im=1:1;
iyr=1:1;

lo=reg(1,1):0.25:reg(1,2);   %increments between lat/lon is 0.25
la=reg(2,1):0.25:reg(2,2);

nx0=261;   %lon
ny0=220;   %lat
nt=408;   %1981-2014 monthly data
x=-90:0.25:-25;    %lon with 0.25 inc
y=-34.875:0.25:19.875; 

dt={  
    'CHIRPSc',                     'a) CHIRPS'                'Obs'
    'CMAPc',                        'b) CMAP'                'CMAP'
    'UDELc'                         'c) UDEL'                 'UDEL'
    'GLDASc'                        'd) GLDAS'                   'GLDAS'
    'BCCCSM2MRc',                   'e) BCCCSM2MR'               'GCM'
    'BCCESM1c',                    'f) BCCESM1'                 'GCM'
    'CanESM5c',                  'g) CanESM5'                   'GCM'
    'CESM2c',                      'h) CESM2'                'GCM'
    'CESM2WACCMc',                    'i) CESM2WACCM'             'GCM'
    'E3SM10c',                  'j) E3SM10'                    'GCM'
    'ECEarth3c',                    'k) ECEarth3'               'GCM'
    'ECEarth3Vegc',                     'l) ECEarth3Veg'         'GCM'
    'GISSE21Gc',                     'm) GISSE21G'                     'GCM'
    'GISSE21Hc',               'n) GISSE21H'                       'GCM'
    'MIROC6c',                         'o) MIROC6'                         'GCM'
    'MRIESM20c',                    'p) MRIESM20'                      'GCM'
    'SAM0UNICONc',                    'q) SAM0UNICON'                      'GCM'
};

%nd=size(dt,1);
nd=2;   %this is just for 2 models right now

z=reshape(Combine_2datasets,[ny0 nx0 nt nd]);  %reshape original data into 4D
z=reshape(z,[ny0*nx0 nt nd]);   %lon*lat x time x #models
zz=reshape(z,[size(z,1) size(z,2)*size(z,3)]);   %zz will be lon*lat and time*models

%So combined EOF vv= eof_maps & combined PC dd= pc from eof.m
%eof.m Computes the entire stack (no separation)
vv=eof_maps;  %this is 3D
vv=reshape(vv,[nt ny0*nx0 nd]);  %reshape so we can calc part. exp. var below?
dd= pc;        %this is 2D 816 time series (both datasets)
dd1=pc(1:408,1:408);        %this is 2D First Dataset (CHIRPS)
dd2=pc(409:816,409:816);     %this is 2D Second Dataset (CESM2)
dd3= cat(3,dd1,dd2);  %this is so they are separated in calculation below

%calculate commom EOFs From other script (I use eof.m)
% X=zz';        %transpose data. This and next line= lines 133-135 eof.m
% [vv dd]=eig(X*X');     %returns diag matrix dd of eigenvalues and full matrix vv whose columns are corresponding right eigenvectors
% vv=X'*vv*(dd^-0.5);  %transpose orig transposed data*eigvectors/sqrt(eigenvalues)??
% vv=fliplr(vv);       %flip array left to right

%vv=X'*vv*(dd^-0.5);    %may not be needed (already in eof.m?) Lines 152-157?? eof.m
%vv=fliplr(vv);         %I didn't see this in eof.m

%calculate partial explained variance dd var for SEPARATE
for i=1:nd    %loop for each dataset (obs, model1, cmip...)
    X0=z(:,:,i)';   %select prec dataset z as in z(nx*ny,nt,nd) 
%     dtmp=X0*vv;   %mult one group eof by data itself (ORIGINAL-not edited)
    dtmp=X0*vv(:,:,i);     %Must be 2D or at least 1 must be scalar. Add (.*)? Reshape vv?
    dtmp=dtmp'*dtmp;    
    dtmp=abs(diag(dtmp));
    dd(:,i)=dtmp(1:6)/sum(dtmp);   %partial explained variance. dd is both datasets
end

%calculate partial PCs
zz=reshape(z,[size(z,1) size(z,2)*size(z,3)]);   %reformatted precip z data as z(nx*ny, nt*nd)
X=zz';
tt=X*vv;    %partial PC

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% BACK TO MY EOF METHOD   %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%scale of PC and EOF maps to -1 1
for k = 1:size(pc,1)

   % Find the the maximum value in the time series of each principal component:
   maxval = max(abs(pc(k,:)));

   % Divide the time series by its maximum value:
   pc(k,:) = pc(k,:)/maxval;

   % Multiply the corresponding EOF map:
   eof_maps(:,:,k) = eof_maps(:,:,k)*maxval;
end

%plot the first mode as MAP
figure
imagesc(lon2,lat,eof_maps(:,:,1))
axis xy image
%axis tight
cmocean('curl','pivot')
%cmocean('curl')
title 'The first EOF mode!'
xlim([-75 -43])
ylim([-20 7])


%plot the first three modes of variability as TIME SERIES
%modtime2 for CHIRPS or modtime3 for combined
figure
subsubplot(3,1,1)
plot(modtime2,pc(1,:))  %modtime change  and grabs the 1 row all columns
box off
axis tight
ylabel 'pc1'
title 'The first three principal components'

subsubplot(3,1,2)
plot(modtime2,pc(2,:))  %modtime change
box off
axis tight
set(gca,'yaxislocation','right')
ylabel 'pc2'

subsubplot(3,1,3)
plot(modtime2,pc(3,:))  %modtime change
box off
axis tight
ylabel 'pc3'
datetick('x','keeplimits')


%anomaly to plot first mode and multiply by -1
%modtime change
figure('pos',[100 100 600 250])
anomaly(modtime3,-pc(1,:),'topcolor',rgb('red'),...  %modtime change
   'bottomcolor',rgb('periwinkle blue')) % First principal component is ??
box off
axis tight
datetick('x','keeplimits')
%text([724316 729713 736290],[.95 .99 .81],'El Nino','horiz','center')

%Maps of variability: spatial patterns of variability through time
%diff modes can be summed to create total picture of prec anomalies
%Orthogonal function means each of the modes tend to do their own thing,
%independent of the other modes. First six modes. Can change signs of modes
s = [-1 1 -1 1 -1 1]; % (sign multiplier to match Messie and Chavez 2011)

s = [1 1 1 1 1 1];

figure('pos',[100 100 500 700])
for k = 1:6
   subplot(3,2,k)
   imagescn(lon2,lat,eof_maps(:,:,k)*s(k));
   axis xy off
   title(['Mode ',num2str(k),' (',num2str(expv(k),'%0.1f'),'%)'])
   borders('countries','color',rgb('dark gray'))
   %caxis([-2 2]) %mostly use this
   caxis([-10 10])
   %xlim([-75 -43])
   %ylim([-20 7])
   cb = colorbar;
end
colormap(gcf,cmocean('balance','pivot',0))
%colormap(flipud(jet))


%Average each month over the entire time series
figure
subsubplot(3,1,1)
plot(season(pc(1,:),modtime2,'monthly'),'--+r','linewidth',3)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 1 seasonal anomaly'
legend('CHIRPS')

subsubplot(3,1,2)
plot(season(pc(2,:),modtime2,'monthly'),'--+r','linewidth',3)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 2 seasonal anomaly'

subsubplot(3,1,3)
plot(season(pc(3,:),modtime2,'monthly'),'--+r','linewidth',3)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 3 seasonal anomaly'


%Make a movie of PREC variability from EOFs
MODEL_f = reof(eof_maps,pc,1:3);

ind_1980to2014 = 1:6:432; % (every third value to cut down on gif size)
figure
h = imagescn(MODEL_f(:,:,ind_1980to2014(1)));
caxis([-2 2])
cmocean balance
cb = colorbar;
ylabel(cb,'precipitation anomaly (modes 1-3)')
title(datestr(modtime(ind_1980to2014(1)),'yyyy'))
gif('SSTs_1980to2014.gif','frame',gcf) % writes the first frame
for k = 2:length(ind_1980to2014)
   h.CData = MODEL_f(:,:,ind_1980to2014(k));
   title(datestr(modtime(ind_1980to2014(k)),'yyyy'))
   gif % adds this frame to the gif
end

%check sum of first three modes
sum(expv(1:3))
sum(expv)

%Plot explained variance as a function of mode number (cumulative explained
%variance

figure
subplot(2,1,1)
plot(expv)
axis([0 432 0 37])   %432 time steps
box off
ylabel 'variance explained per mode'

subplot(2,1,2)
plot(cumsum(expv))
axis([0 432 0 100])
ylabel 'cumulative variance explained'
xlabel 'mode number'
box off


%Solve all/10 modes
% Solve all modes:
[eof_maps_all,pc_all,expv_all] = eof(EOF_detrended);

% Solve for just the first 10 modes:
[eof_maps_10,pc_10,expv_10] = eof(EOF_detrended,10);

%plot
figure
subplot(1,2,1)
imagescn(eof_maps_all(:,:,1)-eof_maps_10(:,:,1))
colorbar
cmocean('balance','pivot')

subplot(1,2,2)
plot(pc_all(1,:)-pc_10(1,:))
axis tight

%Explained variance plot
figure
plot(expv_all(1:10),expv_10,'o')
hold on
plot([0 50],[0 50]) % straight line (both values equal)
axis equal
xlabel 'explained variance (all 432 solutions')
ylabel 'explained variance (10 solutions')

%plot cumulative sum of explained variance
figure
plot(cumsum(expv_10),'o-')
xlabel 'mode number'
ylabel 'cumulative sum of explained variance (%)'
%ntitle({'Only solving for a few modes might trick you';...
   %'into believing you''ve captured all the variance...'})
   
   
%Create bar plot with % for first 3 modes of all datasets
%Input modes % from excel file (Var_stats EOF tab) copy and paste
ID_bar = categorical({'CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','CMAP','UDEL'});
ID_bar = reordercats(ID_bar,{'CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','CMAP','UDEL'});
vals_bar = [20.2	14.5	20.1	33	29.9	32.3...	
    30.9	33.9	35.6	45.2	44.7	23.1	23.5...
    34.5	29.1	19.8;15.6	8.6	12	15.5	22.3	20.6...
    18.8	13.2	13.2	14.8	16.2	18.4	16.5	26.9...
    21.6	16.3;  5.8	6	11.6	7.8	9	7.6	10	6.8	7.7	8.5	8.1...
    6.5	10.1	9.8	9.8	6.7];
b = bar(ID_bar,vals_bar);
set(b,{'Displayname'},{'Mode 1','Mode 2','Mode 3'}')
ylim([0 100])
ylabel('%')
legend('Fontsize',12)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%THIS IS LOOKING AT EL NINO AND LA NINA EVENTS%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%El Nino events: JFM 1983* (49:51); AMJ 1987 (100:102); JFM 1992 (157:159);
%JFM 1998* (229:231)
%La Nina events: JASO 1988* (115:118); AMJ 1999 (244:246); JFM 2008
%(349:351); OND 2010 (382:384); JFM 2011* (385:387)
%Labelled [mod]en[year] -or- [mod]ln[year]
%CHIRPS will be different!!!! Starts in 1981 (subtract 24 from above
%timestamps)- this represents 2 years of data
%for mm/month *30.4167 for all but CHIRPS/UDEL
% BCCCSM2MRc
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc 
% UDELc
% CMAPc
% CHIRPSc
EN = mean(SAM0UNICONc(:,:,49:51)*30.4167,3,'omitnan'); %adjust time for CHIRPS
AVG = mean(SAM0UNICONc*30.4167,3);   %for mm/month *30.4167 but CHIRPS/UDEL

%Make the colorbar with 0 in the middle!
figure
pcolor(lon2,lat,EN-AVG)
shading interp
axis tight
cmocean('-balance')
cb = colorbar;
ylabel(cb,'(mm/month)')
hold on
xlim([-75 -43])
ylim([-18 7])
caxis([-150 150])  %has to be symmetrical


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%THIS IS TO GET TIME SERIES OF MASKED DOMAIN%%%%%%%%%%%%%%%%%%%%
%Use local function to get pr time series of masked domain
UDELts = local(UDELc,mask,'omitnan');       %OBS
CHIRPSts = local(CHIRPSc,mask,'omitnan');
CMAPts = local(CMAPc,mask,'omitnan');
GLDASts = local(GLDASetc,mask,'omitnan');
NOAAts = local(NOAAprc,mask,'omitnan');
NOAAetts = local(NOAAetc,mask,'omitnan');
%Create time vector
StartDate = datetime(1981,01,01,"Format","MMM-uuuu");  %for each dataset create time vector
EndDate = datetime(2014,12,31,"Format","MMM-uuuu");
dates= StartDate:calmonths(1):EndDate;
modtimeColumn = dates.';
modtime = datenum(dates');

BCCCSM2MRts = local(BCCCSM2MRc,mask,'omitnan');    %MOD HIST
BCCESM1ts = local(BCCESM1c,mask,'omitnan');
CanESM5ts = local(CanESM5c,mask,'omitnan');
CESM2ts	= local(CESM2c,mask,'omitnan');
CESM2WACCMts = local(CESM2WACCMc,mask,'omitnan');
E3SM10ts = local(E3SM10c,mask,'omitnan');
ECEarth3ts = local(ECEarth3c,mask,'omitnan');
ECEarth3Vegts = local(ECEarth3Vegc,mask,'omitnan');
GISSE21Gts = local(GISSE21Gc,mask,'omitnan');
GISSE21Hts = local(GISSE21Hc,mask,'omitnan');
MIROC6ts = local(MIROC6c,mask,'omitnan');
MRIESM20ts = local(MRIESM20c,mask,'omitnan');
SAM0UNICONts = local(SAM0UNICONc,mask,'omitnan');

Ensemblets = [BCCCSM2MRts,BCCESM1ts,CanESM5ts,CESM2ts,CESM2WACCMts,...
    E3SM10ts,ECEarth3ts,ECEarth3Vegts,GISSE21Gts,GISSE21Hts,MIROC6ts,...
    MRIESM20ts,SAM0UNICONts];

EnsembleMeants = mean(Ensemblets,2);  %calc hsit Ensemble mean (keep rows)

Ensemblets8mod = [BCCCSM2MRts,CanESM5ts,CESM2ts,CESM2WACCMts,...
    ECEarth3ts,ECEarth3Vegts,MIROC6ts,MRIESM20ts];

EnsembleMeants8mod = mean(Ensemblets8mod,2);  %calc hist Ensemble mean (only the 7 models!!!)

BCCCSM2MRts585 = local(BCCCSM2MRc585,mask,'omitnan');     %MOD 585
CanESM5ts585 = local(CanESM5c585,mask,'omitnan');
CESM2ts585 = local(CESM2c585,mask,'omitnan');
CESM2WACCMts585 = local(CESM2WACCMc585,mask,'omitnan');
ECEarth3ts585 = local(ECEarth3c585,mask,'omitnan');
ECEarth3Vegts585 = local(ECEarth3Vegc585,mask,'omitnan');
MIROC6ts585 = local(MIROC6c585,mask,'omitnan');
MRIESM20ts585 = local(MRIESM20c585,mask,'omitnan');

Ensemblets585 = [BCCCSM2MRts585,CanESM5ts585,CESM2ts585,CESM2WACCMts585,ECEarth3ts585,...
    ECEarth3Vegts585,MIROC6ts585,MRIESM20ts585];

EnsembleMeants585 = mean(Ensemblets585,2);  %calc Ensemble 585 mean (keep rows)


UDELtsNAZ = local(UDELc,NAZmask,'omitnan');       %OBS  FOR NAZ pr %%%%%%%%%%%%
CHIRPStsNAZ = local(CHIRPSc,NAZmask,'omitnan');
CMAPtsNAZ = local(CMAPc,NAZmask,'omitnan');
GLDAStsNAZ = local(GLDASprc,NAZmask,'omitnan');
NOAAtsNAZ = local(NOAAprc,NAZmask,'omitnan');
BCCCSM2MRtsNAZ = local(BCCCSM2MRc,NAZmask,'omitnan');    %MOD HIST FOR NAZ pr
BCCESM1tsNAZ = local(BCCESM1c,NAZmask,'omitnan');
CanESM5tsNAZ = local(CanESM5c,NAZmask,'omitnan');
CESM2tsNAZ	= local(CESM2c,NAZmask,'omitnan');
CESM2WACCMtsNAZ = local(CESM2WACCMc,NAZmask,'omitnan');
E3SM10tsNAZ = local(E3SM10c,NAZmask,'omitnan');
ECEarth3tsNAZ = local(ECEarth3c,NAZmask,'omitnan');
ECEarth3VegtsNAZ = local(ECEarth3Vegc,NAZmask,'omitnan');
GISSE21GtsNAZ = local(GISSE21Gc,NAZmask,'omitnan');
GISSE21HtsNAZ = local(GISSE21Hc,NAZmask,'omitnan');
MIROC6tsNAZ = local(MIROC6c,NAZmask,'omitnan');
MRIESM20tsNAZ = local(MRIESM20c,NAZmask,'omitnan');
SAM0UNICONtsNAZ = local(SAM0UNICONc,NAZmask,'omitnan');

EnsembletsNAZ = [BCCCSM2MRtsNAZ,BCCESM1tsNAZ,CanESM5tsNAZ,CESM2tsNAZ,CESM2WACCMtsNAZ,...
    E3SM10tsNAZ,ECEarth3tsNAZ,ECEarth3VegtsNAZ,GISSE21GtsNAZ,GISSE21HtsNAZ,MIROC6tsNAZ,...
    MRIESM20tsNAZ,SAM0UNICONtsNAZ];

EnsembleMeantsNAZ = mean(EnsembletsNAZ,2); 

GLDASettsNAZ = local(GLDASet,NAZmask,'omitnan');    %OBS for et (GLDAS)
NOAAettsNAZ = local(NOAAetc,NAZmask,'omitnan');    %OBS for et (NOAA-20cRv2C)
BCCCSM2MRettsNAZ = local(BCCCSM2MRchfls,NAZmask,'omitnan');    %MOD HIST FOR NAZ et
BCCESM1ettsNAZ = local(BCCESM1chfls,NAZmask,'omitnan');
CanESM5ettsNAZ = local(CanESM5chfls,NAZmask,'omitnan');
CESM2ettsNAZ	= local(CESM2chfls,NAZmask,'omitnan');
CESM2WACCMettsNAZ = local(CESM2WACCMchfls,NAZmask,'omitnan');
E3SM10ettsNAZ = local(E3SM10chfls,NAZmask,'omitnan');
ECEarth3ettsNAZ = local(ECEarth3chfls,NAZmask,'omitnan');
ECEarth3VegettsNAZ = local(ECEarth3Vegchfls,NAZmask,'omitnan');
GISSE21GettsNAZ = local(GISSE21Gchfls,NAZmask,'omitnan');
GISSE21HettsNAZ = local(GISSE21Hchfls,NAZmask,'omitnan');
MIROC6ettsNAZ = local(MIROC6chfls,NAZmask,'omitnan');
MRIESM20ettsNAZ = local(MRIESM20chfls,NAZmask,'omitnan');
SAM0UNICONettsNAZ = local(SAM0UNICONchfls,NAZmask,'omitnan');

EnsembleettsNAZ = [BCCCSM2MRettsNAZ,BCCESM1ettsNAZ,CanESM5ettsNAZ,CESM2ettsNAZ,CESM2WACCMettsNAZ,...
    E3SM10ettsNAZ,ECEarth3ettsNAZ,ECEarth3VegettsNAZ,GISSE21GettsNAZ,GISSE21HettsNAZ,MIROC6ettsNAZ,...
    MRIESM20ettsNAZ,SAM0UNICONettsNAZ];

EnsembleMeanettsNAZ = mean(EnsembleettsNAZ,2); 

UDELtsSAZ = local(UDELc,SAZmask,'omitnan');       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsSAZ = local(CHIRPSc,SAZmask,'omitnan');
CMAPtsSAZ = local(CMAPc,SAZmask,'omitnan');
GLDAStsSAZ = local(GLDASprc,SAZmask,'omitnan');
NOAAtsSAZ = local(NOAAprc,SAZmask,'omitnan');
BCCCSM2MRtsSAZ = local(BCCCSM2MRc,SAZmask,'omitnan');    %MOD HIST FOR SAZ
BCCESM1tsSAZ = local(BCCESM1c,SAZmask,'omitnan');
CanESM5tsSAZ = local(CanESM5c,SAZmask,'omitnan');
CESM2tsSAZ	= local(CESM2c,SAZmask,'omitnan');
CESM2WACCMtsSAZ = local(CESM2WACCMc,SAZmask,'omitnan');
E3SM10tsSAZ = local(E3SM10c,SAZmask,'omitnan');
ECEarth3tsSAZ = local(ECEarth3c,SAZmask,'omitnan');
ECEarth3VegtsSAZ = local(ECEarth3Vegc,SAZmask,'omitnan');
GISSE21GtsSAZ = local(GISSE21Gc,SAZmask,'omitnan');
GISSE21HtsSAZ = local(GISSE21Hc,SAZmask,'omitnan');
MIROC6tsSAZ = local(MIROC6c,SAZmask,'omitnan');
MRIESM20tsSAZ = local(MRIESM20c,SAZmask,'omitnan');
SAM0UNICONtsSAZ = local(SAM0UNICONc,SAZmask,'omitnan');

EnsembletsSAZ = [BCCCSM2MRtsSAZ,BCCESM1tsSAZ,CanESM5tsSAZ,CESM2tsSAZ,CESM2WACCMtsSAZ,...
    E3SM10tsSAZ,ECEarth3tsSAZ,ECEarth3VegtsSAZ,GISSE21GtsSAZ,GISSE21HtsSAZ,MIROC6tsSAZ,...
    MRIESM20tsSAZ,SAM0UNICONtsSAZ];

EnsembleMeantsSAZ = mean(EnsembletsSAZ,2); 

GLDASettsSAZ = local(GLDASet,SAZmask,'omitnan');    %OBS for et (GLDAS)
NOAAettsSAZ = local(NOAAetc,SAZmask,'omitnan');    %OBS for et (NOAA)
BCCCSM2MRettsSAZ = local(BCCCSM2MRchfls,SAZmask,'omitnan');    %MOD HIST FOR SAZ
BCCESM1ettsSAZ = local(BCCESM1chfls,SAZmask,'omitnan');
CanESM5ettsSAZ = local(CanESM5chfls,SAZmask,'omitnan');
CESM2ettsSAZ	= local(CESM2chfls,SAZmask,'omitnan');
CESM2WACCMettsSAZ = local(CESM2WACCMchfls,SAZmask,'omitnan');
E3SM10ettsSAZ = local(E3SM10chfls,SAZmask,'omitnan');
ECEarth3ettsSAZ = local(ECEarth3chfls,SAZmask,'omitnan');
ECEarth3VegettsSAZ = local(ECEarth3Vegchfls,SAZmask,'omitnan');
GISSE21GettsSAZ = local(GISSE21Gchfls,SAZmask,'omitnan');
GISSE21HettsSAZ = local(GISSE21Hchfls,SAZmask,'omitnan');
MIROC6ettsSAZ = local(MIROC6chfls,SAZmask,'omitnan');
MRIESM20ettsSAZ = local(MRIESM20chfls,SAZmask,'omitnan');
SAM0UNICONettsSAZ = local(SAM0UNICONchfls,SAZmask,'omitnan');

EnsembleettsSAZ = [BCCCSM2MRettsSAZ,BCCESM1ettsSAZ,CanESM5ettsSAZ,CESM2ettsSAZ,CESM2WACCMettsSAZ,...
    E3SM10ettsSAZ,ECEarth3ettsSAZ,ECEarth3VegettsSAZ,GISSE21GettsSAZ,GISSE21HettsSAZ,MIROC6ettsSAZ,...
    MRIESM20ettsSAZ,SAM0UNICONettsSAZ];

EnsembleMeanettsSAZ = mean(EnsembleettsSAZ,2); 

%Calculate ET/PR for each month
newaverage = zeros(408,1);
for k=1:408
    update = BCCCSM2MRettsNAZ(k)/BCCCSM2MRtsNAZ(k);
    newaverage(k,1)=update;
end
%get 1 value for this
mean(newaverage)

%Divide UDEL and CHIRPS by UDEldays and CHIRPSdays
%These datasets are in mm/month and we want mm/day (like other datasets)
UDELts2 = UDELts./UDELdays;
CHIRPSts2 = CHIRPSts./CHIRPSdays;

StartDate2 = datetime(1981,01,01);  %for CHIRPS
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;
modtimeColumn2 = modtime2.';

%this is a shortened version of modtime for CHIRPS
%CHIRPS ts seems a month off from all other datasets, check it 
modtimeCHIRPS = modtime(25:432);

figure
plot(season(UDELts2,modtime,'monthly'),'--+r','linewidth',3)   %use UDELts2 (mm/day)
box off
axis tight
xlabel 'month of year'
ylabel 'seasonal precipitation cycle'
hold on
plot(season(CHIRPSts2,modtime,'monthly'),'-+b','linewidth',3); %use CHIRPSts2 (mm/day)
hold on
plot(season(CMAPts,modtime,'monthly'),':ok','linewidth',3);
hold on
plot(season(BCCCSM2MRts,modtime,'monthly'),'-xk');
hold on
plot(season(BCCESM1ts,modtime,'monthly'),'-pm');
hold on
plot(season(CanESM5ts,modtime,'monthly'),'-*c');
hold on
plot(season(CESM2ts,modtime,'monthly'),'--sm');
hold on
plot(season(CESM2WACCMts,modtime,'monthly'),':xk');
hold on
plot(season(E3SM10ts,modtime,'monthly'),'-.og');
hold on
plot(season(ECEarth3ts,modtime,'monthly'),':>r');
hold on
plot(season(ECEarth3Vegts,modtime,'monthly'),'-hb');
hold on
plot(season(GISSE21Gts,modtime,'monthly'),'--pr');
hold on
plot(season(GISSE21Hts,modtime,'monthly'),'-xb');
hold on
plot(season(MIROC6ts,modtime,'monthly'),'--*r');
hold on
plot(season(MRIESM20ts,modtime,'monthly'),'-.b');
hold on
plot(season(SAM0UNICONts,modtime,'monthly'),'-dk');
hold on
plot(season(EnsembleMeants,modtime,'monthly'),'-sm','linewidth',3);
legend('UDEL','CHIRPS','CMAP','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean')
% legend('UDEL','CMAP','CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
%     'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
%     'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean')

%%%%%%%%%%%%%%    ANNUAL CYCLE FOR NAZ     %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure
plot(season(UDELtsNAZ,modtime,'monthly'),'--+r','linewidth',3)   %use UDELts2 (mm/day)
box off
axis tight
xlabel 'month of year'
ylabel 'NAZ seasonal precipitation cycle'
hold on
plot(season(CHIRPStsNAZ,modtime,'monthly'),'-+b','linewidth',3); %use CHIRPSts2 (mm/day)
hold on
plot(season(CMAPtsNAZ,modtime,'monthly'),':ok','linewidth',3);
hold on
plot(season(BCCCSM2MRtsNAZ,modtime,'monthly'),'-xk');
hold on
plot(season(BCCESM1tsNAZ,modtime,'monthly'),'-pm');
hold on
plot(season(CanESM5tsNAZ,modtime,'monthly'),'-*c');
hold on
plot(season(CESM2tsNAZ,modtime,'monthly'),'--sm');
hold on
plot(season(CESM2WACCMtsNAZ,modtime,'monthly'),':xk');
hold on
plot(season(E3SM10tsNAZ,modtime,'monthly'),'-.og');
hold on
plot(season(ECEarth3tsNAZ,modtime,'monthly'),':>r');
hold on
plot(season(ECEarth3VegtsNAZ,modtime,'monthly'),'-hb');
hold on
plot(season(GISSE21GtsNAZ,modtime,'monthly'),'--pr');
hold on
plot(season(GISSE21HtsNAZ,modtime,'monthly'),'-xb');
hold on
plot(season(MIROC6tsNAZ,modtime,'monthly'),'--*r');
hold on
plot(season(MRIESM20tsNAZ,modtime,'monthly'),'-.b');
hold on
plot(season(SAM0UNICONtsNAZ,modtime,'monthly'),'-dk');
hold on
plot(season(EnsembleMeantsNAZ,modtime,'monthly'),'-sm','linewidth',3);
legend('UDEL','CHIRPS','CMAP','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean',...
    'Location','northeastoutside')
%%%%%%%%%%%%%%%%%%%    SAZ annual cycle    %%%%%%%%%%%%%%%%%%%%5
figure
plot(season(UDELtsSAZ,modtime,'monthly'),'--+r','linewidth',3)   %use UDELts2 (mm/day)
box off
axis tight
xlabel 'month of year'
ylabel 'SAZ seasonal precipitation cycle'
hold on
plot(season(CHIRPStsSAZ,modtime,'monthly'),'-+b','linewidth',3); %use CHIRPSts2 (mm/day)
hold on
plot(season(CMAPtsSAZ,modtime,'monthly'),':ok','linewidth',3);
hold on
plot(season(BCCCSM2MRtsSAZ,modtime,'monthly'),'-xk');
hold on
plot(season(BCCESM1tsSAZ,modtime,'monthly'),'-pm');
hold on
plot(season(CanESM5tsSAZ,modtime,'monthly'),'-*c');
hold on
plot(season(CESM2tsSAZ,modtime,'monthly'),'--sm');
hold on
plot(season(CESM2WACCMtsSAZ,modtime,'monthly'),':xk');
hold on
plot(season(E3SM10tsSAZ,modtime,'monthly'),'-.og');
hold on
plot(season(ECEarth3tsSAZ,modtime,'monthly'),':>r');
hold on
plot(season(ECEarth3VegtsSAZ,modtime,'monthly'),'-hb');
hold on
plot(season(GISSE21GtsSAZ,modtime,'monthly'),'--pr');
hold on
plot(season(GISSE21HtsSAZ,modtime,'monthly'),'-xb');
hold on
plot(season(MIROC6tsSAZ,modtime,'monthly'),'--*r');
hold on
plot(season(MRIESM20tsSAZ,modtime,'monthly'),'-.b');
hold on
plot(season(SAM0UNICONtsSAZ,modtime,'monthly'),'-dk');
hold on
plot(season(EnsembleMeantsSAZ,modtime,'monthly'),'-sm','linewidth',3);
legend('UDEL','CHIRPS','CMAP','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean',...
    'Location','northeastoutside')

%Check just a few years of pr data to check CHIRPS timing of wet/dry season
figure
plot(UDELts2(25:48),'-+r','linewidth',3)   %use UDELts2 (mm/day)
box off
axis tight
xlabel 'months since 1981'
ylabel 'seasonal precipitation cycle [mm/day]'
hold on
plot(CMAPts(25:48),'-ok','linewidth',3);
hold on
plot(CHIRPSts2(1:24),'-+b','linewidth',3); %use CHIRPSts2 (mm/day)
hold on
plot(BCCCSM2MRts(25:48),'-xk');
hold on
plot(BCCESM1ts(25:48),'-pm');
hold on
plot(CanESM5ts(25:48),'-*c');
hold on
plot(CESM2ts(25:48),'--sm');
hold on
plot(CESM2WACCMts(25:48),':xk');
hold on
plot(E3SM10ts(25:48),'-.og');
hold on
plot(ECEarth3ts(25:48),':>r');
hold on
plot(ECEarth3Vegts(25:48),'-hb');
hold on
plot(GISSE21Gts(25:48),'--pr');
hold on
plot(GISSE21Hts(25:48),'-xb');
hold on
plot(MIROC6ts(25:48),'--*r');
hold on
plot(MRIESM20ts(25:48),'-.b');
hold on
plot(SAM0UNICONts(25:48),'-dk');
hold on
plot(EnsembleMeants(25:48),'-sm','linewidth',3);
legend('UDEL','CMAP','CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean')


%pr 585 annual time series
%get sdev to add to plot
Hist_prec_sdev_8mod = std(EnsembleMeants8mod);   %2.62
Fut_prec_sdev_8mod = std(EnsembleMeants585);  %2.68

figure
plot(season(EnsembleMeants585,modtime585,'monthly'),'-xb','linewidth',3);
box off
axis tight
xlabel 'month of year'
ylabel 'seasonal precipitation cycle'
hold on
plot(season(EnsembleMeants8mod,modtime,'monthly'),'-sm','linewidth',3);
hold on
plot(season(BCCCSM2MRts585,modtime585,'monthly'),'-+r');
hold on
plot(season(CanESM5ts585,modtime585,'monthly'),'-ok');
hold on
plot(season(CESM2ts585,modtime585,'monthly'),'--pr');
hold on
plot(season(CESM2WACCMts585,modtime585,'monthly'),'-+b');
hold on
plot(season(ECEarth3ts585,modtime585,'monthly'),'-xk');
hold on
plot(season(ECEarth3Vegts585,modtime585,'monthly'),'-pm');
hold on
plot(season(MIROC6ts585,modtime585,'monthly'),'-*c');
hold on
plot(season(MRIESM20ts585,modtime585,'monthly'),'--sm');
legend('8 model Ensemble Mean 585','8 model Enemble Mean Hist','BCCCSM2MR 585',...
    'CanESM5 585','CESM2 585','CESM2WACCM 585','ECEarth3 585','ECEarth3Veg 585',...
    'MIROC6 585','MRIESM20 585')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Get rmse, bias, mean, simple stats from ANNUAL cycle ts data%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%For this section, get (season,monthly) but make that a variable for stats
%CHIRPS is shorter, so (25:432) for reference data 81-14 (408 months)
UDELseason = season(UDELts2,modtime,'monthly');   %use UDELts2 (mm/day)
CMAPseason = season(CMAPts,modtime,'monthly');
CHIRPSseason = season(CHIRPSts2,modtimeColumn2,'monthly'); %use CHIRPSts2 (mm/day)
BCCCSM2MRseason = season(BCCCSM2MRts,modtime,'monthly');
BCCESM1season = season(BCCESM1ts,modtime,'monthly');
CanESM5season = season(CanESM5ts,modtime,'monthly');
CESM2season = season(CESM2ts,modtime,'monthly');
CESM2WACCMseason = season(CESM2WACCMts,modtime,'monthly');
E3SM10season = season(E3SM10ts,modtime,'monthly');
ECEarth3season = season(ECEarth3ts,modtime,'monthly');
ECEarth3Vegseason = season(ECEarth3Vegts,modtime,'monthly');
GISSE21Gseason = season(GISSE21Gts,modtime,'monthly');
GISSE21Hseason = season(GISSE21Hts,modtime,'monthly');
MIROC6season = season(MIROC6ts,modtime,'monthly');
MRIESM20season = season(MRIESM20ts,modtime,'monthly');
SAM0UNICONseason = season(SAM0UNICONts,modtime,'monthly');
EnsembleMeanseason = season(EnsembleMeants,modtime,'monthly');

UDELmean = mean(UDELts2,'omitnan');      %For BRAZILIAN AMAZON crop mean
CHIRPSmean = mean(CHIRPSts2,'omitnan');
CMAPmean = mean(CMAPts,'omitnan');
BCCCSM2MRmean = mean(BCCCSM2MRts,'omitnan');
BCCESM1mean = mean(BCCESM1ts,'omitnan');
CanESM5mean = mean(CanESM5ts,'omitnan');
CESM2mean	= mean(CESM2ts,'omitnan');
CESM2WACCMmean = mean(CESM2WACCMts,'omitnan');
E3SM10mean = mean(E3SM10ts,'omitnan');
ECEarth3mean = mean(ECEarth3ts,'omitnan');
ECEarth3Vegmean = mean(ECEarth3Vegts,'omitnan');
GISSE21Gmean = mean(GISSE21Gts,'omitnan');
GISSE21Hmean = mean(GISSE21Hts,'omitnan');
MIROC6mean = mean(MIROC6ts,'omitnan');
MRIESM20mean = mean(MRIESM20ts,'omitnan');
SAM0UNICONmean = mean(SAM0UNICONts,'omitnan');
Ensemblemean = mean(EnsembleMeants,'omitnan');

UDELmeanNAZ = mean(UDELtsNAZ,'omitnan');      %For NAZ crop mean
CHIRPSmeanNAZ = mean(CHIRPStsNAZ,'omitnan');
CMAPmeanNAZ = mean(CMAPtsNAZ,'omitnan');
BCCCSM2MRmeanNAZ = mean(BCCCSM2MRtsNAZ,'omitnan');
BCCESM1meanNAZ = mean(BCCESM1tsNAZ,'omitnan');
CanESM5meanNAZ = mean(CanESM5tsNAZ,'omitnan');
CESM2meanNAZ	= mean(CESM2tsNAZ,'omitnan');
CESM2WACCMmeanNAZ = mean(CESM2WACCMtsNAZ,'omitnan');
E3SM10meanNAZ = mean(E3SM10tsNAZ,'omitnan');
ECEarth3meanNAZ = mean(ECEarth3tsNAZ,'omitnan');
ECEarth3VegmeanNAZ = mean(ECEarth3VegtsNAZ,'omitnan');
GISSE21GmeanNAZ = mean(GISSE21GtsNAZ,'omitnan');
GISSE21HmeanNAZ = mean(GISSE21HtsNAZ,'omitnan');
MIROC6meanNAZ = mean(MIROC6tsNAZ,'omitnan');
MRIESM20meanNAZ = mean(MRIESM20tsNAZ,'omitnan');
SAM0UNICONmeanNAZ = mean(SAM0UNICONtsNAZ,'omitnan');
EnsemblemeanNAZ = mean(EnsembleMeantsNAZ,'omitnan');

UDELmeanSAZ = mean(UDELtsSAZ,'omitnan');      %For SAZ crop mean
CHIRPSmeanSAZ = mean(CHIRPStsSAZ,'omitnan');
CMAPmeanSAZ = mean(CMAPtsSAZ,'omitnan');
BCCCSM2MRmeanSAZ = mean(BCCCSM2MRtsSAZ,'omitnan');
BCCESM1meanSAZ = mean(BCCESM1tsSAZ,'omitnan');
CanESM5meanSAZ = mean(CanESM5tsSAZ,'omitnan');
CESM2meanSAZ	= mean(CESM2tsSAZ,'omitnan');
CESM2WACCMmeanSAZ = mean(CESM2WACCMtsSAZ,'omitnan');
E3SM10meanSAZ = mean(E3SM10tsSAZ,'omitnan');
ECEarth3meanSAZ = mean(ECEarth3tsSAZ,'omitnan');
ECEarth3VegmeanSAZ = mean(ECEarth3VegtsSAZ,'omitnan');
GISSE21GmeanSAZ = mean(GISSE21GtsSAZ,'omitnan');
GISSE21HmeanSAZ = mean(GISSE21HtsSAZ,'omitnan');
MIROC6meanSAZ = mean(MIROC6tsSAZ,'omitnan');
MRIESM20meanSAZ = mean(MRIESM20tsSAZ,'omitnan');
SAM0UNICONmeanSAZ = mean(SAM0UNICONtsSAZ,'omitnan');
EnsemblemeanSAZ = mean(EnsembleMeantsSAZ,'omitnan');

UDELstd = std (UDELts2,'omitnan');      %For BRAZILIAN AMAZON crop std
CHIRPSstd  = std (CHIRPSts2,'omitnan');
CMAPstd  = std (CMAPts,'omitnan');
BCCCSM2MRstd  = std (BCCCSM2MRts,'omitnan');
BCCESM1std  = std (BCCESM1ts,'omitnan');
CanESM5std  = std (CanESM5ts,'omitnan');
CESM2std 	= std (CESM2ts,'omitnan');
CESM2WACCMstd  = std (CESM2WACCMts,'omitnan');
E3SM10std  = std (E3SM10ts,'omitnan');
ECEarth3std  = std (ECEarth3ts,'omitnan');
ECEarth3Vegstd  = std (ECEarth3Vegts,'omitnan');
GISSE21Gstd  = std (GISSE21Gts,'omitnan');
GISSE21Hstd  = std (GISSE21Hts,'omitnan');
MIROC6std  = std (MIROC6ts,'omitnan');
MRIESM20std  = std (MRIESM20ts,'omitnan');
SAM0UNICONstd  = std (SAM0UNICONts,'omitnan');
Ensemblestd  = std (EnsembleMeants,'omitnan');

UDELstdNAZ = std (UDELtsNAZ,'omitnan');      %For NAZ crop std
CHIRPSstdNAZ  = std (CHIRPStsNAZ,'omitnan');
CMAPstdNAZ  = std (CMAPtsNAZ,'omitnan');
BCCCSM2MRstdNAZ  = std (BCCCSM2MRtsNAZ,'omitnan');
BCCESM1stdNAZ  = std (BCCESM1tsNAZ,'omitnan');
CanESM5stdNAZ  = std (CanESM5tsNAZ,'omitnan');
CESM2stdNAZ 	= std (CESM2tsNAZ,'omitnan');
CESM2WACCMstdNAZ  = std (CESM2WACCMtsNAZ,'omitnan');
E3SM10stdNAZ  = std (E3SM10tsNAZ,'omitnan');
ECEarth3stdNAZ  = std (ECEarth3tsNAZ,'omitnan');
ECEarth3VegstdNAZ  = std (ECEarth3VegtsNAZ,'omitnan');
GISSE21GstdNAZ  = std (GISSE21GtsNAZ,'omitnan');
GISSE21HstdNAZ  = std (GISSE21HtsNAZ,'omitnan');
MIROC6stdNAZ  = std (MIROC6tsNAZ,'omitnan');
MRIESM20stdNAZ  = std (MRIESM20tsNAZ,'omitnan');
SAM0UNICONstdNAZ  = std (SAM0UNICONtsNAZ,'omitnan');
EnsemblestdNAZ  = std (EnsembleMeantsNAZ,'omitnan');

UDELstdSAZ = std (UDELtsSAZ,'omitnan');      %For SAZ crop std
CHIRPSstdSAZ  = std (CHIRPStsSAZ,'omitnan');
CMAPstdSAZ  = std (CMAPtsSAZ,'omitnan');
BCCCSM2MRstdSAZ  = std (BCCCSM2MRtsSAZ,'omitnan');
BCCESM1stdSAZ  = std (BCCESM1tsSAZ,'omitnan');
CanESM5stdSAZ  = std (CanESM5tsSAZ,'omitnan');
CESM2stdSAZ 	= std (CESM2tsSAZ,'omitnan');
CESM2WACCMstdSAZ  = std (CESM2WACCMtsSAZ,'omitnan');
E3SM10stdSAZ  = std (E3SM10tsSAZ,'omitnan');
ECEarth3stdSAZ  = std (ECEarth3tsSAZ,'omitnan');
ECEarth3VegstdSAZ  = std (ECEarth3VegtsSAZ,'omitnan');
GISSE21GstdSAZ  = std (GISSE21GtsSAZ,'omitnan');
GISSE21HstdSAZ  = std (GISSE21HtsSAZ,'omitnan');
MIROC6stdSAZ  = std (MIROC6tsSAZ,'omitnan');
MRIESM20stdSAZ  = std (MRIESM20tsSAZ,'omitnan');
SAM0UNICONstdSAZ  = std (SAM0UNICONtsSAZ,'omitnan');
EnsemblestdSAZ  = std (EnsembleMeantsSAZ,'omitnan');

UDELmean2 = mean(UDELseason,'omitnan');      %THIS IS ANNUAL CYCLE ANOMALY
CHIRPSmean2 = mean(CHIRPSseason,'omitnan');    %For BRAZILIAN AMAZON crop
CMAPmean2 = mean(CMAPseason,'omitnan');
BCCCSM2MRmean2 = mean(BCCCSM2MRseason,'omitnan');
BCCESM1mean2 = mean(BCCESM1season,'omitnan');
CanESM5mean2 = mean(CanESM5season,'omitnan');
CESM2mean2	= mean(CESM2season,'omitnan');
CESM2WACCMmean2 = mean(CESM2WACCMseason,'omitnan');
E3SM10mean2 = mean(E3SM10season,'omitnan');
ECEarth3mean2 = mean(ECEarth3season,'omitnan');
ECEarth3Vegmean2 = mean(ECEarth3Vegseason,'omitnan');
GISSE21Gmean2 = mean(GISSE21Gseason,'omitnan');
GISSE21Hmean2 = mean(GISSE21Hseason,'omitnan');
MIROC6mean2 = mean(MIROC6season,'omitnan');
MRIESM20mean2 = mean(MRIESM20season,'omitnan');
SAM0UNICONmean2 = mean(SAM0UNICONseason,'omitnan');
Ensemblemean2 = mean(EnsembleMeanseason,'omitnan');

%plot rmse/bias on scatter plot entire Legal Amazon  Brazil
A_bias = [0,-1.23,-0.73,-2.06,-0.59,-0.63,...
    -1.19,-0.73,-0.70,-1.98,-2.35,-0.17,0.62,-1.07,-0.12,-0.35,-0.99];
B_rmse = [0,1.41,1.58,1.43,0.97,1.01,1.17,1.53,1.47,...
    1.09,1.32,1.22,1.04,1.11,0.39,0.48,0.99];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(A_bias,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(0)
xlabel('Bias (mm/day)')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%plot rmse/R^2 on scatter plot legal amazon brazil
C_r2 = [1,0.74,0.67,0.73,0.88,0.86,...
    0.82,0.69,0.71,0.84,0.77,0.80,0.86,0.84,0.98,0.97,0.87];
B_rmse = [0,1.41,1.58,1.43,0.97,1.01,1.17,1.53,1.47,...
    1.09,1.32,1.22,1.04,1.11,0.39,0.48,0.99];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(C_r2,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(1)
xlabel('R^2')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%plot rmse/ccoef on scatter plot legal amazon brazil
C_ccoef = [1,0.8575,0.8172,0.8545,0.9362,0.9297,0.9045,0.8306,...
    0.8448,0.9175,0.8765,0.8959,0.9256,0.9144,0.99,0.9849,0.9328];
B_rmse = [0,1.41,1.58,1.43,0.97,1.01,1.17,1.53,1.47,...
    1.09,1.32,1.22,1.04,1.11,0.39,0.48,0.99];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(C_ccoef,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(1)
xlabel('CCOEF')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%plot rmse/bias on scatter plot NAZ
A_bias = [0	-3.41588 -2.49168 -3.25908 -0.77778	-0.80628 -2.37838 -1.98598... 
    -1.95158 -2.14118 -2.30688 -0.97418 -0.08328 -1.52488 -0.19198 -0.47958 -1.85358];
B_rmse = [0	4.2344	3.8022	4.1016	2.1602	2.2329	3.3364...
    3.4915	3.3868	3.1139	3.4715	2.2132	2.138	2.231	0.5938	0.7904	2.6121];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(A_bias,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(0)
xlabel('Bias (mm/day)')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%plot rmse/ccoef on scatter plot NAZ
C_ccoef = [1	0.4355	0.2826	0.5821	0.7842	0.7819	0.5461	0.3418...
    0.3901	0.6443	0.5279	0.7178	0.7478	0.8094	0.9795	0.9743	0.7478];
B_rmse = [0	4.2344	3.8022	4.1016	2.1602	2.2329	3.3364	3.4915...
    3.3868	3.1139	3.4715	2.2132	2.138	2.231	0.5938	0.7904	2.6121];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(C_ccoef,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(1)
xlabel('CCOEF')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%plot rmse/bias on scatter plot SAZ from Var_stats line 108
A_bias = [0	0.3416	0.5378	-1.2022	-0.4668	-0.5135	-0.3364	0.1696	0.201	-1.8683...	
    -2.3831	0.4121	1.127	-0.7421	-0.0642	-0.3371	-0.3633];
B_rmse = [0	1.2829	1.5601	1.8387	1.6833	1.7455	1.3495	1.354...
    1.3426	2.2452	2.8101	1.841	2.2066	1.655	0.4674	0.7056	1.0269];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(A_bias,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(0)
xlabel('Bias (mm/day)')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%plot rmse/ccoef on scatter plot SAZ
C_ccoef = [1	0.9494	0.9369	0.9204	0.9463	0.946	0.9436	0.9272...
    0.9306	0.9415	0.9262	0.9477	0.9648	0.912	0.9915	0.9861	0.9673];
B_rmse = [0	1.2829	1.5601	1.8387	1.6833	1.7455	1.3495	1.354...
    1.3426	2.2452	2.8101	1.841	2.2066	1.655	0.4674	0.7056	1.0269];
models = ["CHIRPS","BCCCSM2MR","BCCESM1","CanESM5","CESM2","CESM2WACCM","E3SM10",...
    "ECEarth3","ECEarth3Veg","GISSE21G","GISSE21H","MIROC6","MRIESM20",...
    "SAM0UNICON","UDEL","CMAP","Ensemble Mean"]';
CLR = 'rbbbbbbbbbbbbbrrm';
SYM = 'oo+*.xsd^v><phxhs';

figure
gscatter(C_ccoef,B_rmse,models,CLR,SYM,12);
grid on
set(gca,'GridLineStyle','--')
vline(1)
xlabel('CCOEF')
ylabel('RMSE (mm/day)')
hold on
legend('CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM','E3SM10',...
    'ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','UDEL','CMAP','Ensemble Mean')
legend('Location','northeastoutside');

%Get linear reg model of 2050-2100 time series
BCCCSM2MRmdl585 = fitlm(modtime585,BCCCSM2MRts585);    
CanESM5mdl585 = fitlm(modtime585,CanESM5ts585);
CESM2mdl585 = fitlm(modtime585,CESM2ts585);
CESM2WACCMmdl585= fitlm(modtime585,CESM2WACCMts585);
ECEarth3mdl585 = fitlm(modtime585,ECEarth3ts585);
ECEarth3Vegmdl585 = fitlm(modtime585,ECEarth3Vegts585);
MIROC6mdl585 = fitlm(modtime585,MIROC6ts585);
MRIESM20mdl585 = fitlm(modtime585,MRIESM20ts585);
EnsembleMeanmdl585 = fitlm(modtime585,EnsembleMeants585); 

%(13:252)
%(373:612)
%One is for 2051-2070 and the second is for 2081-2100
BCCCSM2MRmean585 = mean(BCCCSM2MRts585(13:252),'omitnan');     %MOD 585 2051-2070 mean
CanESM5mean585 = mean(CanESM5ts585(13:252),'omitnan');
CESM2mean585 = mean(CESM2ts585(13:252),'omitnan');
CESM2WACCMmean585 = mean(CESM2WACCMts585(13:252),'omitnan');
ECEarth3mean585 = mean(ECEarth3ts585(13:252),'omitnan');
ECEarth3Vegmean585 = mean(ECEarth3Vegts585(13:252),'omitnan');
MIROC6mean585 = mean(MIROC6ts585(13:252),'omitnan');
MRIESM20mean585 = mean(MRIESM20ts585(13:252),'omitnan');
EnsembleMeanmean585 = mean(EnsembleMeants585(13:252),'omitnan'); 

%One is for 2051-2070 and the second is for 2081-2100
BCCCSM2MRstd585 = std(BCCCSM2MRts585(13:252),'omitnan');     %MOD 585 2051-2070 sdev
CanESM5std585 = std(CanESM5ts585(13:252),'omitnan');
CESM2std585 = std(CESM2ts585(13:252),'omitnan');
CESM2WACCMstd585 = std(CESM2WACCMts585(13:252),'omitnan');
ECEarth3std585 = std(ECEarth3ts585(13:252),'omitnan');
ECEarth3Vegstd585 = std(ECEarth3Vegts585(13:252),'omitnan');
MIROC6std585 = std(MIROC6ts585(13:252),'omitnan');
MRIESM20std585 = std(MRIESM20ts585(13:252),'omitnan');
EnsembleMeanstd585 = std(EnsembleMeants585(13:252),'omitnan'); 

%(13:252)
%(373:612)
%One is for 2051-2070 and the second is for 2081-2100
BCCCSM2MRmean2585 = mean(BCCCSM2MRts585(373:612),'omitnan');     %MOD 585 2081-2100 mean
CanESM5mean2585 = mean(CanESM5ts585(373:612),'omitnan');
CESM2mean2585 = mean(CESM2ts585(373:612),'omitnan');
CESM2WACCMmean2585 = mean(CESM2WACCMts585(373:612),'omitnan');
ECEarth3mean2585 = mean(ECEarth3ts585(373:612),'omitnan');
ECEarth3Vegmean2585 = mean(ECEarth3Vegts585(373:612),'omitnan');
MIROC6mean2585 = mean(MIROC6ts585(373:612),'omitnan');
MRIESM20mean2585 = mean(MRIESM20ts585(373:612),'omitnan');
EnsembleMeanmean2585 = mean(EnsembleMeants585(373:612),'omitnan'); 

%One is for 2051-2070 and the second is for 2081-2100
BCCCSM2MRstd2585 = std(BCCCSM2MRts585(373:612),'omitnan');     %MOD 585 2081-2100 sdev
CanESM5std2585 = std(CanESM5ts585(373:612),'omitnan');
CESM2std2585 = std(CESM2ts585(373:612),'omitnan');
CESM2WACCMstd2585 = std(CESM2WACCMts585(373:612),'omitnan');
ECEarth3std2585 = std(ECEarth3ts585(373:612),'omitnan');
ECEarth3Vegstd2585 = std(ECEarth3Vegts585(373:612),'omitnan');
MIROC6std2585 = std(MIROC6ts585(373:612),'omitnan');
MRIESM20std2585 = std(MRIESM20ts585(373:612),'omitnan');
EnsembleMeanstd2585 = std(EnsembleMeants585(373:612),'omitnan'); 

%TEST TREND FOR FUTURE DATA
%BCCCSM2MRc585
%CanESM5c585 
%CESM2c585 
%CESM2WACCMc585 
%ECEarth3c585 
%ECEarth3Vegc585
%MIROC6c585 
%MRIESM20c585
%EnsembleMeanc585

%Combine all 8 models in 3d matrix of mean
EnsembleMeanc585 = cat(8,BCCCSM2MRc585 + CanESM5c585 + CESM2c585 + CESM2WACCMc585 +...
    ECEarth3c585 + ECEarth3Vegc585 + MIROC6c585 + MRIESM20c585);
EnsembleMeanc585(isnan(EnsembleMeanc585)) = 0;
EnsembleMeanc585 = sum(EnsembleMeanc585,8)./sum(EnsembleMeanc585 ~=0,4);

[tr,p] = trend(EnsembleMeanc585,12,'omitnan');   %switch out models

StatisticallySignificant = p<0.2;  %change this to .01, .05, .1

figure
imagescn(lon2,lat,tr*10)   %*10 for decadal values
cb=colorbar;
ylabel(cb,'Decadal precipitation trend [mm/day]')
cmocean('-balance','pivot')
hold on
xlim([-75 -43])
ylim([-20 7])
%caxis([-.05 .05]) 
hold on
stipple(lon2,lat,StatisticallySignificant,'density',200,'markersize',9)


UDELbias = mean(UDELts2(25:432)-CHIRPSts2,'omitnan');   %bias with CHIRPSts2 (mm/day) as ref
CHIRPSbias = mean(CHIRPSts2-CHIRPSts2,'omitnan');
CMAPbias = mean(CMAPts(25:432)-CHIRPSts2,'omitnan');
BCCCSM2MRbias = mean(BCCCSM2MRts(25:432)-CHIRPSts2,'omitnan');
BCCESM1bias = mean(BCCESM1ts(25:432)-CHIRPSts2,'omitnan');
CanESM5bias = mean(CanESM5ts(25:432)-CHIRPSts2,'omitnan');
CESM2bias	= mean(CESM2ts(25:432)-CHIRPSts2,'omitnan');
CESM2WACCMbias = mean(CESM2WACCMts(25:432)-CHIRPSts2,'omitnan');
E3SM10bias = mean(E3SM10ts(25:432)-CHIRPSts2,'omitnan');
ECEarth3bias = mean(ECEarth3ts(25:432)-CHIRPSts2,'omitnan');
ECEarth3Vegbias = mean(ECEarth3Vegts(25:432)-CHIRPSts2,'omitnan');
GISSE21Gbias = mean(GISSE21Gts(25:432)-CHIRPSts2,'omitnan');
GISSE21Hbias = mean(GISSE21Hts(25:432)-CHIRPSts2,'omitnan');
MIROC6bias = mean(MIROC6ts(25:432)-CHIRPSts2,'omitnan');
MRIESM20bias = mean(MRIESM20ts(25:432)-CHIRPSts2,'omitnan');
SAM0UNICONbias = mean(SAM0UNICONts(25:432)-CHIRPSts2,'omitnan');
Ensemblebias = mean(EnsembleMeants(25:432)-CHIRPSts2,'omitnan');

UDELbiasNAZ = mean(UDELtsNAZ-CHIRPStsNAZ,'omitnan');   %NAZ bias w/CHIRPS
CHIRPSbiasNAZ = mean(CHIRPStsNAZ-CHIRPStsNAZ,'omitnan');
CMAPbiasNAZ = mean(CMAPtsNAZ-CHIRPStsNAZ,'omitnan');
BCCCSM2MRbiasNAZ = mean(BCCCSM2MRtsNAZ-CHIRPStsNAZ,'omitnan');
BCCESM1biasNAZ = mean(BCCESM1tsNAZ-CHIRPStsNAZ,'omitnan');
CanESM5biasNAZ = mean(CanESM5tsNAZ-CHIRPStsNAZ,'omitnan');
CESM2biasNAZ	= mean(CESM2tsNAZ-CHIRPStsNAZ,'omitnan');
CESM2WACCMbiasNAZ = mean(CESM2WACCMtsNAZ-CHIRPStsNAZ,'omitnan');
E3SM10biasNAZ = mean(E3SM10tsNAZ-CHIRPStsNAZ,'omitnan');
ECEarth3biasNAZ = mean(ECEarth3tsNAZ-CHIRPStsNAZ,'omitnan');
ECEarth3VegbiasNAZ = mean(ECEarth3VegtsNAZ-CHIRPStsNAZ,'omitnan');
GISSE21GbiasNAZ = mean(GISSE21GtsNAZ-CHIRPStsNAZ,'omitnan');
GISSE21HbiasNAZ = mean(GISSE21HtsNAZ-CHIRPStsNAZ,'omitnan');
MIROC6biasNAZ = mean(MIROC6tsNAZ-CHIRPStsNAZ,'omitnan');
MRIESM20biasNAZ = mean(MRIESM20tsNAZ-CHIRPStsNAZ,'omitnan');
SAM0UNICONbiasNAZ = mean(SAM0UNICONtsNAZ-CHIRPStsNAZ,'omitnan');
EnsemblebiasNAZ = mean(EnsembleMeantsNAZ-CHIRPStsNAZ,'omitnan');

UDELbiasSAZ = mean(UDELtsSAZ-CHIRPStsSAZ,'omitnan');   %SAZ bias w/CHIRPS
CHIRPSbiasSAZ = mean(CHIRPStsSAZ-CHIRPStsSAZ,'omitnan');
CMAPbiasSAZ = mean(CMAPtsSAZ-CHIRPStsSAZ,'omitnan');
BCCCSM2MRbiasSAZ = mean(BCCCSM2MRtsSAZ-CHIRPStsSAZ,'omitnan');
BCCESM1biasSAZ = mean(BCCESM1tsSAZ-CHIRPStsSAZ,'omitnan');
CanESM5biasSAZ = mean(CanESM5tsSAZ-CHIRPStsSAZ,'omitnan');
CESM2biasSAZ	= mean(CESM2tsSAZ-CHIRPStsSAZ,'omitnan');
CESM2WACCMbiasSAZ = mean(CESM2WACCMtsSAZ-CHIRPStsSAZ,'omitnan');
E3SM10biasSAZ = mean(E3SM10tsSAZ-CHIRPStsSAZ,'omitnan');
ECEarth3biasSAZ = mean(ECEarth3tsSAZ-CHIRPStsSAZ,'omitnan');
ECEarth3VegbiasSAZ = mean(ECEarth3VegtsSAZ-CHIRPStsSAZ,'omitnan');
GISSE21GbiasSAZ = mean(GISSE21GtsSAZ-CHIRPStsSAZ,'omitnan');
GISSE21HbiasSAZ = mean(GISSE21HtsSAZ-CHIRPStsSAZ,'omitnan');
MIROC6biasSAZ = mean(MIROC6tsSAZ-CHIRPStsSAZ,'omitnan');
MRIESM20biasSAZ = mean(MRIESM20tsSAZ-CHIRPStsSAZ,'omitnan');
SAM0UNICONbiasSAZ = mean(SAM0UNICONtsSAZ-CHIRPStsSAZ,'omitnan');
EnsemblebiasSAZ = mean(EnsembleMeantsSAZ-CHIRPStsSAZ,'omitnan');

%generate Rsquare values with CHIRPS by creating a linear model for ts
UDELmdl = fitlm(UDELts2(25:432),CHIRPSts2); 
CHIRPSmdl = fitlm(CHIRPSts2,CHIRPSts2);
CMAPmdl = fitlm(CMAPts(25:432),CHIRPSts2);
BCCCSM2MRmdl = fitlm(BCCCSM2MRts(25:432),CHIRPSts2);
BCCESM1mdl = fitlm(BCCESM1ts(25:432),CHIRPSts2);
CanESM5mdl = fitlm(CanESM5ts(25:432),CHIRPSts2);
CESM2mdl	= fitlm(CESM2ts(25:432),CHIRPSts2);
CESM2WACCMmdl = fitlm(CESM2WACCMts(25:432),CHIRPSts2);
E3SM10mdl = fitlm(E3SM10ts(25:432),CHIRPSts2);
ECEarth3mdl = fitlm(ECEarth3ts(25:432),CHIRPSts2);
ECEarth3Vegmdl = fitlm(ECEarth3Vegts(25:432),CHIRPSts2);
GISSE21Gmdl = fitlm(GISSE21Gts(25:432),CHIRPSts2);
GISSE21Hmdl = fitlm(GISSE21Hts(25:432),CHIRPSts2);
MIROC6mdl = fitlm(MIROC6ts(25:432),CHIRPSts2);
MRIESM20mdl = fitlm(MRIESM20ts(25:432),CHIRPSts2);
SAM0UNICONmdl = fitlm(SAM0UNICONts(25:432),CHIRPSts2);
Ensemblemdl = fitlm(EnsembleMeants(25:432),CHIRPSts2);

%generate Rsquare values with CHIRPS NAZ
UDELmdlNAZ = fitlm(UDELtsNAZ,CHIRPStsNAZ); 
CHIRPSmdlNAZ = fitlm(CHIRPStsNAZ,CHIRPStsNAZ);
CMAPmdlNAZ = fitlm(CMAPtsNAZ,CHIRPStsNAZ);
BCCCSM2MRmdlNAZ = fitlm(BCCCSM2MRtsNAZ,CHIRPStsNAZ);
BCCESM1mdlNAZ = fitlm(BCCESM1tsNAZ,CHIRPStsNAZ);
CanESM5mdlNAZ = fitlm(CanESM5tsNAZ,CHIRPStsNAZ);
CESM2mdlNAZ	= fitlm(CESM2tsNAZ,CHIRPStsNAZ);
CESM2WACCMmdlNAZ = fitlm(CESM2WACCMtsNAZ,CHIRPStsNAZ);
E3SM10mdlNAZ = fitlm(E3SM10tsNAZ,CHIRPStsNAZ);
ECEarth3mdlNAZ = fitlm(ECEarth3tsNAZ,CHIRPStsNAZ);
ECEarth3VegmdlNAZ = fitlm(ECEarth3VegtsNAZ,CHIRPStsNAZ);
GISSE21GmdlNAZ = fitlm(GISSE21GtsNAZ,CHIRPStsNAZ);
GISSE21HmdlNAZ = fitlm(GISSE21HtsNAZ,CHIRPStsNAZ);
MIROC6mdlNAZ = fitlm(MIROC6tsNAZ,CHIRPStsNAZ);
MRIESM20mdlNAZ = fitlm(MRIESM20tsNAZ,CHIRPStsNAZ);
SAM0UNICONmdlNAZ = fitlm(SAM0UNICONtsNAZ,CHIRPStsNAZ);
EnsemblemdlNAZ = fitlm(EnsembleMeantsNAZ,CHIRPStsNAZ);

%generate Rsquare values with CHIRPS SAZ
UDELmdlSAZ = fitlm(UDELtsSAZ,CHIRPStsSAZ); 
CHIRPSmdlSAZ = fitlm(CHIRPStsSAZ,CHIRPStsSAZ);
CMAPmdlSAZ = fitlm(CMAPtsSAZ,CHIRPStsSAZ);
BCCCSM2MRmdlSAZ = fitlm(BCCCSM2MRtsSAZ,CHIRPStsSAZ);
BCCESM1mdlSAZ = fitlm(BCCESM1tsSAZ,CHIRPStsSAZ);
CanESM5mdlSAZ = fitlm(CanESM5tsSAZ,CHIRPStsSAZ);
CESM2mdlSAZ	= fitlm(CESM2tsSAZ,CHIRPStsSAZ);
CESM2WACCMmdlSAZ = fitlm(CESM2WACCMtsSAZ,CHIRPStsSAZ);
E3SM10mdlSAZ = fitlm(E3SM10tsSAZ,CHIRPStsSAZ);
ECEarth3mdlSAZ = fitlm(ECEarth3tsSAZ,CHIRPStsSAZ);
ECEarth3VegmdlSAZ = fitlm(ECEarth3VegtsSAZ,CHIRPStsSAZ);
GISSE21GmdlSAZ = fitlm(GISSE21GtsSAZ,CHIRPStsSAZ);
GISSE21HmdlSAZ = fitlm(GISSE21HtsSAZ,CHIRPStsSAZ);
MIROC6mdlSAZ = fitlm(MIROC6tsSAZ,CHIRPStsSAZ);
MRIESM20mdlSAZ = fitlm(MRIESM20tsSAZ,CHIRPStsSAZ);
SAM0UNICONmdlSAZ = fitlm(SAM0UNICONtsSAZ,CHIRPStsSAZ);
EnsemblemdlSAZ = fitlm(EnsembleMeantsSAZ,CHIRPStsSAZ);

%rmse with CHIRPSts (mm/day) as ref
UDELrmse = sqrt(sum((UDELts2(25:432)-CHIRPSts2(:)).^2)/numel(UDELts2(25:432)));
CHIRPSrmse = sqrt(sum((CHIRPSts2(:)-CHIRPSts2(:)).^2)/numel(CHIRPSts2));
CMAPrmse = sqrt(sum((CMAPts(25:432)-CHIRPSts2(:)).^2)/numel(CMAPts(25:432)));
BCCCSM2MRrmse = sqrt(sum((BCCCSM2MRts(25:432)-CHIRPSts2(:)).^2)/numel(BCCCSM2MRts(25:432)));
BCCESM1rmse = sqrt(sum((BCCESM1ts(25:432)-CHIRPSts2(:)).^2)/numel(BCCESM1ts(25:432)));
CanESM5rmse = sqrt(sum((CanESM5ts(25:432)-CHIRPSts2(:)).^2)/numel(CanESM5ts(25:432)));
CESM2rmse	= sqrt(sum((CESM2ts(25:432)-CHIRPSts2(:)).^2)/numel(CESM2ts(25:432)));
CESM2WACCMrmse = sqrt(sum((CESM2WACCMts(25:432)-CHIRPSts2(:)).^2)/numel(CESM2WACCMts(25:432)));
E3SM10rmse = sqrt(sum((E3SM10ts(25:432)-CHIRPSts2(:)).^2)/numel(E3SM10ts(25:432)));
ECEarth3rmse = sqrt(sum((ECEarth3ts(25:432)-CHIRPSts2(:)).^2)/numel(ECEarth3ts(25:432)));
ECEarth3Vegrmse = sqrt(sum((ECEarth3Vegts(25:432)-CHIRPSts2(:)).^2)/numel(ECEarth3Vegts(25:432)));
GISSE21Grmse = sqrt(sum((GISSE21Gts(25:432)-CHIRPSts2(:)).^2)/numel(GISSE21Gts(25:432)));
GISSE21Hrmse = sqrt(sum((GISSE21Hts(25:432)-CHIRPSts2(:)).^2)/numel(GISSE21Hts(25:432)));
MIROC6rmse = sqrt(sum((MIROC6ts(25:432)-CHIRPSts2(:)).^2)/numel(MIROC6ts(25:432)));
MRIESM20rmse = sqrt(sum((MRIESM20ts(25:432)-CHIRPSts2(:)).^2)/numel(MRIESM20ts(25:432)));
SAM0UNICONrmse = sqrt(sum((SAM0UNICONts(25:432)-CHIRPSts2(:)).^2)/numel(SAM0UNICONts(25:432)));
Ensemblermse = sqrt(sum((EnsembleMeants(25:432)-CHIRPSts2(:)).^2)/numel(EnsembleMeants(25:432)));

%rmse with CHIRPSts (mm/day) as ref NAZ
UDELrmseNAZ = sqrt(sum((UDELtsNAZ-CHIRPStsNAZ).^2)/numel(UDELtsNAZ));
CHIRPSrmseNAZ = sqrt(sum((CHIRPStsNAZ-CHIRPStsNAZ).^2)/numel(CHIRPStsNAZ));
CMAPrmseNAZ = sqrt(sum((CMAPtsNAZ-CHIRPStsNAZ).^2)/numel(CMAPtsNAZ));
BCCCSM2MRrmseNAZ = sqrt(sum((BCCCSM2MRtsNAZ-CHIRPStsNAZ).^2)/numel(BCCCSM2MRtsNAZ));
BCCESM1rmseNAZ = sqrt(sum((BCCESM1tsNAZ-CHIRPStsNAZ).^2)/numel(BCCESM1tsNAZ));
CanESM5rmseNAZ = sqrt(sum((CanESM5tsNAZ-CHIRPStsNAZ).^2)/numel(CanESM5tsNAZ));
CESM2rmseNAZ	= sqrt(sum((CESM2tsNAZ-CHIRPStsNAZ).^2)/numel(CESM2tsNAZ));
CESM2WACCMrmseNAZ = sqrt(sum((CESM2WACCMtsNAZ-CHIRPStsNAZ).^2)/numel(CESM2WACCMtsNAZ));
E3SM10rmseNAZ = sqrt(sum((E3SM10tsNAZ-CHIRPStsNAZ).^2)/numel(E3SM10tsNAZ));
ECEarth3rmseNAZ = sqrt(sum((ECEarth3tsNAZ-CHIRPStsNAZ).^2)/numel(ECEarth3tsNAZ));
ECEarth3VegrmseNAZ = sqrt(sum((ECEarth3VegtsNAZ-CHIRPStsNAZ).^2)/numel(ECEarth3VegtsNAZ));
GISSE21GrmseNAZ = sqrt(sum((GISSE21GtsNAZ-CHIRPStsNAZ).^2)/numel(GISSE21GtsNAZ));
GISSE21HrmseNAZ = sqrt(sum((GISSE21HtsNAZ-CHIRPStsNAZ).^2)/numel(GISSE21HtsNAZ));
MIROC6rmseNAZ = sqrt(sum((MIROC6tsNAZ-CHIRPStsNAZ).^2)/numel(MIROC6tsNAZ));
MRIESM20rmseNAZ = sqrt(sum((MRIESM20tsNAZ-CHIRPStsNAZ).^2)/numel(MRIESM20tsNAZ));
SAM0UNICONrmseNAZ = sqrt(sum((SAM0UNICONtsNAZ-CHIRPStsNAZ).^2)/numel(SAM0UNICONtsNAZ));
EnsemblermseNAZ = sqrt(sum((EnsembleMeantsNAZ-CHIRPStsNAZ).^2)/numel(EnsembleMeantsNAZ));

%rmse with CHIRPSts (mm/day) as ref SAZ
UDELrmseSAZ = sqrt(sum((UDELtsSAZ-CHIRPStsSAZ).^2)/numel(UDELtsSAZ));
CHIRPSrmseSAZ = sqrt(sum((CHIRPStsSAZ-CHIRPStsSAZ).^2)/numel(CHIRPStsSAZ));
CMAPrmseSAZ = sqrt(sum((CMAPtsSAZ-CHIRPStsSAZ).^2)/numel(CMAPtsSAZ));
BCCCSM2MRrmseSAZ = sqrt(sum((BCCCSM2MRtsSAZ-CHIRPStsSAZ).^2)/numel(BCCCSM2MRtsSAZ));
BCCESM1rmseSAZ = sqrt(sum((BCCESM1tsSAZ-CHIRPStsSAZ).^2)/numel(BCCESM1tsSAZ));
CanESM5rmseSAZ = sqrt(sum((CanESM5tsSAZ-CHIRPStsSAZ).^2)/numel(CanESM5tsSAZ));
CESM2rmseSAZ	= sqrt(sum((CESM2tsSAZ-CHIRPStsSAZ).^2)/numel(CESM2tsSAZ));
CESM2WACCMrmseSAZ = sqrt(sum((CESM2WACCMtsSAZ-CHIRPStsSAZ).^2)/numel(CESM2WACCMtsSAZ));
E3SM10rmseSAZ = sqrt(sum((E3SM10tsSAZ-CHIRPStsSAZ).^2)/numel(E3SM10tsSAZ));
ECEarth3rmseSAZ = sqrt(sum((ECEarth3tsSAZ-CHIRPStsSAZ).^2)/numel(ECEarth3tsSAZ));
ECEarth3VegrmseSAZ = sqrt(sum((ECEarth3VegtsSAZ-CHIRPStsSAZ).^2)/numel(ECEarth3VegtsSAZ));
GISSE21GrmseSAZ = sqrt(sum((GISSE21GtsSAZ-CHIRPStsSAZ).^2)/numel(GISSE21GtsSAZ));
GISSE21HrmseSAZ = sqrt(sum((GISSE21HtsSAZ-CHIRPStsSAZ).^2)/numel(GISSE21HtsSAZ));
MIROC6rmseSAZ = sqrt(sum((MIROC6tsSAZ-CHIRPStsSAZ).^2)/numel(MIROC6tsSAZ));
MRIESM20rmseSAZ = sqrt(sum((MRIESM20tsSAZ-CHIRPStsSAZ).^2)/numel(MRIESM20tsSAZ));
SAM0UNICONrmseSAZ = sqrt(sum((SAM0UNICONtsSAZ-CHIRPStsSAZ).^2)/numel(SAM0UNICONtsSAZ));
EnsemblermseSAZ = sqrt(sum((EnsembleMeantsSAZ-CHIRPStsSAZ).^2)/numel(EnsembleMeantsSAZ));

%Spatial correlation using CHIRPS as reference
%Matrix for each data is [mod]cp or [obs]cp 'cp' is for 'crop permute'
%i = lon = 261
%j = lat = 220
UDELcp = permute(UDELc, [2 1 3]);
  for i=1:261
      for j=1:220
          UDELspcorr(i,j)=corr2(squeeze(UDELcp(i,j,:)),squeeze(UDELcp(i,j,:)));
      end
      UDELspcorr = permute(UDELspcorr, [2 1]);
  end

  
%Another test of spatial correlation with nan values
%Get 2d mean of 3d matrices
%but corrcoef(A,'Rows','complete') omits all rows of A w/one or more NaN values
%*30.4167 for models and CMAP
% BCCCSM2MRc
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc 
% UDELc
% CMAPc
% CHIRPSc
CHIRPS2d = mean(CHIRPSc,3,'omitnan');

UDEL2d = mean(UDELc,3,'omitnan');
UDELspcorr_test = corrcoef(UDEL2d,CHIRPS2d,'rows','complete');

CMAP2d = mean(CMAPc*30.4167,3,'omitnan');
CMAPspcorr_test = corrcoef(CMAP2d,CHIRPS2d,'rows','complete');

BCCCSM2MR2d = mean(BCCCSM2MRc*30.4167,3,'omitnan');
BCCCSM2MRspcorr_test = corrcoef(BCCCSM2MR2d,CHIRPS2d,'rows','complete');

BCCESM12d = mean(BCCESM1c*30.4167,3,'omitnan');
BCCESM1spcorr_test = corrcoef(BCCESM12d,CHIRPS2d,'rows','complete');

CanESM52d = mean(CanESM5c*30.4167,3,'omitnan');
CanESM5spcorr_test = corrcoef(CanESM52d,CHIRPS2d,'rows','complete');

CESM22d = mean(CESM2c*30.4167,3,'omitnan');
CESM2spcorr_test = corrcoef(CESM22d,CHIRPS2d,'rows','complete');

CESM2WACCM2d = mean(CESM2WACCMc*30.4167,3,'omitnan');
CESM2WACCMspcorr_test = corrcoef(CESM2WACCM2d,CHIRPS2d,'rows','complete');

E3SM102d = mean(E3SM10c*30.4167,3,'omitnan');
E3SM10spcorr_test = corrcoef(E3SM102d,CHIRPS2d,'rows','complete');

ECEarth32d = mean(ECEarth3c*30.4167,3,'omitnan');
ECEarth3spcorr_test = corrcoef(ECEarth32d,CHIRPS2d,'rows','complete');

ECEarth3Veg2d = mean(ECEarth3Vegc*30.4167,3,'omitnan');
ECEarth3Vegspcorr_test = corrcoef(ECEarth3Veg2d,CHIRPS2d,'rows','complete');

GISSE21G2d = mean(GISSE21Gc*30.4167,3,'omitnan');
GISSE21Gspcorr_test = corrcoef(GISSE21G2d,CHIRPS2d,'rows','complete');

GISSE21H2d = mean(GISSE21Hc*30.4167,3,'omitnan');
GISSE21Hspcorr_test = corrcoef(GISSE21H2d,CHIRPS2d,'rows','complete');

MIROC62d = mean(MIROC6c*30.4167,3,'omitnan');
MIROC6spcorr_test = corrcoef(MIROC62d,CHIRPS2d,'rows','complete');

MRIESM202d = mean(MRIESM20c*30.4167,3,'omitnan');
MRIESM20spcorr_test = corrcoef(MRIESM202d,CHIRPS2d,'rows','complete');

SAM0UNICON2d = mean(SAM0UNICONc*30.4167,3,'omitnan');
SAM0UNICONspcorr_test = corrcoef(SAM0UNICON2d,CHIRPS2d,'rows','complete');
  
%pr anomalies (not abs values) compare to ref time series
%zero phase correlation
%(mod,ref,'maxlags',6,'detrend')
%With CHIRPS, use UDELts(25:432)
%UDELts2 is mm/day
% BCCCSM2MRc
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc 
% CMAPc
% CHIRPSc
[r0,rmax,lags] = xcorr3(CHIRPSc,UDELts2(25:432),'maxlags',6,'detrend');

%maximum pr occurs at the specific lag offset from eachother

figure
imagescn(lon2,lat,lags)
axis xy image
cb = colorbar;
ylabel(cb,'lags (months)')
xlabel longitude
ylabel latitude
xlim([-75 -43])
ylim([-18 7])
caxis([-6 6])
cmocean phase

hold on
[C,h] = contour(lon2,lat,rmax,'color',0.2*[1 1 1]);  %max correlation
clabel(C,h,'color',rgb('dark gray'),'fontsize',8,'labelspacing',300);

%zero-phase correlation of anomalies plot
%map of correlation coefficients between grid cells of a 
%3D spatiotemporal dataset and a reference time series.
%With CHIRPS, use UDELts(25:432)
% BCCCSM2MRc
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc 
% CMAPc
% CHIRPSc
[r0,rmax,lags] = xcorr3(CHIRPSc,UDELts2(25:432),'detrend');
figure
imagescn(lon2,lat,r0)
axis xy image
cb = colorbar;
ylabel(cb,'zero-phase correlation')
caxis([-1 1])
xlabel longitude
ylabel latitude
xlim([-75 -43])
ylim([-18 7])
cmocean balance

%Rsq (percent variance) in grid that's explained by relationship with ts
[Lon,Lat] = meshgrid(lon2,lat);
[R,P] = corr3(BCCCSM2MRc,UDELts2,'detrend');
Rsq = R.^2 .* sign(R);

rsqmask = P<=0.01;

figure
imagescn(lon2,lat,Rsq)
axis xy image
caxis([-1 1])
cmocean balance
cb = colorbar;
ylabel(cb,'r^2')
xlabel longitude
ylabel latitude
xlim([-75 -43])
ylim([-18 7])

hold on
stipple(Lon,Lat,rsqmask,'density',150)
%stipple(X,Y,mask,'density',75,'color','r','marker','+','markersize',9)
%stipple(lat,lon2,(P<0.1)','color','k','markersize',5)

%corr2 Calculate corr coeff between two images
%Use [mod]c for the 'cropped' data
%R = corr2(A,B)

[tr,p] = trend(CESM2WACCMc585,12,'omitnan');

StatisticallySignificant = p<0.1;
[Lon,Lat] = meshgrid(lon2,lat);

figure
%imagescn(lon2,lat,tr*12)   %multiply by 365 for annual trend (12 for UDEL/CHIRPS)
contourf(lon2,lat,tr*365,'--')  %'edgecolor','none'
cb = colorbar;
ylabel(cb,'Precipitation trend mm year^{-1}')
cmocean('tarn')   %-balance
xlim([-75 -43])
ylim([-20 7])
%caxis([-20 20])
hold on
stipple(Lon,Lat,StatisticallySignificant)

%%%%%%%%%%%%%%%   LOAD IN pr *c.mat files. HIST & FUTURE
clear all

%Change current folder
cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6'

% Load in pr mat files in Final_Files folder
%Just change '.\Final_Files\
%Data is 1981-2014 monthly data with 408 timesteps
%Lat is 220 and Lon is 261 
%CHIRPS and UDEL are mm/month all others are mm/day
fds = fileDatastore('.\Final_Files\*c.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%Future data
fds = fileDatastore('.\Final_Files\*c585.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

StartDate2 = datetime(1981,01,01);  %for all if you load in new files
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;
modtimeColumn2 = modtime2.';
modtime2 = datenum(modtime2');

%Create repeating day matrices for CHIRPS/UDEL
%Units for these are mm/month. I need mm/day
n = 34;   %for chirps years
x = 36;   %for udel years
%days = [31,28,31,30,31,30,31,31,30,31,30,31];   %days/month
jan = repmat(31,220,261); feb= repmat(28,220,261); mar = repmat(31,220,261);...
    apr = repmat(30,220,261); may = repmat(31,220,261); jun = repmat(30,220,261);...
    jul = repmat(31,220,261); aug = repmat(31,220,261); sep = repmat(30,220,261);...
    oct = repmat(31,220,261); nov = repmat(30,220,261); dec = repmat(31,220,261);
days = cat(3,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);
CHIRPSdays = repmat(days,[1 1 n]);
UDELdays = repmat(days,[1 1 x]);   %and for all other models

%Divide CHIRPS/UDEL by CHIRPSdays
CHIRPSc = CHIRPSc./CHIRPSdays;
UDELc = UDELc./CHIRPSdays;

mean(CHIRPSc,'all','omitnan')

lon2 = lon-360;   %adjust lon

%Get mean plots
UDELmeanplot = mean(UDELc,3,'omitnan');      %mean for MOD HIST
CHIRPSmeanplot = mean(CHIRPSc,3,'omitnan');
CMAPmeanplot = mean(CMAPc,3,'omitnan');
BCCCSM2MRmeanplot = mean(BCCCSM2MRc,3,'omitnan');
BCCESM1meanplot = mean(BCCESM1c,3,'omitnan');
CanESM5meanplot = mean(CanESM5c,3,'omitnan');
CESM2meanplot	= mean(CESM2c,3,'omitnan');
CESM2WACCMmeanplot = mean(CESM2WACCMc,3,'omitnan');
E3SM10meanplot = mean(E3SM10c,3,'omitnan');
ECEarth3meanplot = mean(ECEarth3c,3,'omitnan');
ECEarth3Vegmeanplot = mean(ECEarth3Vegc,3,'omitnan');
GISSE21Gmeanplot = mean(GISSE21Gc,3,'omitnan');
GISSE21Hmeanplot = mean(GISSE21Hc,3,'omitnan');
MIROC6meanplot = mean(MIROC6c,3,'omitnan');
MRIESM20meanplot = mean(MRIESM20c,3,'omitnan');
SAM0UNICONmeanplot = mean(SAM0UNICONc,3,'omitnan');

%Get std plots
UDELstdplot = std(UDELc,[],3,'omitnan');      %std for MOD HIST
CHIRPSstdplot = std(CHIRPSc,[],3,'omitnan');
CMAPstdplot = std(CMAPc,[],3,'omitnan');
BCCCSM2MRstdplot = std(BCCCSM2MRc,[],3,'omitnan');
BCCESM1stdplot = std(BCCESM1c,[],3,'omitnan');
CanESM5stdplot = std(CanESM5c,[],3,'omitnan');
CESM2stdplot	= std(CESM2c,[],3,'omitnan');
CESM2WACCMstdnplot = std(CESM2WACCMc,[],3,'omitnan');
E3SM10stdplot = std(E3SM10c,[],3,'omitnan');
ECEarth3stdplot = std(ECEarth3c,[],3,'omitnan');
ECEarth3Vegstdplot = std(ECEarth3Vegc,[],3,'omitnan');
GISSE21Gstdplot = std(GISSE21Gc,[],3,'omitnan');
GISSE21Hstdplot = std(GISSE21Hc,[],3,'omitnan');
MIROC6stdplot = std(MIROC6c,[],3,'omitnan');
MRIESM20stdplot = std(MRIESM20c,[],3,'omitnan');
SAM0UNICONstdplot = std(SAM0UNICONc,[],3,'omitnan');

UDELstdplot = std(UDELc,0,3,'omitnan');      %std for MOD HIST
CHIRPSstdplot = std(CHIRPSc,0,3,'omitnan');
CMAPstdplot = std(CMAPc,0,3,'omitnan');
BCCCSM2MRstdplot = std(BCCCSM2MRc,0,3,'omitnan');
BCCESM1stdplot = std(BCCESM1c,0,3,'omitnan');
CanESM5stdplot = std(CanESM5c,0,3,'omitnan');
CESM2stdplot	= std(CESM2c,0,3,'omitnan');
CESM2WACCMstdplot = std(CESM2WACCMc,0,3,'omitnan');
E3SM10stdplot = std(E3SM10c,0,3,'omitnan');
ECEarth3stdplot = std(ECEarth3c,0,3,'omitnan');
ECEarth3Vegstdplot = std(ECEarth3Vegc,0,3,'omitnan');
GISSE21Gstdplot = std(GISSE21Gc,0,3,'omitnan');
GISSE21Hstdplot = std(GISSE21Hc,0,3,'omitnan');
MIROC6stdplot = std(MIROC6c,0,3,'omitnan');
MRIESM20stdplot = std(MRIESM20c,0,3,'omitnan');
SAM0UNICONstdplot = std(SAM0UNICONc,0,3,'omitnan');

BCCCSM2MRmeanplot585 = mean(BCCCSM2MRc585,3,'omitnan');   %mean for MOD585
CanESM5meanplot585 = mean(CanESM5c585,3,'omitnan');
CESM2meanplot585 = mean(CESM2c585,3,'omitnan');
CESM2WACCMmeanplot585 = mean(CESM2WACCMc585,3,'omitnan');
ECEarth3meanplot585 = mean(ECEarth3c585,3,'omitnan');
ECEarth3Vegmeanplot585 = mean(ECEarth3Vegc585,3,'omitnan');
MIROC6meanplot585 = mean(MIROC6c585,3,'omitnan');
MRIESM20meanplot585 = mean(MRIESM20c585,3,'omitnan');

BCCCSM2MRstdplot585 = std(BCCCSM2MRc585,[],3,'omitnan');   %std for MOD585
CanESM5stdplot585 = std(CanESM5c585,[],3,'omitnan');
CESM2stdplot585 = std(CESM2c585,[],3,'omitnan');
CESM2WACCMstdplot585 = std(CESM2WACCMc585,[],3,'omitnan');
ECEarth3stdplot585 = std(ECEarth3c585,[],3,'omitnan');
ECEarth3Vegstdplot585 = std(ECEarth3Vegc585,[],3,'omitnan');
MIROC6stdplot585 = std(MIROC6c585,[],3,'omitnan');
MRIESM20stdplot585 = std(MRIESM20c585,[],3,'omitnan');

BCCCSM2MRmeanplot2070 = mean(BCCCSM2MRc585(:,:,13:252),3,'omitnan');   %mean for MOD585 2051-2070
CanESM5meanplot2070 = mean(CanESM5c585(:,:,13:252),3,'omitnan');
CESM2meanplot2070 = mean(CESM2c585(:,:,13:252),3,'omitnan');
CESM2WACCMmeanplot2070 = mean(CESM2WACCMc585(:,:,13:252),3,'omitnan');
ECEarth3meanplot2070 = mean(ECEarth3c585(:,:,13:252),3,'omitnan');
ECEarth3Vegmeanplot2070 = mean(ECEarth3Vegc585(:,:,13:252),3,'omitnan');
MIROC6meanplot2070 = mean(MIROC6c585(:,:,13:252),3,'omitnan');
MRIESM20meanplot2070 = mean(MRIESM20c585(:,:,13:252),3,'omitnan');

BCCCSM2MRstdplot2070 = std(BCCCSM2MRc585(:,:,13:252),[],3,'omitnan');   %std for MOD585 2051-2070
CanESM5stdplot2070 = std(CanESM5c585(:,:,13:252),[],3,'omitnan');
CESM2stdplot2070 = std(CESM2c585(:,:,13:252),[],3,'omitnan');
CESM2WACCMstdplot2070 = std(CESM2WACCMc585(:,:,13:252),[],3,'omitnan');
ECEarth3stdplot2070 = std(ECEarth3c585(:,:,13:252),[],3,'omitnan');
ECEarth3Vegstdplot2070 = std(ECEarth3Vegc585(:,:,13:252),[],3,'omitnan');
MIROC6stdplot2070 = std(MIROC6c585(:,:,13:252),[],3,'omitnan');
MRIESM20stdplot2070 = std(MRIESM20c585(:,:,13:252),[],3,'omitnan');

BCCCSM2MRmeanplot2100 = mean(BCCCSM2MRc585(:,:,373:612),3,'omitnan');   %mean for MOD585 2081-2100
CanESM5meanplot2100 = mean(CanESM5c585(:,:,373:612),3,'omitnan');
CESM2meanplot2100 = mean(CESM2c585(:,:,373:612),3,'omitnan');
CESM2WACCMmeanplot2100 = mean(CESM2WACCMc585(:,:,373:612),3,'omitnan');
ECEarth3meanplot2100 = mean(ECEarth3c585(:,:,373:612),3,'omitnan');
ECEarth3Vegmeanplot2100 = mean(ECEarth3Vegc585(:,:,373:612),3,'omitnan');
MIROC6meanplot2100 = mean(MIROC6c585(:,:,373:612),3,'omitnan');
MRIESM20meanplot2100 = mean(MRIESM20c585(:,:,373:612),3,'omitnan');

BCCCSM2MRstdplot2100 = std(BCCCSM2MRc585(:,:,373:612),[],3,'omitnan');   %std for MOD585 2081-2100
CanESM5stdplot2100 = std(CanESM5c585(:,:,373:612),[],3,'omitnan');
CESM2stdplot2100 = std(CESM2c585(:,:,373:612),[],3,'omitnan');
CESM2WACCMstdplot2100 = std(CESM2WACCMc585(:,:,373:612),[],3,'omitnan');
ECEarth3stdplot2100 = std(ECEarth3c585(:,:,373:612),[],3,'omitnan');
ECEarth3Vegstdplot2100 = std(ECEarth3Vegc585(:,:,373:612),[],3,'omitnan');
MIROC6stdplot2100 = std(MIROC6c585(:,:,373:612),[],3,'omitnan');
MRIESM20stdplot2100 = std(MRIESM20c585(:,:,373:612),[],3,'omitnan');

Ensembleplot = cat(3,BCCCSM2MRmeanplot,...
    BCCESM1meanplot,CanESM5meanplot,CESM2meanplot,CESM2WACCMmeanplot,E3SM10meanplot,...
    ECEarth3meanplot,ECEarth3Vegmeanplot,GISSE21Gmeanplot,GISSE21Hmeanplot,MIROC6meanplot,...
    MRIESM20meanplot,SAM0UNICONmeanplot);
Ensemblemeanplot = mean(Ensembleplot,3,'omitnan');    %13 model ensemble mean HIST

Ensembleplot8 = cat(3,BCCCSM2MRmeanplot,CanESM5meanplot,CESM2WACCMmeanplot,...
    CESM2WACCMmeanplot,ECEarth3meanplot,ECEarth3Vegmeanplot,MIROC6meanplot,MRIESM20meanplot);
Ensemblemeanplot8 = mean(Ensembleplot8,3,'omitnan');    %8 model ensemble mean HIST
Ensemblestdplot8 = std(Ensembleplot8,0,3,'omitnan');    %8 model ensemble std HIST

Ensembleplot585 = cat(3,BCCCSM2MRmeanplot585,CanESM5meanplot585,CESM2meanplot585,...
CESM2WACCMmeanplot585,ECEarth3meanplot585,ECEarth3Vegmeanplot585,MIROC6meanplot585,...
MRIESM20meanplot585);
Ensemblemeanplot585 = mean(Ensembleplot585,3,'omitnan');  %8 model ensemble mean 585 (51 years)
Ensemblestdplot585 = std(Ensembleplot585,0,3,'omitnan');  %8 model ensemble std 585 (51 years)

Ensembleplot2070 = cat(3,BCCCSM2MRmeanplot2070,CanESM5meanplot2070,CESM2meanplot2070,...
CESM2WACCMmeanplot2070,ECEarth3meanplot2070,ECEarth3Vegmeanplot2070,MIROC6meanplot2070,...
MRIESM20meanplot2070);
Ensemblemeanplot2070 = mean(Ensembleplot2070,3,'omitnan');  %8 model ensemble mean 2070
Ensemblestdplot2070 = std(Ensembleplot2070,0,3,'omitnan');  %8 model ensemble std 2070

Ensembleplot2100 = cat(3,BCCCSM2MRmeanplot2100,CanESM5meanplot2100,CESM2meanplot2100,...
CESM2WACCMmeanplot2100,ECEarth3meanplot2100,ECEarth3Vegmeanplot2100,MIROC6meanplot2100,...
MRIESM20meanplot2100);
Ensemblemeanplot2100 = mean(Ensembleplot2100,3,'omitnan');  %8 model ensemble mean 2100
Ensemblestdplot2100 = std(Ensembleplot2100,0,3,'omitnan');  %8 model ensemble std 2100

mid_cent_diff = Ensemblemeanplot2070 - Ensemblemeanplot8;   %2070 - HIST ensmean
end_cent_diff = Ensemblemeanplot2100 - Ensemblemeanplot8;   %2100 - HIST ensmean

%BCCCSM2MRmeanplot2100
%CanESM5meanplot2100
%CESM2meanplot2100
%CESM2WACCMmeanplot2100
%ECEarth3meanplot2100
%ECEarth3Vegmeanplot2100
%MIROC6meanplot2100
%MRIESM20meanplot2100
%plot the difference in precip

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%ttest equation using mean and std matrices from hist and future 2070
top_2070 = Ensemblemeanplot8 - Ensemblemeanplot2070;
inside1_2070 = (Ensemblestdplot8.^2)./34;   %34 years in hist
inside2_2070 = (Ensemblestdplot2070.^2)./20;   %20 years 2051-2070
inside3_2070 = inside1_2070 + inside2_2070;
ttest_2070 = top_2070./sqrt(inside3_2070);

%ttest equation using mean and std matrices from hist and future 2100
top_2100 = Ensemblemeanplot8 - Ensemblemeanplot2100;
inside1_2100 = (Ensemblestdplot8.^2)./34;   %34 years in hist
inside2_2100 = (Ensemblestdplot2100.^2)./20;   %20 years 2081-2100
inside3_2100 = inside1_2100 + inside2_2100;
ttest_2100 = top_2100./sqrt(inside3_2100);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Get ensemble mean
EnsembleMean_8mod_3D = cat(2,BCCCSM2MRc585,CanESM5c585,CESM2c585,...
    CESM2WACCMc585,ECEarth3c585,ECEarth3Vegc585,MIROC6c585,MRIESM20c585);

%calc trend from hist/future and plot + significance in trend (1981-2100)
Combine_maps = cat(3,BCCCSM2MRc,BCCCSM2MRc585);

[tr,p] = trend(Combine_maps,12,'omitnan');   %calculates annual trend

StatisticallySignificant = p<0.1;   %change this, depending (0.2??)
[Lon,Lat] = meshgrid(lon2,lat);

figure
pcolor(lon2,lat,tr*10)   %*10 to get decadal trend
shading interp
axis tight
%cmocean tarn
%cmocean -amp
%cmocean('-balance','pivot',0)   %,'pivot',0
cmocean('-amp')  %this is for CanESM5
cb = colorbar;
ylabel(cb,'Decadal precipitation trend [mm/day]')
title 'Precipitation Trend'  %change title
hold on
xlim([-75 -43])
ylim([-20 7])
%caxis([-1 1])
%ylim([-18 7])
hold on
stipple(Lon,Lat,StatisticallySignificant)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%just plot differences in future/past and t score significance (1-tailed tvalues)
%Values below a certain value are set to NA (not sig) Want anything above value
%90 with 30 df = 1.31; 95 with 30 df= 1.697; 80% with 30 df= 0.854
StatisticallySignificant_2070 = ttest_2070>1.31;   %from t Table values
StatisticallySignificant_2100 = ttest_2100>1.31;   %from t Table values

%Ensemblemeanplot8 - Ensemblemeanplot2070 - Ensemblestdplot2100. This is diff
figure
pcolor(lon2,lat,Ensemblemeanplot2100-Ensemblemeanplot8)   %change between mid_ and end_
shading interp
axis tight
%cmocean tarn
cmocean -amp
%cmocean('-balance')
cb = colorbar;
ylabel(cb,'(mm/day)')
title 'End-of-Century Precipitation Difference'  %change title
hold on
xlim([-75 -43])
ylim([-20 7])
caxis([-1.3 0])
%ylim([-18 7])
hold on
stipple(lon2,lat,StatisticallySignificant_2100,'density',200,'markersize',7)



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%THIS IS RELATIVE DIFFERENCES IN FUTURE/HIST
%Ensemblemeanplot8 - Ensemblemeanplot2070 - Ensemblestdplot2100
figure
pcolor(lon2,lat,((Ensemblemeanplot2070-Ensemblemeanplot8)./Ensemblemeanplot8)*100)  
shading interp
axis tight
%cmocean tarn
cmocean -amp
%cmocean('-balance')
cb = colorbar;
ylabel(cb,'% [mm/day]')
title 'Mid-Century Relative Precipitation Difference'  %change title
hold on
xlim([-75 -43])
ylim([-20 7])
caxis([-25 0])
%ylim([-18 7])
hold on
stipple(lon2,lat,StatisticallySignificant_2070,'density',200,'markersize',7)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%THIS IS RELATIVE DIFFERENCES IN FUTURE/HIST  STD for prec
%[]stdplot585 []stdplot2070 []stdplot2100
%Ensemblestsdplot585 Ensemblestdplot2070 Ensemblestdplot2100

%ttest equation using std matrices from hist and future 2070
top_2070_std = Ensemblemeanplot8 - Ensemblemeanplot2070;
inside1_2070_std = (Ensemblestdplot8.^2)./34;   %34 years in hist
inside2_2070_std = (Ensemblestdplot2070.^2)./20;   %20 years 2051-2070
inside3_2070_std = inside1_2070_std + inside2_2070_std;
ttest_2070_std = top_2070_std./sqrt(inside3_2070_std);

%ttest equation using std matrices from hist and future 2100
top_2100_std = Ensemblemeanplot8 - Ensemblemeanplot2100;
inside1_2100_std = (Ensemblestdplot8.^2)./34;   %34 years in hist
inside2_2100_std = (Ensemblestdplot2100.^2)./20;   %20 years 2081-2100
inside3_2100_std = inside1_2100_std + inside2_2100_std;
ttest_2100_std = top_2100_std./sqrt(inside3_2100_std);

%just plot std dk\ifference in future/past and t score significance (1-tailed tvalues)
%Values below a certain value are set to NA (not sig) Want anything above value
%90 with 30 df = 1.31; 95 with 30 df= 1.697; 80% with 30 df= 0.854
%Ensemblestdplot2100 (81-100) - stdplot 2070 (51-70) - stdplot585 (hist) - stdplot (hist)
ttest_2100_std = ttest(CESM2stdplot2100,CESM2stdplot,'Alpha',0.2,'Dim',3);
StatisticallySignificant_2070 = ttest_2070_std>1.31;   %from t Table values
StatisticallySignificant_2100 = ttest_2100_std>1.31;

%BCCCSM2MR
%CanESM5
%CESM2
%CESM2WACCM
%ECEarth3
%ECEarth3Veg
%MIROC6
%MRIESM20

figure
%pcolor(lon2,lat,((Ensemblestdplot2100-Ensemblestdplot8)./Ensemblestdplot8)*100)  
pcolor(lon2,lat,((MRIESM20stdplot585-MRIESM20stdplot)./MRIESM20stdplot)*100)  
%contourf(lon2,lat,((ECEarth3Vegstdplot585-ECEarth3Vegstdplot)./ECEarth3Vegstdplot)*100,'edgecolor','none') 
shading interp
axis tight
%cmocean dense
%cmocean tarn
%cmocean -amp
cmocean('-balance')
cb = colorbar;
ylabel(cb,'% [mm/day]')
title 'End-of-Century Monthly Change in SD (%)'  %change title
hold on
xlim([-75 -43])
ylim([-20 7])
caxis([-50 50])
%ylim([-18 7])
hold on
stipple(lon2,lat,StatisticallySignificant_2070,'density',200,'markersize',7)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Dry vs wet season difference in means
%modtime2 and modtime585

%BCCCSM2MRmeanplot2100
%CanESM5meanplot2100
%CESM2meanplot2100
%CESM2WACCMmeanplot2100
%ECEarth3meanplot2100
%ECEarth3Vegmeanplot2100
%MIROC6meanplot2100
%MRIESM20meanplot2100

%Create new modified modtimes for long list of ensemble
%modtime 3 is for stacked historical ensemble mean
StartDate3 = datetime(1981,01,01);  
EndDate3 = datetime(2252,12,31);
modtime3= StartDate3:calmonths(1):EndDate3;
modtimeColumn3 = modtime3.';
modtime3 = datenum(modtime3');
%modtime 4 is for stacked future ensemble mean
StartDate4 = datetime(2050,01,01); 
EndDate4 = datetime(2457,12,31);
modtime4= StartDate4:calmonths(1):EndDate4;
modtimeColumn4 = modtime4.';
modtime4 = datenum(modtime4');
%modtime 5 is for stacked future ensemble mean 2081-2100
StartDate5 = datetime(2050,01,01); 
EndDate5 = datetime(2209,12,31);
modtime5= StartDate5:calmonths(1):EndDate5;
modtimeColumn5 = modtime5.';
modtime5 = datenum(modtime5');
%modtime 6 is for stacked future ensemble mean 2081-2100 WITHOUT ECEARTH models
StartDate6 = datetime(2050,01,01); 
EndDate6 = datetime(2169,12,31);
modtime6= StartDate6:calmonths(1):EndDate6;
modtimeColumn6 = modtime6.';
modtime6 = datenum(modtime6');
%modtime 7 is for stacked hist ensemble mean 1981 WITHOUT ECEARTH models
StartDate7 = datetime(1981,01,01); 
EndDate7 = datetime(2184,12,31);
modtime7= StartDate7:calmonths(1):EndDate7;
modtimeColumn7 = modtime7.';
modtime7 = datenum(modtime7');
%modtime 8 is for stacked hist ensemble mean 2091-2100 WITHOUT ECEARTH models
StartDate8 = datetime(2050,01,01); 
EndDate8 = datetime(2109,12,31);
modtime8= StartDate8:calmonths(1):EndDate8;
modtimeColumn8 = modtime8.';
modtime8 = datenum(modtime8');

%(:,:,373:612) for 2081-2100 & (:,:,13:252) for 2051-2070

%Cat hist 3D
EnsembleMeanHist_8mod_3D = cat(3,BCCCSM2MRc,CanESM5c,CESM2c,...
    CESM2WACCMc,ECEarth3c,ECEarth3Vegc,MIROC6c,MRIESM20c);

%Cat hist 3D NO ECEARTH models
EnsembleMeanHist_6mod_3D = cat(3,BCCCSM2MRc,CanESM5c,CESM2c,...
    CESM2WACCMc,MIROC6c,MRIESM20c);

%Cat future 3D 2081-2100
EnsembleMean585_8mod_3D = cat(3,BCCCSM2MRc585(:,:,373:612),CanESM5c585(:,:,373:612),...
    CESM2c585(:,:,373:612),CESM2WACCMc585(:,:,373:612),ECEarth3c585(:,:,373:612),...
    ECEarth3Vegc585(:,:,373:612),MIROC6c585(:,:,373:612),MRIESM20c585(:,:,373:612));

%Cat future 3D 2051-2070 NO ECEARTH models (ripple-effect from them???)
EnsembleMean585_6mod_3D_mid = cat(3,BCCCSM2MRc585(:,:,13:252),CanESM5c585(:,:,13:252),...
    CESM2c585(:,:,13:252),CESM2WACCMc585(:,:,13:252),MIROC6c585(:,:,13:252),...
    MRIESM20c585(:,:,13:252));

%Cat future 3D 2051-2060 NO ECEARTH models (ripple-effect from them???)
EnsembleMean585_6mod_3D_mid_10yrs = cat(3,BCCCSM2MRc585(:,:,13:132),CanESM5c585(:,:,13:132),...
    CESM2c585(:,:,13:132),CESM2WACCMc585(:,:,13:132),MIROC6c585(:,:,13:132),...
    MRIESM20c585(:,:,13:132));

%Cat future 3D 2091-2100 NO ECEARTH models (ripple-effect from them???)
EnsembleMean585_6mod_3D_end_10yrs = cat(3,BCCCSM2MRc585(:,:,493:612),CanESM5c585(:,:,493:612),...
    CESM2c585(:,:,493:612),CESM2WACCMc585(:,:,493:612),MIROC6c585(:,:,493:612),...
    MRIESM20c585(:,:,493:612));

%Cat future 3D 2081-2100 NO ECEARTH models (ripple-effect from them???)
EnsembleMean585_6mod_3D_end = cat(3,BCCCSM2MRc585(:,:,373:612),CanESM5c585(:,:,373:612),...
    CESM2c585(:,:,373:612),CESM2WACCMc585(:,:,373:612),MIROC6c585(:,:,373:612),...
    MRIESM20c585(:,:,373:612));

%Calculate dry season means  6 or 8mod for future!!!
DRY_season_hist_mean = monthly(EnsembleMeanHist_6mod_3D,modtime7,5:9,@mean);  %3 or 7
DRY_season_585_mean_mid = monthly(EnsembleMean585_6mod_3D_mid_10yrs,modtime8,5:9,@mean);  %modtime4 or modtime 5 or modtime6
DRY_season_585_mean_end = monthly(EnsembleMean585_6mod_3D_end_10yrs,modtime8,5:9,@mean); 

%Calculate dry season std  6 or 8mod for future!!!
DRY_season_hist_std = monthly(EnsembleMeanHist_6mod_3D,modtime7,5:9,@std);  %modtime3 or 7
DRY_season_585_std_mid = monthly(EnsembleMean585_6mod_3D_mid_10yrs,modtime8,5:9,@std);  %modtime4 or modtime 5
DRY_season_585_std_end = monthly(EnsembleMean585_6mod_3D_end_10yrs,modtime8,5:9,@std); 

%2051-2070
%ttest equation using mean and std matrices from hist and future for DRY SEASON
DRY_top_585_mid = DRY_season_hist_mean - DRY_season_585_mean_mid;
DRY_inside1_585_mid = (DRY_season_hist_std.^2)./34;   %34 years in hist
DRY_inside2_585_mid = (DRY_season_585_std_mid.^2)./10;   %20 years 2051-2070 or 10
DRY_inside3_585_mid = DRY_inside1_585_mid + DRY_inside2_585_mid;
DRY_ttest_585_mid = DRY_top_585_mid./sqrt(DRY_inside3_585_mid);

%2081-2100
%ttest equation using mean and std matrices from hist and future for DRY SEASON
DRY_top_585_end = DRY_season_hist_mean - DRY_season_585_mean_end;
DRY_inside1_585_end = (DRY_season_hist_std.^2)./34;   %34 years in hist
DRY_inside2_585_end = (DRY_season_585_std_end.^2)./10;   %20 years 2081-2100 or 10
DRY_inside3_585_end = DRY_inside1_585_end + DRY_inside2_585_end;
DRY_ttest_585_end = DRY_top_585_end./sqrt(DRY_inside3_585_end);

%1-tailed ttest
%90 with 30 df = 1.31; 95 with 30 df= 1.697; 80% with 30 df= 0.854
%90 with 40 df = 1.303; 95 with 40 df= 1.6984; 80% with 40 df= 0.851
StatisticallySignificant_DRY_585_mid = DRY_ttest_585_mid>0.851;   %from t Table values
StatisticallySignificant_DRY_585_end = DRY_ttest_585_end>0.851;   %from t Table values

%Ensemblemeanplot8 - Ensemblemeanplot2070 - Ensemblestdplot2100. This is diff
figure
pcolor(lon2,lat,((DRY_season_585_mean_mid-DRY_season_hist_mean)./DRY_season_hist_mean)*100)   %change between mid_ and end_
shading interp
axis tight
%cmocean tarn
cmocean -amp
%cmocean('-balance')
cb = colorbar;
ylabel(cb,'% [mm/day]')
title({
    ['Relative Precipitation Difference' ] %Dry Season Relative
    ['2051-2060 vs. 1981-2014'] 
    ['MJJAS'] 
    });
%title 'Dry Season Relative Precipitation Difference 2081-2100 vs. 1981-2014'  %change title
%subtitle '2081-2100 vs. 1981-2014 for MJJAS'
hold on
xlim([-75 -43])
ylim([-20 7])
caxis([-50 0])
%ylim([-18 7])
hold on
stipple(lon2,lat,StatisticallySignificant_DRY_585_mid,'density',200,'markersize',9)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot means
figure
pcolor(lon2,lat,Ensemblemeanplot585)
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
xlabel longitude
ylabel latitude
xlim([-75 -43])
ylim([-18 7])
caxis([0 10])

%Deal with the NAN within the mean plots (set to 0???)
UDELmeanplot(isnan(UDELmeanplot)) = 0;     %set nan to 0
CHIRPSmeanplot(isnan(CHIRPSmeanplot)) = 0;
CMAPmeanplot(isnan(CMAPmeanplot)) = 0;
BCCCSM2MRmeanplot(isnan(BCCCSM2MRmeanplot)) = 0;
BCCESM1meanplot(isnan(BCCESM1meanplot)) = 0;
CanESM5meanplot(isnan(CanESM5meanplot)) = 0;
CESM2meanplot(isnan(CESM2meanplot))	= 0;
CESM2WACCMmeanplot(isnan(CESM2WACCMmeanplot)) = 0;
E3SM10meanplot(isnan(E3SM10meanplot)) = 0;
ECEarth3meanplot(isnan(ECEarth3meanplot)) = 0;
ECEarth3Vegmeanplot(isnan(ECEarth3Vegmeanplot)) = 0;
GISSE21Gmeanplot(isnan(GISSE21Gmeanplot)) = 0;
GISSE21Hmeanplot(isnan(GISSE21Hmeanplot)) = 0;
MIROC6meanplot(isnan(MIROC6meanplot)) = 0;
MRIESM20meanplot(isnan(MRIESM20meanplot)) = 0;
SAM0UNICONmeanplot(isnan(SAM0UNICONmeanplot)) = 0;
Ensemblemeanplot(isnan(Ensemblemeanplot)) = 0;

Q = corrcoef(Ensemblemeanplot,UDELmeanplot);  %get the corrcoeff value for 36-year mean

%realz = isinf(CMAPmeanplot) & isinf(UDELmeanplot);    %didn't work
%Q = corrcoef(CMAPmeanplot(realz),UDELmeanplot(realz));

%Anomaly correlation coefficient (ACC)
%vi= model mean for that year  (1979-2014, 36 years)
%v = model climatology for time period (minus that year)
%oi = observed mean for that year
%o = observed climatology for that time period (minus that year)
%1979(1:12) 1980(13:24) 1981(25:36) 1982(37:48) 1983(49:60) 1984(61:72)
%1985(73:84) 1986(85:96) 1987(97:108) 1988(109:120) 1989(121:132)
%1990(133:144) 1991(145:156) 1992(157:168) 1993(169:180) 1994(181:192)
%1995(193:204) 1996(205:216) 1997(217:228) 1998(229:240) 1999(241:252)
%2000(253:264) 2001(265:276) 2002(277:288) 2003(289:300) 2004(301:312)
%2005(313:324) 2006(325:336) 2007(337:348) 2008(349:360) 2009(361:372)
%2010(373:384) 2011(385:396) 2012(397:408) 2013(409:420) 2014(421:432)
%yearlist = (1:12:432);
% BCCCSM2MR	
% BCCESM1 	
% CanESM5 
% CESM2 		
% CESM2WACCM 	
% E3SM10	
% ECEarth3
% ECEarth3Veg
% GISSE21G 
% GISSE21H
% MIROC6 
% MRIESM20 
% SAM0UNICON 
vi = mean(GISSE21Gts(421:432));    %sub model and year from above
oi = mean(UDELts(421:432));       %only change year time step
oi2 = oi./30;

v = mean(GISSE21Gts(1:432));    %sub model
o = mean(UDELts(1:432));    %obs climatology
o2 = o./30;

top = (vi-v).*(oi2-o2);
bottom = sqrt(((vi - v).^2).*((oi2 - o2).^2));
ACC = top./bottom;

%Anomaly correlation coefficient (ACC) PLOT
%vi= model mean for that year  (1979-2014, 36 years)
%v = model climatology for time period (minus that year)
%oi = observed mean for that year
%o = observed climatology for that time period (minus that year)
%1979(1:12) 1980(13:24) 1981(25:36) 1982(37:48) 1983(49:60) 1984(61:72)
%1985(73:84) 1986(85:96) 1987(97:108) 1988(109:120) 1989(121:132)
%1990(133:144) 1991(145:156) 1992(157:168) 1993(169:180) 1994(181:192)
%1995(193:204) 1996(205:216) 1997(217:228) 1998(229:240) 1999(241:252)
%2000(253:264) 2001(265:276) 2002(277:288) 2003(289:300) 2004(301:312)
%2005(313:324) 2006(325:336) 2007(337:348) 2008(349:360) 2009(361:372)
%2010(373:384) 2011(385:396) 2012(397:408) 2013(409:420) 2014(421:432)
%yearlist = (1:12:432);
% BCCCSM2MR	
% BCCESM1 	
% CanESM5 
% CESM2 		
% CESM2WACCM 	
% E3SM10	
% ECEarth3
% ECEarth3Veg
% GISSE21G 
% GISSE21H
% MIROC6 
% MRIESM20 
% SAM0UNICON 
%ACC plot using [mod]c (this is gridded. 432 time steps)
vi = mean(BCCCSM2MRc(:,:,421:432),3,'omitnan');    %sub model and year from above
oi = mean(UDELc(:,:,421:432),3,'omitnan');       %only change year time step
oi2 = oi./30;

v = mean(BCCCSM2MRc(:,:,1:432),3,'omitnan');    %sub model
o = mean(UDELc(:,:,1:432),3,'omitnan');    %obs climatology
o2 = o./30;

top = (vi-v).*(oi2-o2);
bottom = sqrt(((vi - v).^2).*((oi2 - o2).^2));
ACCplot = top./bottom;

mean(ACCplot,'all','omitnan')

figure                                 %this is an ACC plot
pcolor(lon2,lat,ACCplot)
shading interp
axis tight
%cmocean tarn
%cmocean('-balance')
colormap(flipud(parula))
%colormap jet
cb = colorbar;
ylabel(cb,'ACC')
title 'ACC BCCCSM2MR 2014'  %change title (model & year)
hold on
xlim([-75 -43])
ylim([-18 7])
caxis([-1 1])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Get dry season pr from monthly ts using timetable and retime%%%
%%%%%%% tt is for TimeTable and tt2 is for the dry season time series%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Create model time vector
StartDate = datetime(1979,01,01);
EndDate = datetime(2014,12,31);
modtime= StartDate:calmonths(1):EndDate;
modtimeColumn = modtime.';

StartDate2 = datetime(1981,01,01);  %for CHIRPS
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;
modtimeColumn2 = modtime2.';

%TR = timerange('01-Jun-1979','01-Oct-1979')  %doesn't work
% TR = {'01-Jun-1979','01-Jul-1979','01-Aug-1979','01-Sep-1979','01-Oct-1979',...
% '01-Jun-1980','01-Jul-1980','01-Aug-1980','01-Sep-1980','01-Oct-1980',...
% '01-Jun-1981','01-Jul-1981','01-Aug-1981','01-Sep-1981','01-Oct-1981',...
% '01-Jun-1982','01-Jul-1982','01-Aug-1982','01-Sep-1982','01-Oct-1982',...
% '01-Jun-1983','01-Jul-1983','01-Aug-1983','01-Sep-1983','01-Oct-1983',...
% '01-Jun-1984','01-Jul-1984','01-Aug-1984','01-Sep-1984','01-Oct-1984',...
% '01-Jun-1985','01-Jul-1985','01-Aug-1985','01-Sep-1985','01-Oct-1985',...
% '01-Jun-1986','01-Jul-1986','01-Aug-1986','01-Sep-1986','01-Oct-1986',...
% '01-Jun-1987','01-Jul-1987','01-Aug-1987','01-Sep-1987','01-Oct-1987'...
% '01-Jun-1988','01-Jul-1988','01-Aug-1988','01-Sep-1988','01-Oct-1988'...
% '01-Jun-1989','01-Jul-1989','01-Aug-1989','01-Sep-1989','01-Oct-1989'...
% '01-Jun-1990','01-Jul-1990','01-Aug-1990','01-Sep-1990','01-Oct-1990'...
% '01-Jun-1991','01-Jul-1991','01-Aug-1991','01-Sep-1991','01-Oct-1991'...
% '01-Jun-1992','01-Jul-1992','01-Aug-1992','01-Sep-1992','01-Oct-1992'...
% '01-Jun-1993','01-Jul-1993','01-Aug-1993','01-Sep-1993','01-Oct-1993'...
% '01-Jun-1994','01-Jul-1994','01-Aug-1994','01-Sep-1994','01-Oct-1994'...
% '01-Jun-1995','01-Jul-1995','01-Aug-1995','01-Sep-1995','01-Oct-1995'...
% '01-Jun-1996','01-Jul-1996','01-Aug-1996','01-Sep-1996','01-Oct-1996'...
% '01-Jun-1997','01-Jul-1997','01-Aug-1997','01-Sep-1997','01-Oct-1997'...
% '01-Jun-1998','01-Jul-1998','01-Aug-1998','01-Sep-1998','01-Oct-1998'...
% '01-Jun-1999','01-Jul-1999','01-Aug-1999','01-Sep-1999','01-Oct-1999'...
% '01-Jun-2000','01-Jul-2000','01-Aug-2000','01-Sep-2000','01-Oct-2000'...
% '01-Jun-2001','01-Jul-2001','01-Aug-2001','01-Sep-2001','01-Oct-2001'...
% '01-Jun-2002','01-Jul-2002','01-Aug-2002','01-Sep-2002','01-Oct-2002'...
% '01-Jun-2003','01-Jul-2003','01-Aug-2003','01-Sep-2003','01-Oct-2003'...
% '01-Jun-2004','01-Jul-2004','01-Aug-2004','01-Sep-2004','01-Oct-2004'...
% '01-Jun-2005','01-Jul-2005','01-Aug-2005','01-Sep-2005','01-Oct-2005'...
% '01-Jun-2006','01-Jul-2006','01-Aug-2006','01-Sep-2006','01-Oct-2006'...
% '01-Jun-2007','01-Jul-2007','01-Aug-2007','01-Sep-2007','01-Oct-2007'...
% '01-Jun-2008','01-Jul-2008','01-Aug-2008','01-Sep-2008','01-Oct-2008'...
% '01-Jun-2009','01-Jul-2009','01-Aug-2009','01-Sep-2009','01-Oct-2009'...
% '01-Jun-2010','01-Jul-2010','01-Aug-2010','01-Sep-2010','01-Oct-2010'...
% '01-Jun-2011','01-Jul-2011','01-Aug-2011','01-Sep-2011','01-Oct-2011'...
% '01-Jun-2012','01-Jul-2012','01-Aug-2012','01-Sep-2012','01-Oct-2012'...
% '01-Jun-2013','01-Jul-2013','01-Aug-2013','01-Sep-2013','01-Oct-2013'...
% '01-Jun-2014','01-Jul-2014','01-Aug-2014','01-Sep-2014','01-Oct-2014'};
% 
% %THIS IS FOR CHIRPS (1981-2014)
% TR2 = {'01-Jun-1981','01-Jul-1981','01-Aug-1981','01-Sep-1981','01-Oct-1981',...
% '01-Jun-1982','01-Jul-1982','01-Aug-1982','01-Sep-1982','01-Oct-1982',...
% '01-Jun-1983','01-Jul-1983','01-Aug-1983','01-Sep-1983','01-Oct-1983',...
% '01-Jun-1984','01-Jul-1984','01-Aug-1984','01-Sep-1984','01-Oct-1984',...
% '01-Jun-1985','01-Jul-1985','01-Aug-1985','01-Sep-1985','01-Oct-1985',...
% '01-Jun-1986','01-Jul-1986','01-Aug-1986','01-Sep-1986','01-Oct-1986',...
% '01-Jun-1987','01-Jul-1987','01-Aug-1987','01-Sep-1987','01-Oct-1987'...
% '01-Jun-1988','01-Jul-1988','01-Aug-1988','01-Sep-1988','01-Oct-1988'...
% '01-Jun-1989','01-Jul-1989','01-Aug-1989','01-Sep-1989','01-Oct-1989'...
% '01-Jun-1990','01-Jul-1990','01-Aug-1990','01-Sep-1990','01-Oct-1990'...
% '01-Jun-1991','01-Jul-1991','01-Aug-1991','01-Sep-1991','01-Oct-1991'...
% '01-Jun-1992','01-Jul-1992','01-Aug-1992','01-Sep-1992','01-Oct-1992'...
% '01-Jun-1993','01-Jul-1993','01-Aug-1993','01-Sep-1993','01-Oct-1993'...
% '01-Jun-1994','01-Jul-1994','01-Aug-1994','01-Sep-1994','01-Oct-1994'...
% '01-Jun-1995','01-Jul-1995','01-Aug-1995','01-Sep-1995','01-Oct-1995'...
% '01-Jun-1996','01-Jul-1996','01-Aug-1996','01-Sep-1996','01-Oct-1996'...
% '01-Jun-1997','01-Jul-1997','01-Aug-1997','01-Sep-1997','01-Oct-1997'...
% '01-Jun-1998','01-Jul-1998','01-Aug-1998','01-Sep-1998','01-Oct-1998'...
% '01-Jun-1999','01-Jul-1999','01-Aug-1999','01-Sep-1999','01-Oct-1999'...
% '01-Jun-2000','01-Jul-2000','01-Aug-2000','01-Sep-2000','01-Oct-2000'...
% '01-Jun-2001','01-Jul-2001','01-Aug-2001','01-Sep-2001','01-Oct-2001'...
% '01-Jun-2002','01-Jul-2002','01-Aug-2002','01-Sep-2002','01-Oct-2002'...
% '01-Jun-2003','01-Jul-2003','01-Aug-2003','01-Sep-2003','01-Oct-2003'...
% '01-Jun-2004','01-Jul-2004','01-Aug-2004','01-Sep-2004','01-Oct-2004'...
% '01-Jun-2005','01-Jul-2005','01-Aug-2005','01-Sep-2005','01-Oct-2005'...
% '01-Jun-2006','01-Jul-2006','01-Aug-2006','01-Sep-2006','01-Oct-2006'...
% '01-Jun-2007','01-Jul-2007','01-Aug-2007','01-Sep-2007','01-Oct-2007'...
% '01-Jun-2008','01-Jul-2008','01-Aug-2008','01-Sep-2008','01-Oct-2008'...
% '01-Jun-2009','01-Jul-2009','01-Aug-2009','01-Sep-2009','01-Oct-2009'...
% '01-Jun-2010','01-Jul-2010','01-Aug-2010','01-Sep-2010','01-Oct-2010'...
% '01-Jun-2011','01-Jul-2011','01-Aug-2011','01-Sep-2011','01-Oct-2011'...
% '01-Jun-2012','01-Jul-2012','01-Aug-2012','01-Sep-2012','01-Oct-2012'...
% '01-Jun-2013','01-Jul-2013','01-Aug-2013','01-Sep-2013','01-Oct-2013'...
% '01-Jun-2014','01-Jul-2014','01-Aug-2014','01-Sep-2014','01-Oct-2014'};


TR = {'01-Apr-1979','01-May-1979','01-Jun-1979','01-Jul-1979','01-Aug-1979','01-Sep-1979',...
'01-Apr-1980','01-May-1980','01-Jun-1980','01-Jul-1980','01-Aug-1980','01-Sep-1980',...
'01-Apr-1981','01-May-1981','01-Jun-1981','01-Jul-1981','01-Aug-1981','01-Sep-1981',...
'01-Apr-1982','01-May-1982','01-Jun-1982','01-Jul-1982','01-Aug-1982','01-Sep-1982',...
'01-Apr-1983','01-May-1983','01-Jun-1983','01-Jul-1983','01-Aug-1983','01-Sep-1983',...
'01-Apr-1984','01-May-1984','01-Jun-1984','01-Jul-1984','01-Aug-1984','01-Sep-1984',...
'01-Apr-1985','01-May-1985','01-Jun-1985','01-Jul-1985','01-Aug-1985','01-Sep-1985',...
'01-Apr-1986','01-May-1986','01-Jun-1986','01-Jul-1986','01-Aug-1986','01-Sep-1986',...
'01-Apr-1987','01-May-1987','01-Jun-1987','01-Jul-1987','01-Aug-1987','01-Sep-1987',...
'01-Apr-1988','01-May-1988','01-Jun-1988','01-Jul-1988','01-Aug-1988','01-Sep-1988',...
'01-Apr-1989','01-May-1989','01-Jun-1989','01-Jul-1989','01-Aug-1989','01-Sep-1989',...
'01-Apr-1990','01-May-1990','01-Jun-1990','01-Jul-1990','01-Aug-1990','01-Sep-1990',...
'01-Apr-1991','01-May-1991','01-Jun-1991','01-Jul-1991','01-Aug-1991','01-Sep-1991',...
'01-Apr-1992','01-May-1992','01-Jun-1992','01-Jul-1992','01-Aug-1992','01-Sep-1992',...
'01-Apr-1993','01-May-1993','01-Jun-1993','01-Jul-1993','01-Aug-1993','01-Sep-1993',...
'01-Apr-1994','01-May-1994','01-Jun-1994','01-Jul-1994','01-Aug-1994','01-Sep-1994',...
'01-Apr-1995','01-May-1995','01-Jun-1995','01-Jul-1995','01-Aug-1995','01-Sep-1995',...
'01-Apr-1996','01-May-1996','01-Jun-1996','01-Jul-1996','01-Aug-1996','01-Sep-1996',...
'01-Apr-1997','01-May-1997','01-Jun-1997','01-Jul-1997','01-Aug-1997','01-Sep-1997',...
'01-Apr-1998','01-May-1998','01-Jun-1998','01-Jul-1998','01-Aug-1998','01-Sep-1998',...
'01-Apr-1999','01-May-1999','01-Jun-1999','01-Jul-1999','01-Aug-1999','01-Sep-1999',...
'01-Apr-2000','01-May-2000','01-Jun-2000','01-Jul-2000','01-Aug-2000','01-Sep-2000',...
'01-Apr-2001','01-May-2001','01-Jun-2001','01-Jul-2001','01-Aug-2001','01-Sep-2001',...
'01-Apr-2002','01-May-2002','01-Jun-2002','01-Jul-2002','01-Aug-2002','01-Sep-2002',...
'01-Apr-2003','01-May-2003','01-Jun-2003','01-Jul-2003','01-Aug-2003','01-Sep-2003',...
'01-Apr-2004','01-May-2004','01-Jun-2004','01-Jul-2004','01-Aug-2004','01-Sep-2004',...
'01-Apr-2005','01-May-2005','01-Jun-2005','01-Jul-2005','01-Aug-2005','01-Sep-2005',...
'01-Apr-2006','01-May-2006','01-Jun-2006','01-Jul-2006','01-Aug-2006','01-Sep-2006',...
'01-Apr-2007','01-May-2007','01-Jun-2007','01-Jul-2007','01-Aug-2007','01-Sep-2007',...
'01-Apr-2008','01-May-2008','01-Jun-2008','01-Jul-2008','01-Aug-2008','01-Sep-2008',...
'01-Apr-2009','01-May-2009','01-Jun-2009','01-Jul-2009','01-Aug-2009','01-Sep-2009',...
'01-Apr-2010','01-May-2010','01-Jun-2010','01-Jul-2010','01-Aug-2010','01-Sep-2010',...
'01-Apr-2011','01-May-2011','01-Jun-2011','01-Jul-2011','01-Aug-2011','01-Sep-2011',...
'01-Apr-2012','01-May-2012','01-Jun-2012','01-Jul-2012','01-Aug-2012','01-Sep-2012',...
'01-Apr-2013','01-May-2013','01-Jun-2013','01-Jul-2013','01-Aug-2013','01-Sep-2013',...
'01-Apr-2014','01-May-2014','01-Jun-2014','01-Jul-2014','01-Aug-2014','01-Sep-2014'};

%THIS IS FOR CHIRPS (1981-2014)
TR2 = {'01-Apr-1981','01-May-1981','01-Jun-1981','01-Jul-1981','01-Aug-1981','01-Sep-1981',...
'01-Apr-1982','01-May-1982','01-Jun-1982','01-Jul-1982','01-Aug-1982','01-Sep-1982',...
'01-Apr-1983','01-May-1983','01-Jun-1983','01-Jul-1983','01-Aug-1983','01-Sep-1983',...
'01-Apr-1984','01-May-1984','01-Jun-1984','01-Jul-1984','01-Aug-1984','01-Sep-1984',...
'01-Apr-1985','01-May-1985','01-Jun-1985','01-Jul-1985','01-Aug-1985','01-Sep-1985',...
'01-Apr-1986','01-May-1986','01-Jun-1986','01-Jul-1986','01-Aug-1986','01-Sep-1986',...
'01-Apr-1987','01-May-1987','01-Jun-1987','01-Jul-1987','01-Aug-1987','01-Sep-1987',...
'01-Apr-1988','01-May-1988','01-Jun-1988','01-Jul-1988','01-Aug-1988','01-Sep-1988',...
'01-Apr-1989','01-May-1989','01-Jun-1989','01-Jul-1989','01-Aug-1989','01-Sep-1989',...
'01-Apr-1990','01-May-1990','01-Jun-1990','01-Jul-1990','01-Aug-1990','01-Sep-1990',...
'01-Apr-1991','01-May-1991','01-Jun-1991','01-Jul-1991','01-Aug-1991','01-Sep-1991',...
'01-Apr-1992','01-May-1992','01-Jun-1992','01-Jul-1992','01-Aug-1992','01-Sep-1992',...
'01-Apr-1993','01-May-1993','01-Jun-1993','01-Jul-1993','01-Aug-1993','01-Sep-1993',...
'01-Apr-1994','01-May-1994','01-Jun-1994','01-Jul-1994','01-Aug-1994','01-Sep-1994',...
'01-Apr-1995','01-May-1995','01-Jun-1995','01-Jul-1995','01-Aug-1995','01-Sep-1995',...
'01-Apr-1996','01-May-1996','01-Jun-1996','01-Jul-1996','01-Aug-1996','01-Sep-1996',...
'01-Apr-1997','01-May-1997','01-Jun-1997','01-Jul-1997','01-Aug-1997','01-Sep-1997',...
'01-Apr-1998','01-May-1998','01-Jun-1998','01-Jul-1998','01-Aug-1998','01-Sep-1998',...
'01-Apr-1999','01-May-1999','01-Jun-1999','01-Jul-1999','01-Aug-1999','01-Sep-1999',...
'01-Apr-2000','01-May-2000','01-Jun-2000','01-Jul-2000','01-Aug-2000','01-Sep-2000',...
'01-Apr-2001','01-May-2001','01-Jun-2001','01-Jul-2001','01-Aug-2001','01-Sep-2001',...
'01-Apr-2002','01-May-2002','01-Jun-2002','01-Jul-2002','01-Aug-2002','01-Sep-2002',...
'01-Apr-2003','01-May-2003','01-Jun-2003','01-Jul-2003','01-Aug-2003','01-Sep-2003',...
'01-Apr-2004','01-May-2004','01-Jun-2004','01-Jul-2004','01-Aug-2004','01-Sep-2004',...
'01-Apr-2005','01-May-2005','01-Jun-2005','01-Jul-2005','01-Aug-2005','01-Sep-2005',...
'01-Apr-2006','01-May-2006','01-Jun-2006','01-Jul-2006','01-Aug-2006','01-Sep-2006',...
'01-Apr-2007','01-May-2007','01-Jun-2007','01-Jul-2007','01-Aug-2007','01-Sep-2007',...
'01-Apr-2008','01-May-2008','01-Jun-2008','01-Jul-2008','01-Aug-2008','01-Sep-2008',...
'01-Apr-2009','01-May-2009','01-Jun-2009','01-Jul-2009','01-Aug-2009','01-Sep-2009',...
'01-Apr-2010','01-May-2010','01-Jun-2010','01-Jul-2010','01-Aug-2010','01-Sep-2010',...
'01-Apr-2011','01-May-2011','01-Jun-2011','01-Jul-2011','01-Aug-2011','01-Sep-2011',...
'01-Apr-2012','01-May-2012','01-Jun-2012','01-Jul-2012','01-Aug-2012','01-Sep-2012',...
'01-Apr-2013','01-May-2013','01-Jun-2013','01-Jul-2013','01-Aug-2013','01-Sep-2013',...
'01-Apr-2014','01-May-2014','01-Jun-2014','01-Jul-2014','01-Aug-2014','01-Sep-2014'};

%Create timetable (dstt) and then select dry season (dstt2)
%Create table from timetable (dstable)
%Then create array from table(dsarray)
%Get mean of every 6 months (apr-sep) for 36 years (dsts)
%ds= dry season
%UDELts2 and CHIRPSts2 is mm/day corrected
UDELdstt = timetable(modtimeColumn,UDELts2);
UDELdstt2 = UDELdstt(TR,:);
UDELdstable = timetable2table(UDELdstt2);
UDELdsarray = table2array(UDELdstable(:,[2]));
UDELdsts = mean(reshape(UDELdsarray,6,[]));

CMAPdstt = timetable(modtimeColumn,CMAPts);
CMAPdstt2 = CMAPdstt(TR,:);
CMAPdstable = timetable2table(CMAPdstt2);
CMAPdsarray = table2array(CMAPdstable(:,[2]));
CMAPdsts = mean(reshape(CMAPdsarray,6,[]));

CHIRPSdstt = timetable(modtimeColumn2,CHIRPSts2);
CHIRPSdstt2 = CHIRPSdstt(TR2,:);
CHIRPSdstable = timetable2table(CHIRPSdstt2);
CHIRPSdsarray= table2array(CHIRPSdstable(:,[2]));
CHIRPSdsts = mean(reshape(CHIRPSdsarray,6,[]));

BCCCSM2MRdstt = timetable(modtimeColumn,BCCCSM2MRts);
BCCCSM2MRdstt2 = BCCCSM2MRdstt(TR,:);
BCCCSM2MRdstable = timetable2table(BCCCSM2MRdstt2);
BCCCSM2MRdsarray = table2array(BCCCSM2MRdstable(:,[2]));
BCCCSM2MRdsts = mean(reshape(BCCCSM2MRdsarray,6,[]));

BCCESM1dstt = timetable(modtimeColumn,BCCESM1ts);
BCCESM1dstt2 = BCCESM1dstt(TR,:);
BCCESM1dstable = timetable2table(BCCESM1dstt2);
BCCESM1dsarray = table2array(BCCESM1dstable(:,[2]));
BCCESM1dsts = mean(reshape(BCCESM1dsarray,6,[]));

CanESM5dstt = timetable(modtimeColumn,CanESM5ts);
CanESM5dstt2 = CanESM5dstt(TR,:);
CanESM5dstable = timetable2table(CanESM5dstt2);
CanESM5dsarray = table2array(CanESM5dstable(:,[2]));
CanESM5dsts = mean(reshape(CanESM5dsarray,6,[]));

CESM2dstt	= timetable(modtimeColumn,CESM2ts);
CESM2dstt2 = CESM2dstt(TR,:);
CESM2dstable = timetable2table(CESM2dstt2);
CESM2dsarray = table2array(CESM2dstable(:,[2]));
CESM2dsts = mean(reshape(CESM2dsarray,6,[]));

CESM2WACCMdstt = timetable(modtimeColumn,CESM2WACCMts);
CESM2WACCMdstt2 = CESM2WACCMdstt(TR,:);
CESM2WACCMdstable = timetable2table(CESM2WACCMdstt2);
CESM2WACCMdsarray = table2array(CESM2WACCMdstable(:,[2]));
CESM2WACCMdsts = mean(reshape(CESM2WACCMdsarray,6,[]));

E3SM10dstt = timetable(modtimeColumn,E3SM10ts);
E3SM10dstt2 = E3SM10dstt(TR,:);
E3SM10dstable = timetable2table(E3SM10dstt2);
E3SM10dsarray = table2array(E3SM10dstable(:,[2]));
E3SM10dsts = mean(reshape(E3SM10dsarray,6,[]));

ECEarth3dstt = timetable(modtimeColumn,ECEarth3ts);
ECEarth3dstt2 = ECEarth3dstt(TR,:);
ECEarth3dstable = timetable2table(ECEarth3dstt2);
ECEarth3dsarray = table2array(ECEarth3dstable(:,[2]));
ECEarth3dsts = mean(reshape(ECEarth3dsarray,6,[]));

ECEarth3Vegdstt = timetable(modtimeColumn,ECEarth3Vegts);
ECEarth3Vegdstt2 = ECEarth3Vegdstt(TR,:);
ECEarth3Vegdstable = timetable2table(ECEarth3Vegdstt2);
ECEarth3Vegdsarray = table2array(ECEarth3Vegdstable(:,[2]));
ECEarth3Vegdsts = mean(reshape(ECEarth3Vegdsarray,6,[]));

GISSE21Gdstt = timetable(modtimeColumn,GISSE21Gts);
GISSE21Gdstt2 = GISSE21Gdstt(TR,:);
GISSE21Gdstable = timetable2table(GISSE21Gdstt2);
GISSE21Gdsarray = table2array(GISSE21Gdstable(:,[2]));
GISSE21Gdsts = mean(reshape(GISSE21Gdsarray,6,[]));

GISSE21Hdstt = timetable(modtimeColumn,GISSE21Hts);
GISSE21Hdstt2 = GISSE21Hdstt(TR,:);
GISSE21Hdstable = timetable2table(GISSE21Hdstt2);
GISSE21Hdsarray = table2array(GISSE21Hdstable(:,[2]));
GISSE21Hdsts = mean(reshape(GISSE21Hdsarray,6,[]));

MIROC6dstt = timetable(modtimeColumn,MIROC6ts);
MIROC6dstt2 = MIROC6dstt(TR,:);
MIROC6dstable = timetable2table(MIROC6dstt2);
MIROC6dsarray= table2array(MIROC6dstable(:,[2]));
MIROC6dsts = mean(reshape(MIROC6dsarray,6,[]));

MRIESM20dstt = timetable(modtimeColumn,MRIESM20ts);
MRIESM20dstt2 = MRIESM20dstt(TR,:);
MRIESM20dstable = timetable2table(MRIESM20dstt2);
MRIESM20dsarray = table2array(MRIESM20dstable(:,[2]));
MRIESM20dsts = mean(reshape(MRIESM20dsarray,6,[]));

SAM0UNICONdstt = timetable(modtimeColumn,SAM0UNICONts);
SAM0UNICONdstt2 = SAM0UNICONdstt(TR,:);
SAM0UNICONdstable = timetable2table(SAM0UNICONdstt2);
SAM0UNICONdsarray = table2array(SAM0UNICONdstable(:,[2]));
SAM0UNICONdsts = mean(reshape(SAM0UNICONdsarray,6,[]));

EnsembleMeandstt = timetable(modtimeColumn,EnsembleMeants); 
EnsembleMeandstt2 = EnsembleMeandstt(TR,:);
EnsembleMeandstable = timetable2table(EnsembleMeandstt2);
EnsembleMeandsarray = table2array(EnsembleMeandstable(:,[2]));
EnsembleMeandsts = mean(reshape(EnsembleMeandsarray,6,[]));

%Compute dry season stats
%(predicted, reference)
%corrcoef, bias, mean
%target_statistics(predicted,reference,norm) norm=normalized wrt sdev
% BCCCSM2MRc	
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc
% CHIRPSc
% CMAPc
% UDELc
CHIRPSds_mean = mean(CHIRPSdsarray);
CHIRPSds_corrcoef = corrcoef(CHIRPSdsarray,CHIRPSdsarray);
CHIRPSds_ds_sdev = std(CHIRPSdsarray);
CHIRPS_dsstats = target_statistics(CHIRPSdsarray,CHIRPSdsarray);

BCCCSM2MRds_mean = mean(BCCCSM2MRdsarray(13:216));
BCCCSM2MRds_corrcoef = corrcoef(BCCCSM2MRdsarray(13:216),CHIRPSdsarray);
BCCCSM2MR_dsstats = target_statistics(BCCCSM2MRdsarray(13:216),CHIRPSdsarray);
BCCCSM2MR_ds_sdev = std(BCCCSM2MRdsarray(13:216));

BCCESM1ds_mean = mean(BCCESM1dsarray(13:216));
BCCESM1ds_corrcoef = corrcoef(BCCESM1dsarray(13:216),CHIRPSdsarray);
BCCESM1_dsstats = target_statistics(BCCESM1dsarray(13:216),CHIRPSdsarray);
BCCESM1_ds_sdev = std(BCCESM1dsarray(13:216));

CanESM5ds_mean = mean(CanESM5dsarray(13:216));
CanESM5ds_corrcoef = corrcoef(CanESM5dsarray(13:216),CHIRPSdsarray);
CanESM5_dsstats = target_statistics(CanESM5dsarray(13:216),CHIRPSdsarray);
CanESM5_ds_sdev = std(CanESM5dsarray(13:216));

CESM2ds_mean = mean(CESM2dsarray(13:216));
CESM2ds_corrcoef = corrcoef(CESM2dsarray(13:216),CHIRPSdsarray);
CESM2_dsstats = target_statistics(CESM2dsarray(13:216),CHIRPSdsarray);
CESM2_ds_sdev = std(CESM2dsarray(13:216));

CESM2WACCMds_mean = mean(CESM2WACCMdsarray(13:216));
CESM2WACCMds_corrcoef = corrcoef(CESM2WACCMdsarray(13:216),CHIRPSdsarray);
CESM2WACCM_dsstats = target_statistics(CESM2WACCMdsarray(13:216),CHIRPSdsarray);
CESM2WACCM_ds_sdev = std(CESM2WACCMdsarray(13:216));

E3SM10ds_mean = mean(E3SM10dsarray(13:216));
E3SM10ds_corrcoef = corrcoef(E3SM10dsarray(13:216),CHIRPSdsarray);
E3SM10_dsstats = target_statistics(E3SM10dsarray(13:216),CHIRPSdsarray);
E3SM10_ds_sdev = std(E3SM10dsarray(13:216));

ECEarth3ds_mean = mean(ECEarth3dsarray(13:216));
ECEarth3ds_corrcoef = corrcoef(ECEarth3dsarray(13:216),CHIRPSdsarray);
ECEarth3_dsstats = target_statistics(ECEarth3dsarray(13:216),CHIRPSdsarray);
ECEarth3_ds_sdev = std(ECEarth3dsarray(13:216));

ECEarth3Vegds_mean = mean(ECEarth3Vegdsarray(13:216));
ECEarth3Vegds_corrcoef = corrcoef(ECEarth3Vegdsarray(13:216),CHIRPSdsarray);
ECEarth3Veg_dsstats = target_statistics(ECEarth3Vegdsarray(13:216),CHIRPSdsarray);
ECEarth3Veg_ds_sdev = std(ECEarth3Vegdsarray(13:216));

GISSE21Gds_mean = mean(GISSE21Gdsarray(13:216));
GISSE21Gds_corrcoef = corrcoef(GISSE21Gdsarray(13:216),CHIRPSdsarray);
GISSE21G_dsstats = target_statistics(GISSE21Gdsarray(13:216),CHIRPSdsarray);
GISSE21G_ds_sdev = std(GISSE21Gdsarray(13:216));

GISSE21Hds_mean = mean(GISSE21Hdsarray(13:216));
GISSE21Hds_corrcoef = corrcoef(GISSE21Hdsarray(13:216),CHIRPSdsarray);
GISSE21H_dsstats = target_statistics(GISSE21Hdsarray(13:216),CHIRPSdsarray);
GISSE21H_ds_sdev = std(GISSE21Hdsarray(13:216));

MIROC6ds_mean = mean(MIROC6dsarray(13:216));
MIROC6ds_corrcoef = corrcoef(MIROC6dsarray(13:216),CHIRPSdsarray);
MIROC6_dsstats = target_statistics(MIROC6dsarray(13:216),CHIRPSdsarray);
MIROC6_ds_sdev = std(MIROC6dsarray(13:216));

MRIESM20ds_mean = mean(MRIESM20dsarray(13:216));
MRIESM20ds_corrcoef = corrcoef(MRIESM20dsarray(13:216),CHIRPSdsarray);
MRIESM20_dsstats = target_statistics(MRIESM20dsarray(13:216),CHIRPSdsarray);
MRIESM20_ds_sdev = std(MRIESM20dsarray(13:216));

SAM0UNICONds_mean = mean(SAM0UNICONdsarray(13:216));
SAM0UNICONds_corrcoef = corrcoef(SAM0UNICONdsarray(13:216),CHIRPSdsarray);
SAM0UNICON_dsstats = target_statistics(SAM0UNICONdsarray(13:216),CHIRPSdsarray);
SAM0UNICON_ds_sdev = std(SAM0UNICONdsarray(13:216));

UDELds_mean = mean(UDELdsarray(13:216));
UDELds_corrcoef = corrcoef(UDELdsarray(13:216),CHIRPSdsarray);
UDEL_dsstats = target_statistics(UDELdsarray(13:216),CHIRPSdsarray);
UDEL_ds_sdev = std(UDELdsarray(13:216));

CMAPds_mean = mean(CMAPdsarray(13:216));
CMAPds_corrcoef = corrcoef(CMAPdsarray(13:216),CHIRPSdsarray);
CMAP_dsstats = target_statistics(CMAPdsarray(13:216),CHIRPSdsarray);
CMAP_ds_sdev = std(CMAPdsarray(13:216));

EnsembleMeands_mean = mean(EnsembleMeandsarray(13:216));
EnsembleMeands_corrcoef = corrcoef(EnsembleMeandsarray(13:216),CHIRPSdsarray);
EnsembleMean_dsstats = target_statistics(EnsembleMeandsarray(13:216),CHIRPSdsarray);
EnsembleMean_ds_sdev = std(EnsembleMeandsarray(13:216));


%Compute REGULAR stats
%(predicted, reference)
%corrcoef, bias, mean
%target_statistics(predicted,reference,norm) norm=normalized wrt sdev
%Make sure to use UDELts2 and CHIRPSts2 also (25:432) for 81-2014
% BCCCSM2MRc	
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc
% CHIRPSc
% CMAPc
% UDELc
CHIRPS_mean = mean(CHIRPSts2);
CHIRPS_corrcoef = corrcoef(CHIRPSts2,CHIRPSts2);
CHIRPS_sdev = std(CHIRPSts2);
CHIRPS_stats = target_statistics(CHIRPSts2,CHIRPSts2);

BCCCSM2MR_mean = mean(BCCCSM2MRts(25:432));
BCCCSM2MR_corrcoef = corrcoef(BCCCSM2MRts(25:432),CHIRPSts2);
BCCCSM2MR_stats = target_statistics(BCCCSM2MRts(25:432),CHIRPSts2);
BCCCSM2MR_sdev = std(BCCCSM2MRts(25:432));

BCCESM1_mean = mean(BCCESM1ts(25:432));
BCCESM1_corrcoef = corrcoef(BCCESM1ts(25:432),CHIRPSts2);
BCCESM1_stats = target_statistics(BCCESM1ts(25:432),CHIRPSts2);
BCCESM_sdev = std(BCCESM1ts(25:432));

CanESM5_mean = mean(CanESM5ts(25:432));
CanESM5_corrcoef = corrcoef(CanESM5ts(25:432),CHIRPSts2);
CanESM5_stats = target_statistics(CanESM5ts(25:432),CHIRPSts2);
CanESM5_sdev = std(CanESM5ts(25:432));

CESM2_mean = mean(CESM2ts(25:432));
CESM2_corrcoef = corrcoef(CESM2ts(25:432),CHIRPSts2);
CESM2_stats = target_statistics(CESM2ts(25:432),CHIRPSts2);
CESM2_sdev = std(CESM2ts(25:432));

CESM2WACCM_mean = mean(CESM2WACCMts(25:432));
CESM2WACCM_corrcoef = corrcoef(CESM2WACCMts(25:432),CHIRPSts2);
CESM2WACCM_stats = target_statistics(CESM2WACCMts(25:432),CHIRPSts2);
CESM2WACCM_sdev = std(CESM2WACCMts(25:432));

E3SM10_mean = mean(E3SM10ts(25:432));
E3SM10_corrcoef = corrcoef(E3SM10ts(25:432),CHIRPSts2);
E3SM10_stats = target_statistics(E3SM10ts(25:432),CHIRPSts2);
E3SM10_sdev = std(E3SM10ts(25:432));

ECEarth3_mean = mean(ECEarth3ts(25:432));
ECEarth3_corrcoef = corrcoef(ECEarth3ts(25:432),CHIRPSts2);
ECEarth3_stats = target_statistics(ECEarth3ts(25:432),CHIRPSts2);
ECEarth3_sdev = std(ECEarth3ts(25:432));

ECEarth3Veg_mean = mean(ECEarth3Vegts(25:432));
ECEarth3Veg_corrcoef = corrcoef(ECEarth3Vegts(25:432),CHIRPSts2);
ECEarth3Veg_stats = target_statistics(ECEarth3Vegts(25:432),CHIRPSts2);
ECEarth3Veg_sdev = std(ECEarth3Vegts(25:432));

GISSE21G_mean = mean(GISSE21Gts(25:432));
GISSE21G_corrcoef = corrcoef(GISSE21Gts(25:432),CHIRPSts2);
GISSE21G_stats = target_statistics(GISSE21Gts(25:432),CHIRPSts2);
GISSE21G_sdev = std(GISSE21Gts(25:432));

GISSE21H_mean = mean(GISSE21Hts(25:432));
GISSE21H_corrcoef = corrcoef(GISSE21Hts(25:432),CHIRPSts2);
GISSE21H_stats = target_statistics(GISSE21Hts(25:432),CHIRPSts2);
GISSE21H_sdev = std(GISSE21Hts(25:432));

MIROC6_mean = mean(MIROC6ts(25:432));
MIROC6_corrcoef = corrcoef(MIROC6ts(25:432),CHIRPSts2);
MIROC6_stats = target_statistics(MIROC6ts(25:432),CHIRPSts2);
MIROC6_sdev = std(MIROC6ts(25:432));

MRIESM20_mean = mean(MRIESM20ts(25:432));
MRIESM20_corrcoef = corrcoef(MRIESM20ts(25:432),CHIRPSts2);
MRIESM20_stats = target_statistics(MRIESM20ts(25:432),CHIRPSts2);
MRIESM20_sdev = std(MRIESM20ts(25:432));

SAM0UNICON_mean = mean(SAM0UNICONts(25:432));
SAM0UNICON_corrcoef = corrcoef(SAM0UNICONts(25:432),CHIRPSts2);
SAM0UNICON_stats = target_statistics(SAM0UNICONts(25:432),CHIRPSts2);
SAM0UNICON_sdev = std(SAM0UNICONts(25:432));

UDEL_mean = mean(UDELts2(25:432));
UDEL_corrcoef = corrcoef(UDELts2(25:432),CHIRPSts2);
UDEL_stats = target_statistics(UDELts2(25:432),CHIRPSts2);
UDEL_sdev = std(UDELts2(25:432));

CMAP_mean = mean(CMAPts(25:432));
CMAP_corrcoef = corrcoef(CMAPts(25:432),CHIRPSts2);
CMAP_stats = target_statistics(CMAPts(25:432),CHIRPSts2);
CMAP_sdev = std(CMAPts(25:432));

EnsembleMean_mean = mean(EnsembleMeants(25:432));
EnsembleMean_corrcoef = corrcoef(EnsembleMeants(25:432),CHIRPSts2);
EnsembleMean_stats = target_statistics(EnsembleMeants(25:432),CHIRPSts2);
EnsembleMean_sdev = std(EnsembleMeants(25:432));


%Plot dry season time series (dsts) 34 years 1981-2014
StartDate = datetime(1981,01,01);
EndDate = datetime(2014,12,31);
annualtime= StartDate:calyears(1):EndDate;

%Remember that CHIRPS is 81-2014, so you have to make
%all the vectors 34 in length (get rid of '79 and '80)
figure
plot(annualtime,BCCCSM2MRdsts(3:36),'-+r')
title('Dry Season (Apr-Sept) Mean Precipitation 1981-2014')
xlabel('Time (years)')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime,BCCESM1dsts(3:36),'-ok')
hold on
plot(annualtime,CanESM5dsts(3:36),'-*b')
hold on
plot(annualtime,CESM2dsts(3:36),'-xk')
hold on
plot(annualtime,CESM2WACCMdsts(3:36),'-pm')
hold on
plot(annualtime,E3SM10dsts(3:36),'-*c')
hold on 
plot(annualtime,ECEarth3dsts(3:36),'--sm')
hold on
plot(annualtime,ECEarth3Vegdsts(3:36),':xk')
hold on
plot(annualtime,GISSE21Gdsts(3:36),'-.og')
hold on
plot(annualtime,GISSE21Hdsts(3:36),':>r')
hold on
plot(annualtime,MIROC6dsts(3:36),'-hb')
hold on
plot(annualtime,MRIESM20dsts(3:36),'--pr')
hold on
plot(annualtime,SAM0UNICONdsts(3:36),'-xb')
hold on
plot(annualtime,EnsembleMeandsts(3:36),'--*r')
hold on
plot(annualtime,UDELdsts(3:36),'-.b')
hold on
plot(annualtime,CMAPdsts(3:36),'-dk')
hold on
plot(annualtime,CHIRPSdsts,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS')

%Plot dry season TRENDS ONLY (dsts) 34 years 1981-2014
StartDate = datetime(1981,01,01);
EndDate = datetime(2014,12,31);
annualtime= StartDate:calyears(1):EndDate;

%Remember that CHIRPS is 81-2014, so you have to make
%all the vectors 34 in length (get rid of '79 and '80)
figure
polyplot(annualtime,BCCCSM2MRdsts(3:36),1,'linewidth',2)
title('Dry Season Precipitation Trends 1981-2014')
xlabel('Time (years)')
ylabel('Precipitation (mm/day)')
grid
hold on 
polyplot(annualtime,BCCESM1dsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,CanESM5dsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,CESM2dsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,CESM2WACCMdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,E3SM10dsts(3:36),1,'linewidth',2)
hold on 
polyplot(annualtime,ECEarth3dsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,ECEarth3Vegdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,GISSE21Gdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,GISSE21Hdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,MIROC6dsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,MRIESM20dsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,SAM0UNICONdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,EnsembleMeandsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,UDELdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,CMAPdsts(3:36),1,'linewidth',2)
hold on
polyplot(annualtime,CHIRPSdsts,1,'linewidth',2)
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS')

StartDate2 = datetime(1979,01,01);
EndDate2 = datetime(2014,12,31);
annualtime2= StartDate2:calyears(1):EndDate2;
annualtime2 = datenum(annualtime2);   %convert this for trend function

annualtime3 = datenum(annualtime);   %this is for CHIRPS

[tr,p] = trend(BCCCSM2MRdsts,annualtime2)
[tr,p] = trend(BCCESM1dsts,annualtime2)
[tr,p] = trend(CanESM5dsts,annualtime2)
[tr,p] = trend(CESM2dsts,annualtime2)
[tr,p] = trend(CESM2WACCMdsts,annualtime2)
[tr,p] = trend(E3SM10dsts,annualtime2)
[tr,p] = trend(ECEarth3dsts,annualtime2)
[tr,p] = trend(ECEarth3Vegdsts,annualtime2)
[tr,p] = trend(GISSE21Gdsts,annualtime2)
[tr,p] = trend(GISSE21Hdsts,annualtime2)
[tr,p] = trend(MIROC6dsts,annualtime2)
[tr,p] = trend(MRIESM20dsts,annualtime2)
[tr,p] = trend(SAM0UNICONdsts,annualtime2)
[tr,p] = trend(UDELdsts,annualtime2)
[tr,p] = trend(CMAPdsts,annualtime2)
[tr,p] = trend(CHIRPSdsts,annualtime3)
[tr,p] = trend(EnsembleMeandsts,annualtime2)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%   DRY SEASON FOR N/SAz masks   %%%%%%%%%%%%%%%%%%%%%%%%%
%files are "c"   OR "c585"
%Change current folder
cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6'

% Load in c mat files in Final_Files folder
%Just change '.\Final_Files\
%Data is 1981-2014 monthly data with 408 timesteps
%Lat is 220 and Lon is 261 
%CHIRPS and UDEL are mm/month all others are mm/day
fds = fileDatastore('.\Final_Files\*c.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%Create repeating day matrices for CHIRPS/UDEL
%Units for these are mm/month. I need mm/day
n = 34;   %for chirps years
x = 36;   %for udel years
%days = [31,28,31,30,31,30,31,31,30,31,30,31];   %days/month
jan = repmat(31,220,261); feb= repmat(28,220,261); mar = repmat(31,220,261);...
    apr = repmat(30,220,261); may = repmat(31,220,261); jun = repmat(30,220,261);...
    jul = repmat(31,220,261); aug = repmat(31,220,261); sep = repmat(30,220,261);...
    oct = repmat(31,220,261); nov = repmat(30,220,261); dec = repmat(31,220,261);
days = cat(3,jan,feb,mar,apr,may,jun,jul,aug,sep,oct,nov,dec);
CHIRPSdays = repmat(days,[1 1 n]);
UDELdays = repmat(days,[1 1 x]);   %and for all other models

%Divide CHIRPS/UDEL by CHIRPSdays
CHIRPSc = CHIRPSc./CHIRPSdays;
UDELc = UDELc./CHIRPSdays;

mean(CHIRPSc,'all','omitnan')

[Lon,Lat] = meshgrid(lon,lat);
lon2 = lon-360;   %adjust lon

mask = geomask(Lat,Lon,[-18 6],[-76 -42]);  %just a square around Brazilian Amazon
NAZmask = geomask(Lat,Lon,[-5 5],[-70 -50]);
SAZmask = geomask(Lat,Lon,[-15.5 -5],[-70 -50]);

figure
imagescn(lon2,lat,SAZmask)   %just for box mask
axis xy tight
title 'Southern Amazon mask'
xlabel 'longitude'
ylabel 'latitude'
ax = axis;
borders('countries')
axis(ax)

StartDate = datetime(1981,01,01,"Format","MMM-uuuu");  %for each dataset create time vector
EndDate = datetime(2014,12,31,"Format","MMM-uuuu");
dates = StartDate:calmonths(1):EndDate;
modtimeColumn = dates.';
modtime = datenum(dates');

StartDate585 = datetime(2050,01,01,"Format","MMM-uuuu");  %for each dataset create time vector
EndDate585 = datetime(2100,12,31,"Format","MMM-uuuu");
dates585 = StartDate585:calmonths(1):EndDate585;
modtimeColumn585 = dates585.';
modtime585 = datenum(dates585');

%THIS IS TO EXTRACT DRY/RAINY SEASON
%Evaluate DRY SEASON ONLY Month==6,7,8 (SAZ) Month==7,8,9(NAZ)
%Evaluate RAINY SEASON ONLY Month==12,1,2 (SAZ) Month==3,4,5 (NAZ)
NAZrainySEASON = month(dates) == 3 | month(dates) == 4 | month(dates) == 5;
SAZrainySEASON = month(dates) == 1 | month(dates) == 2 | month(dates) == 12;
NAZdrySEASON =  month(dates) == 7 | month(dates) == 8 | month(dates) == 9;
SAZdrySEASON =  month(dates) == 6 | month(dates) == 7 | month(dates) == 8;

NAZrainySEASON585 = month(dates585) == 3 | month(dates585) == 4 | month(dates585) == 5;
SAZrainySEASON585 = month(dates585) == 1 | month(dates585) == 2 | month(dates585) == 12;
NAZdrySEASON585 =  month(dates585) == 7 | month(dates585) == 8 | month(dates585) == 9;
SAZdrySEASON585 =  month(dates585) == 6 | month(dates585) == 7 | month(dates585) == 8;

% Extract dry season data from NAZ
UDELcdryNAZ = UDELc(:,:,NAZdrySEASON);       %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPScdryNAZ = CHIRPSc(:,:,NAZdrySEASON);
CMAPcdryNAZ = CMAPc(:,:,NAZdrySEASON);
BCCCSM2MRcdryNAZ = BCCCSM2MRc(:,:,NAZdrySEASON);    %MOD HIST FOR NAZ
BCCESM1cdryNAZ = BCCESM1c(:,:,NAZdrySEASON);
CanESM5cdryNAZ = CanESM5c(:,:,NAZdrySEASON);
CESM2cdryNAZ = CESM2c(:,:,NAZdrySEASON);
CESM2WACCMcdryNAZ = CESM2WACCMc(:,:,NAZdrySEASON);
E3SM10cdryNAZ = E3SM10c(:,:,NAZdrySEASON);
ECEarth3cdryNAZ = ECEarth3c(:,:,NAZdrySEASON);
ECEarth3VegcdryNAZ = ECEarth3Vegc(:,:,NAZdrySEASON);
GISSE21GcdryNAZ = GISSE21Gc(:,:,NAZdrySEASON);
GISSE21HcdryNAZ = GISSE21Hc(:,:,NAZdrySEASON);
MIROC6cdryNAZ = MIROC6c(:,:,NAZdrySEASON);
MRIESM20cdryNAZ = MRIESM20c(:,:,NAZdrySEASON);
SAM0UNICONcdryNAZ = SAM0UNICONc(:,:,NAZdrySEASON);

% Extract dry season data from SAZ
UDELcdrySAZ = UDELc(:,:,SAZdrySEASON);       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPScdrySAZ = CHIRPSc(:,:,SAZdrySEASON);
CMAPcdrySAZ = CMAPc(:,:,SAZdrySEASON);
BCCCSM2MRcdrySAZ = BCCCSM2MRc(:,:,SAZdrySEASON);    %MOD HIST FOR SAZ
BCCESM1cdrySAZ = BCCESM1c(:,:,SAZdrySEASON);
CanESM5cdrySAZ = CanESM5c(:,:,SAZdrySEASON);
CESM2cdrySAZ = CESM2c(:,:,SAZdrySEASON);
CESM2WACCMcdrySAZ = CESM2WACCMc(:,:,SAZdrySEASON);
E3SM10cdrySAZ= E3SM10c(:,:,SAZdrySEASON);
ECEarth3cdrySAZ = ECEarth3c(:,:,SAZdrySEASON);
ECEarth3VegcdrySAZ = ECEarth3Vegc(:,:,SAZdrySEASON);
GISSE21GcdrySAZ = GISSE21Gc(:,:,SAZdrySEASON);
GISSE21HcdrySAZ = GISSE21Hc(:,:,SAZdrySEASON);
MIROC6cdrySAZ= MIROC6c(:,:,SAZdrySEASON);
MRIESM20cdrySAZ = MRIESM20c(:,:,SAZdrySEASON);
SAM0UNICONcdrySAZ = SAM0UNICONc(:,:,SAZdrySEASON);

% Extract wet season data from NAZ
UDELcrainyNAZ = UDELc(:,:,NAZrainySEASON);       %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPScrainyNAZ = CHIRPSc(:,:,NAZrainySEASON);
CMAPcrainyNAZ = CMAPc(:,:,NAZrainySEASON);
BCCCSM2MRcrainyNAZ = BCCCSM2MRc(:,:,NAZrainySEASON);    %MOD HIST FOR NAZ
BCCESM1crainyNAZ = BCCESM1c(:,:,NAZrainySEASON);
CanESM5crainyNAZ = CanESM5c(:,:,NAZrainySEASON);
CESM2crainyNAZ = CESM2c(:,:,NAZrainySEASON);
CESM2WACCMcrainyNAZ = CESM2WACCMc(:,:,NAZrainySEASON);
E3SM10crainyNAZ = E3SM10c(:,:,NAZrainySEASON);
ECEarth3crainyNAZ = ECEarth3c(:,:,NAZrainySEASON);
ECEarth3VegcrainyNAZ = ECEarth3Vegc(:,:,NAZrainySEASON);
GISSE21GcrainyNAZ = GISSE21Gc(:,:,NAZrainySEASON);
GISSE21HcrainyNAZ = GISSE21Hc(:,:,NAZrainySEASON);
MIROC6crainyNAZ = MIROC6c(:,:,NAZrainySEASON);
MRIESM20crainyNAZ = MRIESM20c(:,:,NAZrainySEASON);
SAM0UNICONcrainyNAZ = SAM0UNICONc(:,:,NAZrainySEASON);

% Extract wet season data from SAZ
UDELcrainySAZ = UDELc(:,:,SAZrainySEASON);       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPScrainySAZ = CHIRPSc(:,:,SAZrainySEASON);
CMAPcrainySAZ = CMAPc(:,:,SAZrainySEASON);
BCCCSM2MRcrainySAZ = BCCCSM2MRc(:,:,SAZrainySEASON);    %MOD HIST FOR SAZ
BCCESM1crainySAZ = BCCESM1c(:,:,SAZrainySEASON);
CanESM5crainySAZ = CanESM5c(:,:,SAZrainySEASON);
CESM2crainySAZ = CESM2c(:,:,SAZrainySEASON);
CESM2WACCMcrainySAZ = CESM2WACCMc(:,:,SAZrainySEASON);
E3SM10crainySAZ= E3SM10c(:,:,SAZrainySEASON);
ECEarth3crainySAZ = ECEarth3c(:,:,SAZrainySEASON);
ECEarth3VegcrainySAZ = ECEarth3Vegc(:,:,SAZrainySEASON);
GISSE21GcrainySAZ = GISSE21Gc(:,:,SAZrainySEASON);
GISSE21HcrainySAZ = GISSE21Hc(:,:,SAZrainySEASON);
MIROC6crainySAZ= MIROC6c(:,:,SAZrainySEASON);
MRIESM20crainySAZ = MRIESM20c(:,:,SAZrainySEASON);
SAM0UNICONcrainySAZ = SAM0UNICONc(:,:,SAZrainySEASON);

nt=102;  %new time vector

%Get time series for NAZ dry season '[]cdryNAZ'
UDELtsdryNAZ = local(UDELcdryNAZ,NAZmask,'omitnan');       %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPStsdryNAZ = local(CHIRPScdryNAZ,NAZmask,'omitnan');
CMAPtsdryNAZ = local(CMAPcdryNAZ,NAZmask,'omitnan');
BCCCSM2MRtsdryNAZ = local(BCCCSM2MRcdryNAZ,NAZmask,'omitnan');    %MOD HIST FOR NAZ
BCCESM1tsdryNAZ = local(BCCESM1cdryNAZ,NAZmask,'omitnan');
CanESM5tsdryNAZ = local(CanESM5cdryNAZ,NAZmask,'omitnan');
CESM2tsdryNAZ	= local(CESM2cdryNAZ,NAZmask,'omitnan');
CESM2WACCMtsdryNAZ = local(CESM2WACCMcdryNAZ,NAZmask,'omitnan');
E3SM10tsdryNAZ = local(E3SM10cdryNAZ,NAZmask,'omitnan');
ECEarth3tsdryNAZ = local(ECEarth3cdryNAZ,NAZmask,'omitnan');
ECEarth3VegtsdryNAZ = local(ECEarth3VegcdryNAZ,NAZmask,'omitnan');
GISSE21GtsdryNAZ = local(GISSE21GcdryNAZ,NAZmask,'omitnan');
GISSE21HtsdryNAZ = local(GISSE21HcdryNAZ,NAZmask,'omitnan');
MIROC6tsdryNAZ = local(MIROC6cdryNAZ,NAZmask,'omitnan');
MRIESM20tsdryNAZ = local(MRIESM20cdryNAZ,NAZmask,'omitnan');
SAM0UNICONtsdryNAZ = local(SAM0UNICONcdryNAZ,NAZmask,'omitnan');

EnsembletsdryNAZ = [BCCCSM2MRtsdryNAZ,BCCESM1tsdryNAZ,CanESM5tsdryNAZ,CESM2tsdryNAZ,CESM2WACCMtsdryNAZ,...
    E3SM10tsdryNAZ,ECEarth3tsdryNAZ,ECEarth3VegtsdryNAZ,GISSE21GtsdryNAZ,GISSE21HtsdryNAZ,MIROC6tsdryNAZ,...
    MRIESM20tsdryNAZ,SAM0UNICONtsdryNAZ];

EnsembleMeantsdryNAZ = mean(EnsembletsdryNAZ,2); 

%to reshape you must invert
UDELtsdryNAZ = UDELtsdryNAZ';       %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPStsdryNAZ = CHIRPStsdryNAZ';
CMAPtsdryNAZ = CMAPtsdryNAZ';
BCCCSM2MRtsdryNAZ = BCCCSM2MRtsdryNAZ';    %MOD HIST FOR NAZ
BCCESM1tsdryNAZ = BCCESM1tsdryNAZ';
CanESM5tsdryNAZ = CanESM5tsdryNAZ';
CESM2tsdryNAZ	= CESM2tsdryNAZ';
CESM2WACCMtsdryNAZ = CESM2WACCMtsdryNAZ';
E3SM10tsdryNAZ = E3SM10tsdryNAZ';
ECEarth3tsdryNAZ = ECEarth3tsdryNAZ';
ECEarth3VegtsdryNAZ = ECEarth3VegtsdryNAZ';
GISSE21GtsdryNAZ = GISSE21GtsdryNAZ';
GISSE21HtsdryNAZ = GISSE21HtsdryNAZ';
MIROC6tsdryNAZ = MIROC6tsdryNAZ';
MRIESM20tsdryNAZ = MRIESM20tsdryNAZ';
SAM0UNICONtsdryNAZ = SAM0UNICONtsdryNAZ';
EnsembleMeantsdryNAZ = EnsembleMeantsdryNAZ'; 

%average every 3rd element in NAZ dry time series to get average of season
UDELtsdryNAZ = mean(reshape(UDELtsdryNAZ,[3,34]));     %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPStsdryNAZ = mean(reshape(CHIRPStsdryNAZ,[3,34])); 
CMAPtsdryNAZ = mean(reshape(CMAPtsdryNAZ,[3,34])); 
BCCCSM2MRtsdryNAZ = mean(reshape(BCCCSM2MRtsdryNAZ,[3,34]));     %MOD HIST FOR NAZ
BCCESM1tsdryNAZ = mean(reshape(BCCESM1tsdryNAZ,[3,34])); 
CanESM5tsdryNAZ = mean(reshape(CanESM5tsdryNAZ,[3,34])); 
CESM2tsdryNAZ	= mean(reshape(CESM2tsdryNAZ,[3,34])); 
CESM2WACCMtsdryNAZ = mean(reshape(CESM2WACCMtsdryNAZ,[3,34])); 
E3SM10tsdryNAZ = mean(reshape(E3SM10tsdryNAZ,[3,34])); 
ECEarth3tsdryNAZ = mean(reshape(ECEarth3tsdryNAZ,[3,34])); 
ECEarth3VegtsdryNAZ = mean(reshape(ECEarth3VegtsdryNAZ,[3,34])); 
GISSE21GtsdryNAZ = mean(reshape(GISSE21GtsdryNAZ,[3,34])); 
GISSE21HtsdryNAZ = mean(reshape(GISSE21HtsdryNAZ,[3,34])); 
MIROC6tsdryNAZ = mean(reshape(MIROC6tsdryNAZ,[3,34])); 
MRIESM20tsdryNAZ = mean(reshape(MRIESM20tsdryNAZ,[3,34])); 
SAM0UNICONtsdryNAZ = mean(reshape(SAM0UNICONtsdryNAZ,[3,34])); 
EnsembleMeantsdryNAZ = mean(reshape(EnsembleMeantsdryNAZ,[3,34])); 


%Get time series for SAZ dry season '[]cdrySAZ'
UDELtsdrySAZ = local(UDELcdrySAZ,SAZmask,'omitnan');       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsdrySAZ = local(CHIRPScdrySAZ,SAZmask,'omitnan');
CMAPtsdrySAZ = local(CMAPcdrySAZ,SAZmask,'omitnan');
BCCCSM2MRtsdrySAZ = local(BCCCSM2MRcdrySAZ,SAZmask,'omitnan');    %MOD HIST FOR SAZ
BCCESM1tsdrySAZ = local(BCCESM1cdrySAZ,SAZmask,'omitnan');
CanESM5tsdrySAZ = local(CanESM5cdrySAZ,SAZmask,'omitnan');
CESM2tsdrySAZ	= local(CESM2cdrySAZ,SAZmask,'omitnan');
CESM2WACCMtsdrySAZ = local(CESM2WACCMcdrySAZ,SAZmask,'omitnan');
E3SM10tsdrySAZ = local(E3SM10cdrySAZ,SAZmask,'omitnan');
ECEarth3tsdrySAZ = local(ECEarth3cdrySAZ,SAZmask,'omitnan');
ECEarth3VegtsdrySAZ = local(ECEarth3VegcdrySAZ,SAZmask,'omitnan');
GISSE21GtsdrySAZ = local(GISSE21GcdrySAZ,SAZmask,'omitnan');
GISSE21HtsdrySAZ = local(GISSE21HcdrySAZ,SAZmask,'omitnan');
MIROC6tsdrySAZ = local(MIROC6cdrySAZ,SAZmask,'omitnan');
MRIESM20tsdrySAZ = local(MRIESM20cdrySAZ,SAZmask,'omitnan');
SAM0UNICONtsdrySAZ = local(SAM0UNICONcdrySAZ,SAZmask,'omitnan');

EnsembletsdrySAZ = [BCCCSM2MRtsdrySAZ,BCCESM1tsdrySAZ,CanESM5tsdrySAZ,CESM2tsdrySAZ,CESM2WACCMtsdrySAZ,...
    E3SM10tsdrySAZ,ECEarth3tsdrySAZ,ECEarth3VegtsdrySAZ,GISSE21GtsdrySAZ,GISSE21HtsdrySAZ,MIROC6tsdrySAZ,...
    MRIESM20tsdrySAZ,SAM0UNICONtsdrySAZ];

EnsembleMeantsdrySAZ = mean(EnsembletsdrySAZ,2); 

%to reshape you must invert
UDELtsdrySAZ = UDELtsdrySAZ';       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsdrySAZ = CHIRPStsdrySAZ';
CMAPtsdrySAZ = CMAPtsdrySAZ';
BCCCSM2MRtsdrySAZ = BCCCSM2MRtsdrySAZ';    %MOD HIST FOR SAZ
BCCESM1tsdrySAZ = BCCESM1tsdrySAZ';
CanESM5tsdrySAZ = CanESM5tsdrySAZ';
CESM2tsdrySAZ	= CESM2tsdrySAZ';
CESM2WACCMtsdrySAZ = CESM2WACCMtsdrySAZ';
E3SM10tsdrySAZ = E3SM10tsdrySAZ';
ECEarth3tsdrySAZ = ECEarth3tsdrySAZ';
ECEarth3VegtsdrySAZ = ECEarth3VegtsdrySAZ';
GISSE21GtsdrySAZ = GISSE21GtsdrySAZ';
GISSE21HtsdrySAZ = GISSE21HtsdrySAZ';
MIROC6tsdrySAZ = MIROC6tsdrySAZ';
MRIESM20tsdrySAZ = MRIESM20tsdrySAZ';
SAM0UNICONtsdrySAZ = SAM0UNICONtsdrySAZ';
EnsembleMeantsdrySAZ = EnsembleMeantsdrySAZ'; 

%average every 3rd element in SAZ dry time series to get average of season
UDELtsdrySAZ = mean(reshape(UDELtsdrySAZ,[3,34]));     %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsdrySAZ = mean(reshape(CHIRPStsdrySAZ,[3,34])); 
CMAPtsdrySAZ = mean(reshape(CMAPtsdrySAZ,[3,34])); 
BCCCSM2MRtsdrySAZ = mean(reshape(BCCCSM2MRtsdrySAZ,[3,34]));     %MOD HIST FOR SAZ
BCCESM1tsdrySAZ = mean(reshape(BCCESM1tsdrySAZ,[3,34])); 
CanESM5tsdrySAZ = mean(reshape(CanESM5tsdrySAZ,[3,34])); 
CESM2tsdrySAZ	= mean(reshape(CESM2tsdrySAZ,[3,34])); 
CESM2WACCMtsdrySAZ = mean(reshape(CESM2WACCMtsdrySAZ,[3,34])); 
E3SM10tsdrySAZ = mean(reshape(E3SM10tsdrySAZ,[3,34])); 
ECEarth3tsdrySAZ = mean(reshape(ECEarth3tsdrySAZ,[3,34])); 
ECEarth3VegtsdrySAZ = mean(reshape(ECEarth3VegtsdrySAZ,[3,34])); 
GISSE21GtsdrySAZ = mean(reshape(GISSE21GtsdrySAZ,[3,34])); 
GISSE21HtsdrySAZ = mean(reshape(GISSE21HtsdrySAZ,[3,34])); 
MIROC6tsdrySAZ= mean(reshape(MIROC6tsdrySAZ,[3,34])); 
MRIESM20tsdrySAZ = mean(reshape(MRIESM20tsdrySAZ,[3,34])); 
SAM0UNICONtsdrySAZ = mean(reshape(SAM0UNICONtsdrySAZ,[3,34])); 
EnsembleMeantsdrySAZ = mean(reshape(EnsembleMeantsdrySAZ,[3,34])); 



%Get time series for NAZ rainy season '[]crainyNAZ'
UDELtsrainyNAZ = local(UDELcrainyNAZ,NAZmask,'omitnan');       %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPStsrainyNAZ = local(CHIRPScrainyNAZ,NAZmask,'omitnan');
CMAPtsrainyNAZ = local(CMAPcrainyNAZ,NAZmask,'omitnan');
BCCCSM2MRtsrainyNAZ = local(BCCCSM2MRcrainyNAZ,NAZmask,'omitnan');    %MOD HIST FOR NAZ
BCCESM1tsrainyNAZ = local(BCCESM1crainyNAZ,NAZmask,'omitnan');
CanESM5tsrainyNAZ = local(CanESM5crainyNAZ,NAZmask,'omitnan');
CESM2tsrainyNAZ	= local(CESM2crainyNAZ,NAZmask,'omitnan');
CESM2WACCMtsrainyNAZ = local(CESM2WACCMcrainyNAZ,NAZmask,'omitnan');
E3SM10tsrainyNAZ = local(E3SM10crainyNAZ,NAZmask,'omitnan');
ECEarth3tsrainyNAZ = local(ECEarth3crainyNAZ,NAZmask,'omitnan');
ECEarth3VegtsrainyNAZ = local(ECEarth3VegcrainyNAZ,NAZmask,'omitnan');
GISSE21GtsrainyNAZ = local(GISSE21GcrainyNAZ,NAZmask,'omitnan');
GISSE21HtsrainyNAZ = local(GISSE21HcrainyNAZ,NAZmask,'omitnan');
MIROC6tsrainyNAZ = local(MIROC6crainyNAZ,NAZmask,'omitnan');
MRIESM20tsrainyNAZ = local(MRIESM20crainyNAZ,NAZmask,'omitnan');
SAM0UNICONtsrainyNAZ = local(SAM0UNICONcrainyNAZ,NAZmask,'omitnan');

EnsembletsrainyNAZ = [BCCCSM2MRtsrainyNAZ,BCCESM1tsrainyNAZ,CanESM5tsrainyNAZ,CESM2tsrainyNAZ,CESM2WACCMtsrainyNAZ,...
    E3SM10tsrainyNAZ,ECEarth3tsrainyNAZ,ECEarth3VegtsrainyNAZ,GISSE21GtsrainyNAZ,GISSE21HtsrainyNAZ,MIROC6tsrainyNAZ,...
    MRIESM20tsrainyNAZ,SAM0UNICONtsrainyNAZ];

EnsembleMeantsrainyNAZ = mean(EnsembletsrainyNAZ,2); 

%to reshape you must invert
UDELtsrainyNAZ = UDELtsrainyNAZ';       %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPStsrainyNAZ = CHIRPStsrainyNAZ';
CMAPtsrainyNAZ = CMAPtsrainyNAZ';
BCCCSM2MRtsrainyNAZ = BCCCSM2MRtsrainyNAZ';    %MOD HIST FOR NAZ
BCCESM1tsrainyNAZ = BCCESM1tsrainyNAZ';
CanESM5tsrainyNAZ = CanESM5tsrainyNAZ';
CESM2tsrainyNAZ	= CESM2tsrainyNAZ';
CESM2WACCMtsrainyNAZ = CESM2WACCMtsrainyNAZ';
E3SM10tsrainyNAZ = E3SM10tsrainyNAZ';
ECEarth3tsrainyNAZ = ECEarth3tsrainyNAZ';
ECEarth3VegtsrainyNAZ = ECEarth3VegtsrainyNAZ';
GISSE21GtsrainyNAZ = GISSE21GtsrainyNAZ';
GISSE21HtsrainyNAZ = GISSE21HtsrainyNAZ';
MIROC6tsrainyNAZ = MIROC6tsrainyNAZ';
MRIESM20tsrainyNAZ = MRIESM20tsrainyNAZ';
SAM0UNICONtsrainyNAZ = SAM0UNICONtsrainyNAZ';
EnsembleMeantsrainyNAZ = EnsembleMeantsrainyNAZ'; 

%average every 3rd element in NAZ rainy time series to get average of season
UDELtsrainyNAZ = mean(reshape(UDELtsrainyNAZ,[3,34]));     %OBS  FOR NAZ  %%%%%%%%%%%%
CHIRPStsrainyNAZ = mean(reshape(CHIRPStsrainyNAZ,[3,34])); 
CMAPtsrainyNAZ = mean(reshape(CMAPtsrainyNAZ,[3,34])); 
BCCCSM2MRtsrainyNAZ = mean(reshape(BCCCSM2MRtsrainyNAZ,[3,34]));     %MOD HIST FOR NAZ
BCCESM1tsrainyNAZ = mean(reshape(BCCESM1tsrainyNAZ,[3,34])); 
CanESM5tsrainyNAZ = mean(reshape(CanESM5tsrainyNAZ,[3,34])); 
CESM2tsrainyNAZ	= mean(reshape(CESM2tsrainyNAZ,[3,34])); 
CESM2WACCMtsrainyNAZ = mean(reshape(CESM2WACCMtsrainyNAZ,[3,34])); 
E3SM10tsrainyNAZ = mean(reshape(E3SM10tsrainyNAZ,[3,34])); 
ECEarth3tsrainyNAZ = mean(reshape(ECEarth3tsrainyNAZ,[3,34])); 
ECEarth3VegtsrainyNAZ = mean(reshape(ECEarth3VegtsrainyNAZ,[3,34])); 
GISSE21GtsrainyNAZ = mean(reshape(GISSE21GtsrainyNAZ,[3,34])); 
GISSE21HtsrainyNAZ = mean(reshape(GISSE21HtsrainyNAZ,[3,34])); 
MIROC6tsrainyNAZ = mean(reshape(MIROC6tsrainyNAZ,[3,34])); 
MRIESM20tsrainyNAZ = mean(reshape(MRIESM20tsrainyNAZ,[3,34])); 
SAM0UNICONtsrainyNAZ = mean(reshape(SAM0UNICONtsrainyNAZ,[3,34])); 
EnsembleMeantsrainyNAZ = mean(reshape(EnsembleMeantsrainyNAZ,[3,34])); 


%Get time series for SAZ rainy season '[]crainySAZ'
UDELtsrainySAZ = local(UDELcrainySAZ,SAZmask,'omitnan');       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsrainySAZ = local(CHIRPScrainySAZ,SAZmask,'omitnan');
CMAPtsrainySAZ = local(CMAPcrainySAZ,SAZmask,'omitnan');
BCCCSM2MRtsrainySAZ = local(BCCCSM2MRcrainySAZ,SAZmask,'omitnan');    %MOD HIST FOR SAZ
BCCESM1tsrainySAZ = local(BCCESM1crainySAZ,SAZmask,'omitnan');
CanESM5tsrainySAZ = local(CanESM5crainySAZ,SAZmask,'omitnan');
CESM2tsrainySAZ	= local(CESM2crainySAZ,SAZmask,'omitnan');
CESM2WACCMtsrainySAZ = local(CESM2WACCMcrainySAZ,SAZmask,'omitnan');
E3SM10tsrainySAZ = local(E3SM10crainySAZ,SAZmask,'omitnan');
ECEarth3tsrainySAZ = local(ECEarth3crainySAZ,SAZmask,'omitnan');
ECEarth3VegtsrainySAZ = local(ECEarth3VegcrainySAZ,SAZmask,'omitnan');
GISSE21GtsrainySAZ = local(GISSE21GcrainySAZ,SAZmask,'omitnan');
GISSE21HtsrainySAZ = local(GISSE21HcrainySAZ,SAZmask,'omitnan');
MIROC6tsrainySAZ = local(MIROC6crainySAZ,SAZmask,'omitnan');
MRIESM20tsrainySAZ = local(MRIESM20crainySAZ,SAZmask,'omitnan');
SAM0UNICONtsrainySAZ = local(SAM0UNICONcrainySAZ,SAZmask,'omitnan');

EnsembletsrainySAZ = [BCCCSM2MRtsrainySAZ,BCCESM1tsrainySAZ,CanESM5tsrainySAZ,CESM2tsrainySAZ,CESM2WACCMtsrainySAZ,...
    E3SM10tsrainySAZ,ECEarth3tsrainySAZ,ECEarth3VegtsrainySAZ,GISSE21GtsrainySAZ,GISSE21HtsrainySAZ,MIROC6tsrainySAZ,...
    MRIESM20tsrainySAZ,SAM0UNICONtsrainySAZ];

EnsembleMeantsrainySAZ = mean(EnsembletsrainySAZ,2); 

%to reshape you must invert
UDELtsrainySAZ = UDELtsrainySAZ';       %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsrainySAZ = CHIRPStsrainySAZ';
CMAPtsrainySAZ = CMAPtsrainySAZ';
BCCCSM2MRtsrainySAZ = BCCCSM2MRtsrainySAZ';    %MOD HIST FOR SAZ
BCCESM1tsrainySAZ = BCCESM1tsrainySAZ';
CanESM5tsrainySAZ = CanESM5tsrainySAZ';
CESM2tsrainySAZ	= CESM2tsrainySAZ';
CESM2WACCMtsrainySAZ = CESM2WACCMtsrainySAZ';
E3SM10tsrainySAZ = E3SM10tsrainySAZ';
ECEarth3tsrainySAZ = ECEarth3tsrainySAZ';
ECEarth3VegtsrainySAZ = ECEarth3VegtsrainySAZ';
GISSE21GtsrainySAZ = GISSE21GtsrainySAZ';
GISSE21HtsrainySAZ = GISSE21HtsrainySAZ';
MIROC6tsrainySAZ = MIROC6tsrainySAZ';
MRIESM20tsrainySAZ = MRIESM20tsrainySAZ';
SAM0UNICONtsrainySAZ = SAM0UNICONtsrainySAZ';
EnsembleMeantsrainySAZ = EnsembleMeantsrainySAZ'; 

%average every 3rd element in SAZ rainy time series to get average of season
UDELtsrainySAZ = mean(reshape(UDELtsrainySAZ,[3,34]));     %OBS  FOR SAZ  %%%%%%%%%%%%
CHIRPStsrainySAZ = mean(reshape(CHIRPStsrainySAZ,[3,34])); 
CMAPtsrainySAZ = mean(reshape(CMAPtsrainySAZ,[3,34])); 
BCCCSM2MRtsrainySAZ = mean(reshape(BCCCSM2MRtsrainySAZ,[3,34]));     %MOD HIST FOR SAZ
BCCESM1tsrainySAZ = mean(reshape(BCCESM1tsrainySAZ,[3,34])); 
CanESM5tsrainySAZ = mean(reshape(CanESM5tsrainySAZ,[3,34])); 
CESM2tsrainySAZ	= mean(reshape(CESM2tsrainySAZ,[3,34])); 
CESM2WACCMtsrainySAZ = mean(reshape(CESM2WACCMtsrainySAZ,[3,34])); 
E3SM10tsrainySAZ = mean(reshape(E3SM10tsrainySAZ,[3,34])); 
ECEarth3tsrainySAZ = mean(reshape(ECEarth3tsrainySAZ,[3,34])); 
ECEarth3VegtsrainySAZ = mean(reshape(ECEarth3VegtsrainySAZ,[3,34])); 
GISSE21GtsrainySAZ = mean(reshape(GISSE21GtsrainySAZ,[3,34])); 
GISSE21HtsrainySAZ = mean(reshape(GISSE21HtsrainySAZ,[3,34])); 
MIROC6tsrainySAZ = mean(reshape(MIROC6tsrainySAZ,[3,34])); 
MRIESM20tsrainySAZ = mean(reshape(MRIESM20tsrainySAZ,[3,34])); 
SAM0UNICONtsrainySAZ = mean(reshape(SAM0UNICONtsrainySAZ,[3,34])); 
EnsembleMeantsrainySAZ = mean(reshape(EnsembleMeantsrainySAZ,[3,34])); 


%%%%%%%%%%%   PLOTS   FOR   NAZ/SAZ  DRY/WET SEASONS   %%%%%%%%%%%%%%%%%%
%Evaluate DRY SEASON ONLY Month==6,7,8 (SAZ) Month==7,8,9(NAZ)
%Evaluate RAINY SEASON ONLY Month==12,1,2 (SAZ) Month==3,4,5 (NAZ)
%Plot dry season time series (dsts) 34 years 1981-2014
StartDatemonth = datetime(1981,01,01);
EndDatemotnh = datetime(2014,12,31);
annualtime= StartDate:calyears(1):EndDate;
annualtime2 = datenum(annualtime); 

%Plot dry season and wet season means for each domain
%DRY SEASON NAZ  '[]tsdryNAZ'
figure
plot(annualtime,BCCCSM2MRtsdryNAZ,'-+r')
title('NAZ Dry Season (JAS) Mean Precipitation 1981-2014')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime,BCCESM1tsdryNAZ,'-ok')
hold on
plot(annualtime,CanESM5tsdryNAZ,'-*b')
hold on
plot(annualtime,CESM2tsdryNAZ,'-xk')
hold on
plot(annualtime,CESM2WACCMtsdryNAZ,'-pm')
hold on
plot(annualtime,E3SM10tsdryNAZ,'-*c')
hold on 
plot(annualtime,ECEarth3tsdryNAZ,'--sm')
hold on
plot(annualtime,ECEarth3VegtsdryNAZ,':xk')
hold on
plot(annualtime,GISSE21GtsdryNAZ,'-.og')
hold on
plot(annualtime,GISSE21HtsdryNAZ,':>r')
hold on
plot(annualtime,MIROC6tsdryNAZ,'-hb')
hold on
plot(annualtime,MRIESM20tsdryNAZ,'--pr')
hold on
plot(annualtime,SAM0UNICONtsdryNAZ,'-xb')
hold on
plot(annualtime,EnsembleMeantsdryNAZ,'--*r')
hold on
plot(annualtime,UDELtsdryNAZ,'-.b')
hold on
plot(annualtime,CMAPtsdryNAZ,'-dk')
hold on
plot(annualtime,CHIRPStsdryNAZ,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS',...
    'Location','bestoutside')

%DRY SEASON SAZ  '[]tsdrySAZ'
figure
plot(annualtime,BCCCSM2MRtsdrySAZ,'-+r')
title('SAZ Dry Season (JJA) Mean Precipitation 1981-2014')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime,BCCESM1tsdrySAZ,'-ok')
hold on
plot(annualtime,CanESM5tsdrySAZ,'-*b')
hold on
plot(annualtime,CESM2tsdrySAZ,'-xk')
hold on
plot(annualtime,CESM2WACCMtsdrySAZ,'-pm')
hold on
plot(annualtime,E3SM10tsdrySAZ,'-*c')
hold on 
plot(annualtime,ECEarth3tsdrySAZ,'--sm')
hold on
plot(annualtime,ECEarth3VegtsdrySAZ,':xk')
hold on
plot(annualtime,GISSE21GtsdrySAZ,'-.og')
hold on
plot(annualtime,GISSE21HtsdrySAZ,':>r')
hold on
plot(annualtime,MIROC6tsdrySAZ,'-hb')
hold on
plot(annualtime,MRIESM20tsdrySAZ,'--pr')
hold on
plot(annualtime,SAM0UNICONtsdrySAZ,'-xb')
hold on
plot(annualtime,EnsembleMeantsdrySAZ,'--*r')
hold on
plot(annualtime,UDELtsdrySAZ,'-.b')
hold on
plot(annualtime,CMAPtsdrySAZ,'-dk')
hold on
plot(annualtime,CHIRPStsdrySAZ,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS',...
    'Location','bestoutside')

%WET SEASON SAZ  '[]tsrainySAZ'
figure
plot(annualtime,BCCCSM2MRtsrainySAZ,'-+r')
title('SAZ Rainy Season (DJF) Mean Precipitation 1981-2014')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime,BCCESM1tsrainySAZ,'-ok')
hold on
plot(annualtime,CanESM5tsrainySAZ,'-*b')
hold on
plot(annualtime,CESM2tsrainySAZ,'-xk')
hold on
plot(annualtime,CESM2WACCMtsrainySAZ,'-pm')
hold on
plot(annualtime,E3SM10tsrainySAZ,'-*c')
hold on 
plot(annualtime,ECEarth3tsrainySAZ,'--sm')
hold on
plot(annualtime,ECEarth3VegtsrainySAZ,':xk')
hold on
plot(annualtime,GISSE21GtsrainySAZ,'-.og')
hold on
plot(annualtime,GISSE21HtsrainySAZ,':>r')
hold on
plot(annualtime,MIROC6tsrainySAZ,'-hb')
hold on
plot(annualtime,MRIESM20tsrainySAZ,'--pr')
hold on
plot(annualtime,SAM0UNICONtsrainySAZ,'-xb')
hold on
plot(annualtime,EnsembleMeantsrainySAZ,'--*r')
hold on
plot(annualtime,UDELtsrainySAZ,'-.b')
hold on
plot(annualtime,CMAPtsrainySAZ,'-dk')
hold on
plot(annualtime,CHIRPStsrainySAZ,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS',...
    'Location','bestoutside')


%WET SEASON NAZ  '[]tsrainyNAZ'
figure
plot(annualtime,BCCCSM2MRtsrainyNAZ,'-+r')
title('NAZ Rainy Season (MAM) Mean Precipitation 1981-2014')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime,BCCESM1tsrainyNAZ,'-ok')
hold on
plot(annualtime,CanESM5tsrainyNAZ,'-*b')
hold on
plot(annualtime,CESM2tsrainyNAZ,'-xk')
hold on
plot(annualtime,CESM2WACCMtsrainyNAZ,'-pm')
hold on
plot(annualtime,E3SM10tsrainyNAZ,'-*c')
hold on 
plot(annualtime,ECEarth3tsrainyNAZ,'--sm')
hold on
plot(annualtime,ECEarth3VegtsrainyNAZ,':xk')
hold on
plot(annualtime,GISSE21GtsrainyNAZ,'-.og')
hold on
plot(annualtime,GISSE21HtsrainyNAZ,':>r')
hold on
plot(annualtime,MIROC6tsrainyNAZ,'-hb')
hold on
plot(annualtime,MRIESM20tsrainyNAZ,'--pr')
hold on
plot(annualtime,SAM0UNICONtsrainyNAZ,'-xb')
hold on
plot(annualtime,EnsembleMeantsrainyNAZ,'--*r')
hold on
plot(annualtime,UDELtsrainyNAZ,'-.b')
hold on
plot(annualtime,CMAPtsrainyNAZ,'-dk')
hold on
plot(annualtime,CHIRPStsrainyNAZ,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS',...
    'Location','bestoutside')

%Trends for NAZ/DRY []tsdryNAZ
[tr,p] = trend(BCCCSM2MRtsdryNAZ,annualtime2)
[tr,p] = trend(BCCESM1tsdryNAZ,annualtime2)
[tr,p] = trend(CanESM5tsdryNAZ,annualtime2)
[tr,p] = trend(CESM2tsdryNAZ,annualtime2)
[tr,p] = trend(CESM2WACCMtsdryNAZ,annualtime2)
[tr,p] = trend(E3SM10tsdryNAZ,annualtime2)
[tr,p] = trend(ECEarth3tsdryNAZ,annualtime2)
[tr,p] = trend(ECEarth3VegtsdryNAZ,annualtime2)
[tr,p] = trend(GISSE21GtsdryNAZ,annualtime2)
[tr,p] = trend(GISSE21HtsdryNAZ,annualtime2)
[tr,p] = trend(MIROC6tsdryNAZ,annualtime2)
[tr,p] = trend(MRIESM20tsdryNAZ,annualtime2)
[tr,p] = trend(SAM0UNICONtsdryNAZ,annualtime2)
[tr,p] = trend(UDELtsdryNAZ,annualtime2)
[tr,p] = trend(CMAPtsdryNAZ,annualtime2)
[tr,p] = trend(CHIRPStsdryNAZ,annualtime2)
[tr,p] = trend(EnsembleMeantsdryNAZ,annualtime2)

[h,p]=mann_kendall(BCCCSM2MRtsdryNAZ,0.1)
[H,p_value]=Mann_Kendall(BCCCSM2MRtsdryNAZ,0.05)

%Mean for NAZ/DRY []tsdryNAZ
mean(BCCCSM2MRtsdryNAZ,'all','omitnan')
mean(BCCESM1tsdryNAZ,'all','omitnan')
mean(CanESM5tsdryNAZ,'all','omitnan')
mean(CESM2tsdryNAZ,'all','omitnan')
mean(CESM2WACCMtsdryNAZ,'all','omitnan')
mean(E3SM10tsdryNAZ,'all','omitnan')
mean(ECEarth3tsdryNAZ,'all','omitnan')
mean(ECEarth3VegtsdryNAZ,'all','omitnan')
mean(GISSE21GtsdryNAZ,'all','omitnan')
mean(GISSE21HtsdryNAZ,'all','omitnan')
mean(MIROC6tsdryNAZ,'all','omitnan')
mean(MRIESM20tsdryNAZ,'all','omitnan')
mean(SAM0UNICONtsdryNAZ,'all','omitnan')
mean(UDELtsdryNAZ,'all','omitnan')
mean(CMAPtsdryNAZ,'all','omitnan')
mean(CHIRPStsdryNAZ,'all','omitnan')
mean(EnsembleMeantsdryNAZ,'all','omitnan')

%Std for NAZ/DRY []tsdryNAZ
std(BCCCSM2MRtsdryNAZ,'omitnan')
std(BCCESM1tsdryNAZ,'omitnan')
std(CanESM5tsdryNAZ,'omitnan')
std(CESM2tsdryNAZ,'omitnan')
std(CESM2WACCMtsdryNAZ,'omitnan')
std(E3SM10tsdryNAZ,'omitnan')
std(ECEarth3tsdryNAZ,'omitnan')
std(ECEarth3VegtsdryNAZ,'omitnan')
std(GISSE21GtsdryNAZ,'omitnan')
std(GISSE21HtsdryNAZ,'omitnan')
std(MIROC6tsdryNAZ,'omitnan')
std(MRIESM20tsdryNAZ,'omitnan')
std(SAM0UNICONtsdryNAZ,'omitnan')
std(UDELtsdryNAZ,'omitnan')
std(CMAPtsdryNAZ,'omitnan')
std(CHIRPStsdryNAZ,'omitnan')
std(EnsembleMeantsdryNAZ,'omitnan')

% Bar Plot of mean + std for NAZ DRY season (from excel sheet Dry_Season
% line 44) (and the future line 58)
model_series = [4.57 0; 3.96 0; 4.42 0;1.91 1.24;2.55 0;2.23 1.15;2.25 2.06;2.12 1.94;...
    2.62 0;3.72 2.12;3.55 2.07;1.14 0;1.16 0;3.46 2.89;3.42 3.16;2.81 0];
model_error = [0.56 0; 0.53 0; 0.56 0; 0.29 0.34; 0.39 0; 0.34 0.28; 0.22 0.38; 0.31 0.23;...
    0.27 0; 0.37 0.65; 0.24 0.48; 0.17 0; 0.13 0; 0.62 0.81; 0.48 0.77; 0.32 0;];
figure
b = bar(model_series,'grouped');
ylabel('mm/day')
ylim([0 6])
set(b(1),'DisplayName','Historical',...
    'FaceColor',[0.584313725490196 0.811764705882353 0.909803921568627]);
set(b(2),'DisplayName','SSP585',...
    'FaceColor',[0.92156862745098 0.505882352941176 0.505882352941176]);
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')
title('NAZ Dry Season Variability (JAS)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',model_series,model_error,'k','linestyle','none');
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON'})
xtickangle(45)
hold off;

% Bar Plot of mean + std for SAZ DRY season (from excel sheet Dry_Season
% line 44) (and the future)
model_series = [1.03 0; 1.08 0; 1.11 0;0.93 0.45;0.59 0;0.4 0.3;0.09 0.24;0.06 0.19;...
    0.43 0;1.1 0.59;1.03 0.55;0.36 0;0.29 0;0.29 0.3;0.29 0.21;0.54 0];
model_error = [0.27 0; 0.35 0; 0.27 0; 0.14 0.19; 0.12 0; 0.1 0.1; 0.03 0.13;...
    0.02 0.07; 0.14 0; 0.22 0.21; 0.2 0.12; 0.05 0; 0.03 0; 0.07 0.11; 0.15 0.13; 0.14 0];
figure
b = bar(model_series,'grouped');
ylabel('mm/day')
ylim([0 6])
set(b(1),'DisplayName','Historical',...
    'FaceColor',[0.584313725490196 0.811764705882353 0.909803921568627]);
set(b(2),'DisplayName','SSP585',...
    'FaceColor',[0.92156862745098 0.505882352941176 0.505882352941176]);
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')
title('SAZ Dry Season Variability (JJA)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',model_series,model_error,'k','linestyle','none');
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON'})
xtickangle(45)
hold off;

% Bar Plot of mean + std for NAZ WET season (from excel sheet Wet_Season)(and the future)
model_series = [9.81 0; 8.92 0; 9.39 0;3.73 2.42;5.53 0;6.78 5.73;9.63 7.90;9.65 8.07;...
    5.25 0;5.43 6.79;5.61 6.56;6.65 0;5.8 0;9.34 9.64;10.7 10.31;7.69 0];
model_error = [0.94 0; 1.03 0; 0.96 0;0.48 0.89;0.47 0;0.88 0.68;0.76 1.03;0.75 0.93;...
    0.66 0; 0.61 1.23; 0.57 0.74;0.73 0;0.55 0;0.46 0.77;0.63 0.73;1.09 0];
figure
b = bar(model_series,'grouped');
ylabel('mm/day')
ylim([0 15])
set(b(1),'DisplayName','Historical',...
    'FaceColor',[0.584313725490196 0.811764705882353 0.909803921568627]);
set(b(2),'DisplayName','SSP585',...
    'FaceColor',[0.92156862745098 0.505882352941176 0.505882352941176]);
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')
title('NAZ Wet Season Variability (MAM)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',model_series,model_error,'k','linestyle','none');
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON'})
xtickangle(45)
hold off;

% Bar Plot of mean + std for SAZ WET season (from excel sheet Wet_Season)(and the future)
model_series = [10 0; 9.18 0; 9.81 0;10.07 9.07;9.16 0;7.99 6.65;10.47 8.42;10.54 8.78;...
    9.57 0;9.59 9.3;9.7 9.21;7.26 0;6.24 0;11.71 11.88;13.12 13.82;8.31 0];
model_error = [0.64 0; 0.91 0; 0.72 0;0.54 0.89;0.51 0;0.72 0.68;0.5 1.03;0.55 0.93;...
    0.48 0;0.33 1.23;0.39 0.74;0.66 0;0.63 0;0.58 0.77;0.43 0.73;0.67 0];
figure
b = bar(model_series,'grouped');
ylabel('mm/day')
ylim([0 15])
set(b(1),'DisplayName','Historical',...
    'FaceColor',[0.584313725490196 0.811764705882353 0.909803921568627]);
set(b(2),'DisplayName','SSP585',...
    'FaceColor',[0.92156862745098 0.505882352941176 0.505882352941176]);
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')
title('SAZ Wet Season Variability (DJF)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',model_series,model_error,'k','linestyle','none');
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON'})
xtickangle(45)
hold off;

% BOX CHARTS need R2020b

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% CDF of Ensemble NAZ dry time series 'tsdryNAZ'
figure
cdfplot(EnsembleMeantsdryNAZ)
hold on
x = linspace(min(EnsembleMeantsdryNAZ),max(EnsembleMeantsdryNAZ));
plot(x,evcdf(x))
legend('Empirical CDF','Theoretical CDF','Location','best')
hold off

%NAZ dry
figure
ecdf(EnsembleMeantsdryNAZ)
title('NAZ Dry Season ECDF (JAS)','fontSize',12);
hold on
ecdf(EnsembleMeantsdryNAZ585)
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')

%NAZ wet
figure
ecdf(EnsembleMeantsrainyNAZ)
title('NAZ Wet Season ECDF (MAM)','fontSize',12);
hold on
ecdf(EnsembleMeantsrainyNAZ585)
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')

%SAZ dry
figure
ecdf(EnsembleMeantsdrySAZ)
title('SAZ Dry Season ECDF (JJA)','fontSize',12);
hold on
ecdf(EnsembleMeantsdrySAZ585)
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')

%SAZ wet
figure
ecdf(EnsembleMeantsrainySAZ)
title('SAZ Wet Season ECDF (DJF)','fontSize',12);
hold on
ecdf(EnsembleMeantsrainySAZ585)
legend('Historical','SSP585','Fontsize',10,'Location','northeastoutside')

%Trends for SAZ/DRY []tsdrySAZ
[tr,p] = trend(BCCCSM2MRtsdrySAZ,annualtime2)
[tr,p] = trend(BCCESM1tsdrySAZ,annualtime2)
[tr,p] = trend(CanESM5tsdrySAZ,annualtime2)
[tr,p] = trend(CESM2tsdrySAZ,annualtime2)
[tr,p] = trend(CESM2WACCMtsdrySAZ,annualtime2)
[tr,p] = trend(E3SM10tsdrySAZ,annualtime2)
[tr,p] = trend(ECEarth3tsdrySAZ,annualtime2)
[tr,p] = trend(ECEarth3VegtsdrySAZ,annualtime2)
[tr,p] = trend(GISSE21GtsdrySAZ,annualtime2)
[tr,p] = trend(GISSE21HtsdrySAZ,annualtime2)
[tr,p] = trend(MIROC6tsdrySAZ,annualtime2)
[tr,p] = trend(MRIESM20tsdrySAZ,annualtime2)
[tr,p] = trend(SAM0UNICONtsdrySAZ,annualtime2)
[tr,p] = trend(UDELtsdrySAZ,annualtime2)
[tr,p] = trend(CMAPtsdrySAZ,annualtime2)
[tr,p] = trend(CHIRPStsdrySAZ,annualtime2)
[tr,p] = trend(EnsembleMeantsdrySAZ,annualtime2)

%Mean for SAZ/DRY []tsdrySAZ
mean(BCCCSM2MRtsdrySAZ,'all','omitnan')
mean(BCCESM1tsdrySAZ,'all','omitnan')
mean(CanESM5tsdrySAZ,'all','omitnan')
mean(CESM2tsdrySAZ,'all','omitnan')
mean(CESM2WACCMtsdrySAZ,'all','omitnan')
mean(E3SM10tsdrySAZ,'all','omitnan')
mean(ECEarth3tsdrySAZ,'all','omitnan')
mean(ECEarth3VegtsdrySAZ,'all','omitnan')
mean(GISSE21GtsdrySAZ,'all','omitnan')
mean(GISSE21HtsdrySAZ,'all','omitnan')
mean(MIROC6tsdrySAZ,'all','omitnan')
mean(MRIESM20tsdrySAZ,'all','omitnan')
mean(SAM0UNICONtsdrySAZ,'all','omitnan')
mean(UDELtsdrySAZ,'all','omitnan')
mean(CMAPtsdrySAZ,'all','omitnan')
mean(CHIRPStsdrySAZ,'all','omitnan')
mean(EnsembleMeantsdrySAZ,'all','omitnan')

%Std for SAZ/DRY []tsdrySAZ
std(BCCCSM2MRtsdrySAZ,'omitnan')
std(BCCESM1tsdrySAZ,'omitnan')
std(CanESM5tsdrySAZ,'omitnan')
std(CESM2tsdrySAZ,'omitnan')
std(CESM2WACCMtsdrySAZ,'omitnan')
std(E3SM10tsdrySAZ,'omitnan')
std(ECEarth3tsdrySAZ,'omitnan')
std(ECEarth3VegtsdrySAZ,'omitnan')
std(GISSE21GtsdrySAZ,'omitnan')
std(GISSE21HtsdrySAZ,'omitnan')
std(MIROC6tsdrySAZ,'omitnan')
std(MRIESM20tsdrySAZ,'omitnan')
std(SAM0UNICONtsdrySAZ,'omitnan')
std(UDELtsdrySAZ,'omitnan')
std(CMAPtsdrySAZ,'omitnan')
std(CHIRPStsdrySAZ,'omitnan')
std(EnsembleMeantsdrySAZ,'omitnan')

%Trends for SAZ/WET []tsrainySAZ
[tr,p] = trend(BCCCSM2MRtsrainySAZ,annualtime2)
[tr,p] = trend(BCCESM1tsrainySAZ,annualtime2)
[tr,p] = trend(CanESM5tsrainySAZ,annualtime2)
[tr,p] = trend(CESM2tsrainySAZ,annualtime2)
[tr,p] = trend(CESM2WACCMtsrainySAZ,annualtime2)
[tr,p] = trend(E3SM10tsrainySAZ,annualtime2)
[tr,p] = trend(ECEarth3tsrainySAZ,annualtime2)
[tr,p] = trend(ECEarth3VegtsrainySAZ,annualtime2)
[tr,p] = trend(GISSE21GtsrainySAZ,annualtime2)
[tr,p] = trend(GISSE21HtsrainySAZ,annualtime2)
[tr,p] = trend(MIROC6tsrainySAZ,annualtime2)
[tr,p] = trend(MRIESM20tsrainySAZ,annualtime2)
[tr,p] = trend(SAM0UNICONtsrainySAZ,annualtime2)
[tr,p] = trend(UDELtsrainySAZ,annualtime2)
[tr,p] = trend(CMAPtsrainySAZ,annualtime2)
[tr,p] = trend(CHIRPStsrainySAZ,annualtime2)
[tr,p] = trend(EnsembleMeantsrainySAZ,annualtime2)

%Mean for SAZ/WET []tsrainySAZ
mean(BCCCSM2MRtsrainySAZ,'all','omitnan')
mean(BCCESM1tsrainySAZ,'all','omitnan')
mean(CanESM5tsrainySAZ,'all','omitnan')
mean(CESM2tsrainySAZ,'all','omitnan')
mean(CESM2WACCMtsrainySAZ,'all','omitnan')
mean(E3SM10tsrainySAZ,'all','omitnan')
mean(ECEarth3tsrainySAZ,'all','omitnan')
mean(ECEarth3VegtsrainySAZ,'all','omitnan')
mean(GISSE21GtsrainySAZ,'all','omitnan')
mean(GISSE21HtsrainySAZ,'all','omitnan')
mean(MIROC6tsrainySAZ,'all','omitnan')
mean(MRIESM20tsrainySAZ,'all','omitnan')
mean(SAM0UNICONtsrainySAZ,'all','omitnan')
mean(UDELtsrainySAZ,'all','omitnan')
mean(CMAPtsrainySAZ,'all','omitnan')
mean(CHIRPStsrainySAZ,'all','omitnan')
mean(EnsembleMeantsrainySAZ,'all','omitnan')

%Std for SAZ/rainy []tsrainySAZ
std(BCCCSM2MRtsrainySAZ,'omitnan')
std(BCCESM1tsrainySAZ,'omitnan')
std(CanESM5tsrainySAZ,'omitnan')
std(CESM2tsrainySAZ,'omitnan')
std(CESM2WACCMtsrainySAZ,'omitnan')
std(E3SM10tsrainySAZ,'omitnan')
std(ECEarth3tsrainySAZ,'omitnan')
std(ECEarth3VegtsrainySAZ,'omitnan')
std(GISSE21GtsrainySAZ,'omitnan')
std(GISSE21HtsrainySAZ,'omitnan')
std(MIROC6tsrainySAZ,'omitnan')
std(MRIESM20tsrainySAZ,'omitnan')
std(SAM0UNICONtsrainySAZ,'omitnan')
std(UDELtsrainySAZ,'omitnan')
std(CMAPtsrainySAZ,'omitnan')
std(CHIRPStsrainySAZ,'omitnan')
std(EnsembleMeantsrainySAZ,'omitnan')

%Trends for NAZ/WET []tsrainyNAZ
[tr,p] = trend(BCCCSM2MRtsrainyNAZ,annualtime2)
[tr,p] = trend(BCCESM1tsrainyNAZ,annualtime2)
[tr,p] = trend(CanESM5tsrainyNAZ,annualtime2)
[tr,p] = trend(CESM2tsrainyNAZ,annualtime2)
[tr,p] = trend(CESM2WACCMtsrainyNAZ,annualtime2)
[tr,p] = trend(E3SM10tsrainyNAZ,annualtime2)
[tr,p] = trend(ECEarth3tsrainyNAZ,annualtime2)
[tr,p] = trend(ECEarth3VegtsrainyNAZ,annualtime2)
[tr,p] = trend(GISSE21GtsrainyNAZ,annualtime2)
[tr,p] = trend(GISSE21HtsrainyNAZ,annualtime2)
[tr,p] = trend(MIROC6tsrainyNAZ,annualtime2)
[tr,p] = trend(MRIESM20tsrainyNAZ,annualtime2)
[tr,p] = trend(SAM0UNICONtsrainyNAZ,annualtime2)
[tr,p] = trend(UDELtsrainyNAZ,annualtime2)
[tr,p] = trend(CMAPtsrainyNAZ,annualtime2)
[tr,p] = trend(CHIRPStsrainyNAZ,annualtime2)
[tr,p] = trend(EnsembleMeantsrainyNAZ,annualtime2)

%Mean for NAZ/WET []tsrainyNAZ
mean(BCCCSM2MRtsrainyNAZ,'all','omitnan')
mean(BCCESM1tsrainyNAZ,'all','omitnan')
mean(CanESM5tsrainyNAZ,'all','omitnan')
mean(CESM2tsrainyNAZ,'all','omitnan')
mean(CESM2WACCMtsrainyNAZ,'all','omitnan')
mean(E3SM10tsrainyNAZ,'all','omitnan')
mean(ECEarth3tsrainyNAZ,'all','omitnan')
mean(ECEarth3VegtsrainyNAZ,'all','omitnan')
mean(GISSE21GtsrainyNAZ,'all','omitnan')
mean(GISSE21HtsrainyNAZ,'all','omitnan')
mean(MIROC6tsrainyNAZ,'all','omitnan')
mean(MRIESM20tsrainyNAZ,'all','omitnan')
mean(SAM0UNICONtsrainyNAZ,'all','omitnan')
mean(UDELtsrainyNAZ,'all','omitnan')
mean(CMAPtsrainyNAZ,'all','omitnan')
mean(CHIRPStsrainyNAZ,'all','omitnan')
mean(EnsembleMeantsrainyNAZ,'all','omitnan')

%Std for NAZ/rainy []tsrainyNAZ
std(BCCCSM2MRtsrainyNAZ,'omitnan')
std(BCCESM1tsrainyNAZ,'omitnan')
std(CanESM5tsrainyNAZ,'omitnan')
std(CESM2tsrainyNAZ,'omitnan')
std(CESM2WACCMtsrainyNAZ,'omitnan')
std(E3SM10tsrainyNAZ,'omitnan')
std(ECEarth3tsrainyNAZ,'omitnan')
std(ECEarth3VegtsrainyNAZ,'omitnan')
std(GISSE21GtsrainyNAZ,'omitnan')
std(GISSE21HtsrainyNAZ,'omitnan')
std(MIROC6tsrainyNAZ,'omitnan')
std(MRIESM20tsrainyNAZ,'omitnan')
std(SAM0UNICONtsrainyNAZ,'omitnan')
std(UDELtsrainyNAZ,'omitnan')
std(CMAPtsrainyNAZ,'omitnan')
std(CHIRPStsrainyNAZ,'omitnan')
std(EnsembleMeantsrainyNAZ,'omitnan')

%plot 2D trends in DRY/WET precip
% drySAZ is JJA
% rainySAZ is DJF
%p value <0.1 = 90% chance that it is not by chance
% BCCCSM2MRcdrySAZ	
% BCCESM1cdrySAZ 	
% CanESM5cdrySAZ 
% CESM2cdrySAZ 		
% CESM2WACCMcdrySAZ 	
% E3SM10cdrySAZ	
% ECEarth3cdrySAZ
% ECEarth3VegcdrySAZ
% GISSE21GcdrySAZ 
% GISSE21HcdrySAZ
% MIROC6cdrySAZ 
% MRIESM20cdrySAZ 
% SAM0UNICONcdrySAZ
% CHIRPScdrySAZ
% CMAPcdrySAZ
% UDELcdrySAZ
[tr,p] = trend(UDELcdrySAZ,3,'omitnan');

StatisticallySignificant = p<0.1;
[Lon,Lat] = meshgrid(lon2,lat);

figure
%imagescn(lon2,lat,tr*12)   %multiply by 365 for annual trend (12 for UDEL/CHIRPS)
contourf(lon2,lat,tr*365,'--','edgecolor','none')  %'edgecolor','none'
cb = colorbar;
ylabel(cb,'Precipitation trend mm year^{-1}')
%cmocean('tarn')   %-balance
cmocean('-balance') 
xlim([-75 -43])
ylim([-20 7])
caxis([-20 20])
hold on
stipple(Lon,Lat,StatisticallySignificant)

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%  FUTURE  WET/DRY SEASON  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fds = fileDatastore('.\Final_Files\*c585.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

[Lon,Lat] = meshgrid(lon,lat);
lon2 = lon-360;   %adjust lon

mask = geomask(Lat,Lon,[-18 6],[-76 -42]);  %just a square around Brazilian Amazon
NAZmask = geomask(Lat,Lon,[-5 5],[-70 -50]);
SAZmask = geomask(Lat,Lon,[-15.5 -5],[-70 -50]);

figure
imagescn(lon2,lat,SAZmask)   %just for box mask
axis xy tight
title 'Southern Amazon mask'
xlabel 'longitude'
ylabel 'latitude'
ax = axis;
borders('countries')
axis(ax)

StartDate585 = datetime(2050,01,01,"Format","MMM-uuuu");  %for each dataset create time vector
EndDate585 = datetime(2100,12,31,"Format","MMM-uuuu");
dates585 = StartDate585:calmonths(1):EndDate585;
modtimeColumn585 = dates585.';
modtime585 = datenum(dates585');

%modtime 4 is for stacked future ensemble mean
StartDate4 = datetime(2050,01,01); 
EndDate4 = datetime(2457,12,31);
modtime4= StartDate4:calmonths(1):EndDate4;
modtimeColumn4 = modtime4.';
modtime4 = datenum(modtime4');

%THIS IS TO EXTRACT DRY/RAINY SEASON from future 585
%Evaluate DRY SEASON ONLY Month==6,7,8 (SAZ) Month==7,8,9(NAZ)
%Evaluate RAINY SEASON ONLY Month==12,1,2 (SAZ) Month==3,4,5 (NAZ)
NAZrainySEASON585 = month(dates585) == 3 | month(dates585) == 4 | month(dates585) == 5;
SAZrainySEASON585 = month(dates585) == 1 | month(dates585) == 2 | month(dates585) == 12;
NAZdrySEASON585 =  month(dates585) == 7 | month(dates585) == 8 | month(dates585) == 9;
SAZdrySEASON585 =  month(dates585) == 6 | month(dates585) == 7 | month(dates585) == 8;

% Extract dry season data from NAZ 585
BCCCSM2MRcdryNAZ585 = BCCCSM2MRc585(:,:,NAZdrySEASON585);    %MOD 585 FOR NAZ
CanESM5cdryNAZ585 = CanESM5c585(:,:,NAZdrySEASON585);
CESM2cdryNAZ585 = CESM2c585(:,:,NAZdrySEASON585);
CESM2WACCMcdryNAZ585 = CESM2WACCMc585(:,:,NAZdrySEASON585);
ECEarth3cdryNAZ585 = ECEarth3c585(:,:,NAZdrySEASON585);
ECEarth3VegcdryNAZ585 = ECEarth3Vegc585(:,:,NAZdrySEASON585);
MIROC6cdryNAZ585 = MIROC6c585(:,:,NAZdrySEASON585);
MRIESM20cdryNAZ585 = MRIESM20c585(:,:,NAZdrySEASON585);


% Extract dry season data from SAZ - represents austral winter JJA 585
BCCCSM2MRcdrySAZ585 = BCCCSM2MRc585(:,:,SAZdrySEASON585);    %MOD 585 FOR SAZ
CanESM5cdrySAZ585 = CanESM5c585(:,:,SAZdrySEASON585);
CESM2cdrySAZ585 = CESM2c585(:,:,SAZdrySEASON585);
CESM2WACCMcdrySAZ585 = CESM2WACCMc585(:,:,SAZdrySEASON585);
ECEarth3cdrySAZ585 = ECEarth3c585(:,:,SAZdrySEASON585);
ECEarth3VegcdrySAZ585 = ECEarth3Vegc585(:,:,SAZdrySEASON585);
MIROC6cdrySAZ585 = MIROC6c585(:,:,SAZdrySEASON585);
MRIESM20cdrySAZ585 = MRIESM20c585(:,:,SAZdrySEASON585);

Ensembleplot8585 = cat(3,BCCCSM2MRc585,CanESM5c585,CESM2WACCMc585,...
    CESM2WACCMc585,ECEarth3c585,ECEarth3Vegc585,MIROC6c585,...
    MRIESM20c585);
EnsemblecdrySAZ585 = monthly(Ensembleplot8585,modtime4,6:8,@mean);

% Extract wet season data from NAZ 585
BCCCSM2MRcrainyNAZ585 = BCCCSM2MRc585(:,:,NAZrainySEASON585);    %MOD FUT FOR NAZ
CanESM5crainyNAZ585 = CanESM5c585(:,:,NAZrainySEASON585);
CESM2crainyNAZ585 = CESM2c585(:,:,NAZrainySEASON585);
CESM2WACCMcrainyNAZ585 = CESM2WACCMc585(:,:,NAZrainySEASON585);
ECEarth3crainyNAZ585 = ECEarth3c585(:,:,NAZrainySEASON585);
ECEarth3VegcrainyNAZ585 = ECEarth3Vegc585(:,:,NAZrainySEASON585);
MIROC6crainyNAZ585 = MIROC6c585(:,:,NAZrainySEASON585);
MRIESM20crainyNAZ585 = MRIESM20c585(:,:,NAZrainySEASON585);


% Extract wet season data from SAZ 585
BCCCSM2MRcrainySAZ585 = BCCCSM2MRc585(:,:,SAZrainySEASON585);    %MOD 585 FOR SAZ
CanESM5crainySAZ585 = CanESM5c585(:,:,SAZrainySEASON585);
CESM2crainySAZ585 = CESM2c585(:,:,SAZrainySEASON585);
CESM2WACCMcrainySAZ585 = CESM2WACCMc585(:,:,SAZrainySEASON585);
ECEarth3crainySAZ585 = ECEarth3c585(:,:,SAZrainySEASON585);
ECEarth3VegcrainySAZ585 = ECEarth3Vegc585(:,:,SAZrainySEASON585);
MIROC6crainySAZ585 = MIROC6c585(:,:,SAZrainySEASON585);
MRIESM20crainySAZ585 = MRIESM20c585(:,:,SAZrainySEASON585);

nt585=153;  %new time vector

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%This is the entire FUTURE (no seasonality & no MASKS)
BCCCSM2MRts585 = local(BCCCSM2MRc585,mask,'omitnan');     %MOD 585
CanESM5ts585 = local(CanESM5c585,mask,'omitnan');
CESM2ts585 = local(CESM2c585,mask,'omitnan');
CESM2WACCMts585 = local(CESM2WACCMc585,mask,'omitnan');
ECEarth3ts585 = local(ECEarth3c585,mask,'omitnan');
ECEarth3Vegts585 = local(ECEarth3Vegc585,mask,'omitnan');
MIROC6ts585 = local(MIROC6c585,mask,'omitnan');
MRIESM20ts585 = local(MRIESM20c585,mask,'omitnan');

Ensemblets585 = [BCCCSM2MRts585,CanESM5ts585,CESM2ts585,CESM2WACCMts585,ECEarth3ts585,...
    ECEarth3Vegts585,MIROC6ts585,MRIESM20ts585];
EnsembleMeants585 = mean(Ensemblets585,2);  %calc Ensemble 585 mean (keep rows)

%%%%%  Okay, stop here (after Ensemblets585) 
%because now you have the Ensemble mean with all data
%%I want to create a plot with this data


%to reshape you must invert  MOD 585 whole domain ts
BCCCSM2MRts585 = BCCCSM2MRts585';     %MOD 585 whole domain
CanESM5ts585 = CanESM5ts585';
CESM2ts585 = CESM2ts585';
CESM2WACCMts585	= CESM2WACCMts585';
ECEarth3ts585 = ECEarth3ts585';
ECEarth3Vegts585Z = ECEarth3Vegts585';
MIROC6ts585 = MIROC6ts585';
MRIESM20ts585 = MRIESM20ts585';
EnsembleMeants585 = EnsembleMeants585';


%average every 12 element in time series to get annual average
%MOD 585 whole domain ts
BCCCSM2MRts585 = mean(reshape(BCCCSM2MRts585,[12,51]));   %MOD 585 whole domain
CanESM5ts585  = mean(reshape(CanESM5ts585 ,[12,51])); 
CESM2ts585 = mean(reshape(CESM2ts585,[12,51])); 
CESM2WACCMts585 = mean(reshape(CESM2WACCMts585,[12,51])); 
ECEarth3ts585 = mean(reshape(ECEarth3ts585,[12,51])); 
ECEarth3Vegts585= mean(reshape(ECEarth3Vegts585Z,[12,51])); 
MIROC6ts585	= mean(reshape(MIROC6ts585,[12,51])); 
MRIESM20ts585 = mean(reshape(MRIESM20ts585,[12,51])); 
EnsembleMeants585 = mean(reshape(EnsembleMeants585,[12,51])); 

%%%%%%%%%%%%%%%     Rondonia mask EnsembleMean %%%%%%%%%%%%%%%%%%%%%%%%%%%
%   'Rondoniamask'
BCCCSM2MRts585Rondonia = local(BCCCSM2MRc585,Rondoniamask,'omitnan');     %MOD 585
CanESM5ts585Rondonia = local(CanESM5c585,Rondoniamask,'omitnan');
CESM2ts585Rondonia = local(CESM2c585,Rondoniamask,'omitnan');
CESM2WACCMts585Rondonia = local(CESM2WACCMc585,Rondoniamask,'omitnan');
ECEarth3ts585Rondonia = local(ECEarth3c585,Rondoniamask,'omitnan');
ECEarth3Vegts585Rondonia = local(ECEarth3Vegc585,Rondoniamask,'omitnan');
MIROC6ts585Rondonia = local(MIROC6c585,Rondoniamask,'omitnan');
MRIESM20ts585Rondonia = local(MRIESM20c585,Rondoniamask,'omitnan');

Ensemblets585Rondonia = [BCCCSM2MRts585Rondonia,CanESM5ts585Rondonia,CESM2ts585Rondonia,CESM2WACCMts585Rondonia,ECEarth3ts585Rondonia,...
    ECEarth3Vegts585Rondonia,MIROC6ts585Rondonia,MRIESM20ts585Rondonia];
EnsembleMeants585Rondonia = mean(Ensemblets585Rondonia,2);  %calc Ensemble 585 mean (keep rows)

EnsembleMeants585Rondonia = EnsembleMeants585Rondonia';
EnsembleMeants585Rondonia = mean(reshape(EnsembleMeants585Rondonia,[12,51])); 

%Create plot for annual time series for whole domain
%ribbon plot of ensemble mean
StartDatemonth585 = datetime(2050,01,01);
EndDatemonth585 = datetime(2100,12,31);
annualtime585= StartDatemonth585:calyears(1):EndDatemonth585;
annualtime585v2 = datenum(annualtime585); 

figure
plot(annualtime585,BCCCSM2MRts585,'-+r')
title('Annual Mean Precipitation 2050-2100')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime585,CanESM5ts585,'-ok')
hold on
plot(annualtime585,CESM2ts585,'-*b')
hold on
plot(annualtime585,CESM2WACCMts585,'-xk')
hold on
plot(annualtime585,ECEarth3ts585,'-pm')
hold on
plot(annualtime585,ECEarth3Vegts585,'-*c')
hold on 
plot(annualtime585,MIROC6ts585,'--sm')
hold on
plot(annualtime585,MRIESM20ts585,'-dk')
hold on
plot(annualtime585,EnsembleMeants585,'-sm')
legend('BCCCSM2MR585','CanESM5585','CESM2585','CESM2WACCM585',...
   'ECEarth3585','ECEarth3Veg585','MIROC6585','MRIESM20585',...
   'Ensemble Mean585',...
    'Location','bestoutside')

lag = 9;
annualtime585v2 = datenum(annualtime585); 
[tr,p] = trend(EnsembleMeants585,annualtime585v2)

CanESM5ts585smooth = smooth(CanESM5ts585)';
MRIESM20ts585smooth = smooth(MRIESM20ts585)';
EnsembleMeants585smooth = smooth(EnsembleMeants585)';

% VERSION 1: top/bottom bounds
figure
plot(annualtime585,CanESM5ts585,'Color',[0, 0.4470, 0.7410],'linewidth',2)
%plot(annualtime585,movavg(CanESM5ts585,'simple',lag),'-k','linewidth',2)
title('Annual Mean Precipitation 2050-2100')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on
plot(annualtime585,MRIESM20ts585,'Color',[0.4660, 0.6740, 0.1880],'linewidth',2)
x2 = [annualtime585, fliplr(annualtime585)];
inBetween = [CanESM5ts585, fliplr(MRIESM20ts585)];
fill(x2, inBetween,'k');
hold on
plot(annualtime585,EnsembleMeants585,'k','linewidth',3)
hold on
polyplot(annualtime585,EnsembleMeants585,1,'r','linewidth',1)
legend('Lower Limit','Upper Limit','Possible Range',...
    'Mean','Trend Line',...
    'Location','bestoutside')
hold off
alpha(.2)

% VERSION 2: just range(blue with no edgecolor)
figure
plot(annualtime585,EnsembleMeants585,'k','linewidth',3)
title('Annual Mean Precipitation 2050-2100')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on
x2 = [annualtime585, fliplr(annualtime585)];
inBetween = [CanESM5ts585, fliplr(MRIESM20ts585)];
fill(x2, inBetween,'b','edgecolor','none');
hold on
hold on
polyplot(annualtime585,EnsembleMeants585,1,'r','linewidth',1)
legend('Mean','Possible Range','Trend Line',...
    'Location','bestoutside')
hold off
alpha(.1)

% VERSION 3: just range(blue with no edgecolor) + polyfit with error
figure
plot(annualtime585v2,EnsembleMeants585Rondonia,'k','linewidth',3)
title('Annual Mean Precipitation 2050-2100')
xlabel('Year')
ylabel('Precipitation (mm/day)')
grid
hold on
[p,S] = polyfit(annualtime585v2,EnsembleMeants585Rondonia,1)
[y_fit,delta] = polyval(p,annualtime585v2,S);
plot(annualtime585v2,y_fit,'r-')
plot(annualtime585v2,y_fit+2*delta,'m--',annualtime585v2,y_fit-2*delta,'m--')
legend('EnsembleMean','Linear Fit','95% Prediction Interval',...
    'Location','bestoutside')
hold off
alpha(.1)

%version 4: with standard deviation fill for EnsembleMeants585
%Either EnsembleMeants585 or 'EnsembleMeants585Rondonia'
lag = 9;
annualtime585v2 = datenum(annualtime585); 
[tr,p] = trend(EnsembleMeants585Rondonia,annualtime585v2)
EnsembleMeants585smooth = smooth(EnsembleMeants585Rondonia)';
%trend is -1.4552-05 p= 0.00004
%trend is -2.2107e-05 p= 0.0000
%trend line
xx = [1 51];   %[1 51]; for both
yy = [5.11345 4.70974];    %[4.85721 4.59147]; for BrazAmazon [5.11345 4.70974]; for Rondonia

y = EnsembleMeants585Rondonia;  %switch variable names
x = 1:numel(y);
t = [2050:2100];
std_dev = 0.5;
curve1 = y + std_dev;
curve2 = y - std_dev;

figure
plot(t,y,'linewidth',1)
title('Annual Mean Precipitation Rondonia [mm/day]')   %change title
xlabel('Year')
ylabel('Precipitation (mm/day)')
x2 = [x,fliplr(x)];
inBetween = [curve1,fliplr(curve2)];
fill(x2,inBetween,'b','edgecolor','none','facealpha',.2);
hold on;
plot(x,y,'k','LineWidth',2);
hold on
plot(xx,yy,'r','LineWidth',1.5)
legend('SD','Ensemble Mean','Trend Line',...
    'Location','bestoutside')
xlim([0 51])
text(10,4.2,'trend = -2.2e-05 p=0.0000')   %change trend and p-value
xticks([1 26 51])
xticklabels({'2050','2075','2100'})
%grid on

%%%%%%%%%%%%%%%%%     HISTOGRAM   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%% Ensemble Mean 2051-2100 histogram w/historical and future
%Calculate future ensmean (above) and historic ensmean (line1682 'EnsembleMeants8mod')

%This is the entire FUTURE (no seasonality & no MASKS)
BCCCSM2MRts585 = local(BCCCSM2MRc585,mask,'omitnan');     %MOD 585
CanESM5ts585 = local(CanESM5c585,mask,'omitnan');
CESM2ts585 = local(CESM2c585,mask,'omitnan');
CESM2WACCMts585 = local(CESM2WACCMc585,mask,'omitnan');
ECEarth3ts585 = local(ECEarth3c585,mask,'omitnan');
ECEarth3Vegts585 = local(ECEarth3Vegc585,mask,'omitnan');
MIROC6ts585 = local(MIROC6c585,mask,'omitnan');
MRIESM20ts585 = local(MRIESM20c585,mask,'omitnan');

BCCCSM2MRts585 = BCCCSM2MRts585';     %MOD 585 whole domain
CanESM5ts585 = CanESM5ts585';
CESM2ts585 = CESM2ts585';
CESM2WACCMts585	= CESM2WACCMts585';
ECEarth3ts585 = ECEarth3ts585';
ECEarth3Vegts585Z = ECEarth3Vegts585';
MIROC6ts585 = MIROC6ts585';
MRIESM20ts585 = MRIESM20ts585';
%average every 12 element in time series to get annual average
%MOD 585 whole domain ts
BCCCSM2MRts585 = mean(reshape(BCCCSM2MRts585,[12,51]));   %MOD 585 whole domain
CanESM5ts585  = mean(reshape(CanESM5ts585 ,[12,51])); 
CESM2ts585 = mean(reshape(CESM2ts585,[12,51])); 
CESM2WACCMts585 = mean(reshape(CESM2WACCMts585,[12,51])); 
ECEarth3ts585 = mean(reshape(ECEarth3ts585,[12,51])); 
ECEarth3Vegts585= mean(reshape(ECEarth3Vegts585Z,[12,51])); 
MIROC6ts585	= mean(reshape(MIROC6ts585,[12,51])); 
MRIESM20ts585 = mean(reshape(MRIESM20ts585,[12,51])); 

Ensemblets585 = [BCCCSM2MRts585',CanESM5ts585',CESM2ts585',CESM2WACCMts585',ECEarth3ts585',...
    ECEarth3Vegts585',MIROC6ts585',MRIESM20ts585'];
EnsembleMeants585 = mean(Ensemblets585,2);  %calc Ensemble 585 mean (keep rows)

%%%%% Historical ensemble mean
Ensemblets8mod = [BCCCSM2MRts,CanESM5ts,CESM2ts,CESM2WACCMts,...
    ECEarth3ts,ECEarth3Vegts,MIROC6ts,MRIESM20ts];
EnsembleMeants8mod = mean(Ensemblets8mod,2); 
EnsembleMeants8mod = EnsembleMeants8mod';  %make hist annual ts
EnsembleMeants8mod = mean(reshape(EnsembleMeants8mod,[12,34])); 

figure  %annual hist/585 historgram
h1=histogram(EnsembleMeants8mod,'Normalization','probability','FaceColor','#4DBEEE','EdgeColor','none');
title('Annual Ensemble Mean Precipitation [probability%]')
hold on
h2=histogram(EnsembleMeants585,'Normalization','probability','FaceColor','#EDB120','EdgeColor','none')
legend('EnsembleMean 1981-2014','EnsembleMean 2051-2100',...
    'Location','bestoutside')
%ylim([0 20])


%Histogram with monthly values!!!! Not annual (like above)
Ensemblets8mod = [BCCCSM2MRts,CanESM5ts,CESM2ts,CESM2WACCMts,...
    ECEarth3ts,ECEarth3Vegts,MIROC6ts,MRIESM20ts];
EnsembleMeants8mod = mean(Ensemblets8mod,2); 

BCCCSM2MRts585 = local(BCCCSM2MRc585,mask,'omitnan');     %MOD 585
CanESM5ts585 = local(CanESM5c585,mask,'omitnan');
CESM2ts585 = local(CESM2c585,mask,'omitnan');
CESM2WACCMts585 = local(CESM2WACCMc585,mask,'omitnan');
ECEarth3ts585 = local(ECEarth3c585,mask,'omitnan');
ECEarth3Vegts585 = local(ECEarth3Vegc585,mask,'omitnan');
MIROC6ts585 = local(MIROC6c585,mask,'omitnan');
MRIESM20ts585 = local(MRIESM20c585,mask,'omitnan');

Ensemblets585 = [BCCCSM2MRts585,CanESM5ts585,CESM2ts585,CESM2WACCMts585,ECEarth3ts585,...
    ECEarth3Vegts585,MIROC6ts585,MRIESM20ts585];
EnsembleMeants585 = mean(Ensemblets585,2);

[values, edges] = histcounts(EnsembleMeants8mod, 'Normalization', 'probability');
centers = (edges(1:end-1)+edges(2:end))/2;
[values2, edges2] = histcounts(EnsembleMeants585, 'Normalization', 'probability');
centers2 = (edges2(1:end-1)+edges2(2:end))/2;

figure  %just histogram
h1=histogram(EnsembleMeants8mod,'Normalization','probability','FaceColor','#4DBEEE','EdgeColor','none');
title('Monthly Ensemble Mean Precipitation [probability%]')
hold on
h2=histogram(EnsembleMeants585,'Normalization','probability','FaceColor','#EDB120','EdgeColor','none')
legend('EnsembleMean 1981-2014','EnsembleMean 2051-2100',...
    'Location','bestoutside')
%ylim([0 20])

figure %histogram with line superimposed
h1=histogram(EnsembleMeants8mod,'Normalization','probability','FaceColor','#4DBEEE','EdgeColor','none');
title('Monthly Ensemble Mean Precipitation [probability%]')
hold on
plot(centers,values,'k-')
hold on
h2=histogram(EnsembleMeants585,'Normalization','probability','FaceColor','#EDB120','EdgeColor','none')
hold on 
plot(centers2, values2,'b-')
legend('EnsembleMean 1981-2014','hist line','EnsembleMean 2051-2100','SSP585 line',...
    'Location','bestoutside')
%ylim([0 20])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BACK TO NAZ/SAZ future anlaysis (no seasonality)
%Get time series for NAZ mask for future (no dry/wet)
BCCCSM2MRtsNAZ585 = local(BCCCSM2MRc585,NAZmask,'omitnan');     %MOD 585 NAZ
CanESM5tsNAZ585 = local(CanESM5c585,NAZmask,'omitnan');
CESM2tsNAZ585 = local(CESM2c585,NAZmask,'omitnan');
CESM2WACCMtsNAZ585 = local(CESM2WACCMc585,NAZmask,'omitnan');
ECEarth3tsNAZ585 = local(ECEarth3c585,NAZmask,'omitnan');
ECEarth3VegtsNAZ585 = local(ECEarth3Vegc585,NAZmask,'omitnan');
MIROC6tsNAZ585 = local(MIROC6c585,NAZmask,'omitnan');
MRIESM20tsNAZ585 = local(MRIESM20c585,NAZmask,'omitnan');

EnsembletsNAZ585 = [BCCCSM2MRts585,CanESM5ts585,CESM2ts585,CESM2WACCMts585,ECEarth3ts585,...
    ECEarth3Vegts585,MIROC6ts585,MRIESM20ts585];

EnsembleMeantsNAZ585 = mean(Ensemblets585,2);  %calc Ensemble 585NAZ mean (keep rows)

%Get time series for NAZ mask for future (no dry/wet)
BCCCSM2MRtsSAZ585 = local(BCCCSM2MRc585,SAZmask,'omitnan');     %MOD 585 SAZ
CanESM5tsSAZ585 = local(CanESM5c585,SAZmask,'omitnan');
CESM2tsSAZ585 = local(CESM2c585,SAZmask,'omitnan');
CESM2WACCMtsSAZ585 = local(CESM2WACCMc585,SAZmask,'omitnan');
ECEarth3tsSAZ585 = local(ECEarth3c585,SAZmask,'omitnan');
ECEarth3VegtsSAZ585 = local(ECEarth3Vegc585,SAZmask,'omitnan');
MIROC6tsSAZ585 = local(MIROC6c585,SAZmask,'omitnan');
MRIESM20tsSAZ585 = local(MRIESM20c585,SAZmask,'omitnan');

EnsembletsSAZ585 = [BCCCSM2MRtsSAZ585,CanESM5tsSAZ585,CESM2tsSAZ585,CESM2WACCMtsSAZ585,...
    ECEarth3tsSAZ585,ECEarth3VegtsSAZ585,MIROC6tsSAZ585,MRIESM20tsSAZ585];

EnsembleMeantsSAZ585 = mean(EnsembletsSAZ585,2);  %calc Ensemble 585NAZ mean (keep rows)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%plot 2D trends in DRY/WET precip
% drySAZ585 is JJA
% rainySAZ585 is DJF
%p value <0.1 = 90% chance that it is not by chance
% BCCCSM2MRcdrySAZ585	
% CanESM5cdrySAZ585
% CESM2cdrySAZ585 		
% CESM2WACCMcdrySAZ585 	
% ECEarth3cdrySAZ585
% ECEarth3VegcdrySAZ585
% MIROC6cdrySAZ585 
% MRIESM20cdrySAZ585 
% EnsemblecdrySAZ585

[tr,p] = trend(EnsemblecdrySAZ585,3,'omitnan');

StatisticallySignificant = p<0.1;
[Lon,Lat] = meshgrid(lon2,lat);

figure
%imagescn(lon2,lat,tr*12)   %multiply by 365 for annual trend (12 for UDEL/CHIRPS)
contourf(lon2,lat,tr*365,'--','edgecolor','none')  %'edgecolor','none'
cb = colorbar;
ylabel(cb,'Precipitation trend mm year^{-1}')
%cmocean('tarn')   %-balance
cmocean('-balance') 
xlim([-75 -43])
ylim([-20 7])
caxis([-20 20])
hold on
stipple(Lon,Lat,StatisticallySignificant)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BACK TO NAZ/SAZ future anlaysis WET/DRY
% So far we have extracted the monthly seasonal data rainy/dry
% cdrySAZ585 cdryNAZ585
% crainySAZ585 crainyNAZ585   (220x261x153)

%Get time series for 585 NAZ dry season '[]cdryNAZ585'
BCCCSM2MRtsdryNAZ585 = local(BCCCSM2MRcdryNAZ585,NAZmask,'omitnan');   
CanESM5tsdryNAZ585 = local(CanESM5cdryNAZ585,NAZmask,'omitnan');
CESM2tsdryNAZ585	= local(CESM2cdryNAZ585,NAZmask,'omitnan');
CESM2WACCMtsdryNAZ585 = local(CESM2WACCMcdryNAZ585,NAZmask,'omitnan');
ECEarth3tsdryNAZ585 = local(ECEarth3cdryNAZ585,NAZmask,'omitnan');
ECEarth3VegtsdryNAZ585 = local(ECEarth3VegcdryNAZ585,NAZmask,'omitnan');
MIROC6tsdryNAZ585 = local(MIROC6cdryNAZ585,NAZmask,'omitnan');
MRIESM20tsdryNAZ585 = local(MRIESM20cdryNAZ585,NAZmask,'omitnan');

EnsembletsdryNAZ585 = [BCCCSM2MRtsdryNAZ585,CanESM5tsdryNAZ585,CESM2tsdryNAZ585,...
    CESM2WACCMtsdryNAZ585,ECEarth3tsdryNAZ585,ECEarth3VegtsdryNAZ585,MIROC6tsdryNAZ585,...
    MRIESM20tsdryNAZ585];

EnsembleMeantsdryNAZ585 = mean(EnsembletsdryNAZ585,2); 

%to reshape you must invert
BCCCSM2MRtsdryNAZ585 = BCCCSM2MRtsdryNAZ585';
CanESM5tsdryNAZ585 = CanESM5tsdryNAZ585';
CESM2tsdryNAZ585	= CESM2tsdryNAZ585';
CESM2WACCMtsdryNAZ585 = CESM2WACCMtsdryNAZ585';
ECEarth3tsdryNAZ585 = ECEarth3tsdryNAZ585';
ECEarth3VegtsdryNAZ585 = ECEarth3VegtsdryNAZ585';
MIROC6tsdryNAZ585 = MIROC6tsdryNAZ585';
MRIESM20tsdryNAZ585 = MRIESM20tsdryNAZ585';
EnsembleMeantsdryNAZ585 = EnsembleMeantsdryNAZ585'; 

%average every 3rd element in NAZ dry time series to get average of season
BCCCSM2MRtsdryNAZ585 = mean(reshape(BCCCSM2MRtsdryNAZ585,[3,51]));
CanESM5tsdryNAZ585 = mean(reshape(CanESM5tsdryNAZ585,[3,51])); 
CESM2tsdryNAZ585	= mean(reshape(CESM2tsdryNAZ585,[3,51])); 
CESM2WACCMtsdryNAZ585 = mean(reshape(CESM2WACCMtsdryNAZ585,[3,51])); 
ECEarth3tsdryNAZ585 = mean(reshape(ECEarth3tsdryNAZ585,[3,51])); 
ECEarth3VegtsdryNAZ585 = mean(reshape(ECEarth3VegtsdryNAZ585,[3,51])); 
MIROC6tsdryNAZ585 = mean(reshape(MIROC6tsdryNAZ585,[3,51])); 
MRIESM20tsdryNAZ585 = mean(reshape(MRIESM20tsdryNAZ585,[3,51])); 
EnsembleMeantsdryNAZ585 = mean(reshape(EnsembleMeantsdryNAZ585,[3,51])); 


%Get time series for 585 SAZ dry season '[]cdrySAZ585'
BCCCSM2MRtsdrySAZ585 = local(BCCCSM2MRcdrySAZ585,SAZmask,'omitnan');   
CanESM5tsdrySAZ585 = local(CanESM5cdrySAZ585,SAZmask,'omitnan');
CESM2tsdrySAZ585	= local(CESM2cdrySAZ585,SAZmask,'omitnan');
CESM2WACCMtsdrySAZ585 = local(CESM2WACCMcdrySAZ585,SAZmask,'omitnan');
ECEarth3tsdrySAZ585 = local(ECEarth3cdrySAZ585,SAZmask,'omitnan');
ECEarth3VegtsdrySAZ585 = local(ECEarth3VegcdrySAZ585,SAZmask,'omitnan');
MIROC6tsdrySAZ585 = local(MIROC6cdrySAZ585,SAZmask,'omitnan');
MRIESM20tsdrySAZ585 = local(MRIESM20cdrySAZ585,SAZmask,'omitnan');

EnsembletsdrySAZ585 = [BCCCSM2MRtsdrySAZ585,CanESM5tsdrySAZ585,CESM2tsdrySAZ585,...
    CESM2WACCMtsdrySAZ585,ECEarth3tsdrySAZ585,ECEarth3VegtsdrySAZ585,MIROC6tsdrySAZ585,...
    MRIESM20tsdrySAZ585];

EnsembleMeantsdrySAZ585 = mean(EnsembletsdrySAZ585,2); 

%to reshape you must invert
BCCCSM2MRtsdrySAZ585 = BCCCSM2MRtsdrySAZ585';
CanESM5tsdrySAZ585 = CanESM5tsdrySAZ585';
CESM2tsdrySAZ585	= CESM2tsdrySAZ585';
CESM2WACCMtsdrySAZ585 = CESM2WACCMtsdrySAZ585';
ECEarth3tsdrySAZ585 = ECEarth3tsdrySAZ585';
ECEarth3VegtsdrySAZ585 = ECEarth3VegtsdrySAZ585';
MIROC6tsdrySAZ585 = MIROC6tsdrySAZ585';
MRIESM20tsdrySAZ585 = MRIESM20tsdrySAZ585';
EnsembleMeantsdrySAZ585 = EnsembleMeantsdrySAZ585'; 

%average every 3rd element in SAZ dry time series to get average of season
BCCCSM2MRtsdrySAZ585 = mean(reshape(BCCCSM2MRtsdrySAZ585,[3,51]));
CanESM5tsdrySAZ585 = mean(reshape(CanESM5tsdrySAZ585,[3,51])); 
CESM2tsdrySAZ585	= mean(reshape(CESM2tsdrySAZ585,[3,51])); 
CESM2WACCMtsdrySAZ585 = mean(reshape(CESM2WACCMtsdrySAZ585,[3,51])); 
ECEarth3tsdrySAZ585 = mean(reshape(ECEarth3tsdrySAZ585,[3,51])); 
ECEarth3VegtsdrySAZ585 = mean(reshape(ECEarth3VegtsdrySAZ585,[3,51])); 
MIROC6tsdrySAZ585 = mean(reshape(MIROC6tsdrySAZ585,[3,51])); 
MRIESM20tsdrySAZ585 = mean(reshape(MRIESM20tsdrySAZ585,[3,51])); 
EnsembleMeantsdrySAZ585 = mean(reshape(EnsembleMeantsdrySAZ585,[3,51])); 


%Get time series for 585 NAZ rainy season '[]crainyNAZ585'
BCCCSM2MRtsrainyNAZ585 = local(BCCCSM2MRcrainyNAZ585,NAZmask,'omitnan');   
CanESM5tsrainyNAZ585 = local(CanESM5crainyNAZ585,NAZmask,'omitnan');
CESM2tsrainyNAZ585	= local(CESM2crainyNAZ585,NAZmask,'omitnan');
CESM2WACCMtsrainyNAZ585 = local(CESM2WACCMcrainyNAZ585,NAZmask,'omitnan');
ECEarth3tsrainyNAZ585 = local(ECEarth3crainyNAZ585,NAZmask,'omitnan');
ECEarth3VegtsrainyNAZ585 = local(ECEarth3VegcrainyNAZ585,NAZmask,'omitnan');
MIROC6tsrainyNAZ585 = local(MIROC6crainyNAZ585,NAZmask,'omitnan');
MRIESM20tsrainyNAZ585 = local(MRIESM20crainyNAZ585,NAZmask,'omitnan');

EnsembletsrainyNAZ585 = [BCCCSM2MRtsrainyNAZ585,CanESM5tsrainyNAZ585,CESM2tsrainyNAZ585,...
    CESM2WACCMtsrainyNAZ585,ECEarth3tsrainyNAZ585,ECEarth3VegtsrainyNAZ585,MIROC6tsrainyNAZ585,...
    MRIESM20tsrainyNAZ585];

EnsembleMeantsrainyNAZ585 = mean(EnsembletsrainyNAZ585,2); 

%to reshape you must invert
BCCCSM2MRtsrainyNAZ585 = BCCCSM2MRtsrainyNAZ585';
CanESM5tsrainyNAZ585 = CanESM5tsrainyNAZ585';
CESM2tsrainyNAZ585	= CESM2tsrainyNAZ585';
CESM2WACCMtsrainyNAZ585 = CESM2WACCMtsrainyNAZ585';
ECEarth3tsrainyNAZ585 = ECEarth3tsrainyNAZ585';
ECEarth3VegtsrainyNAZ585 = ECEarth3VegtsrainyNAZ585';
MIROC6tsrainyNAZ585 = MIROC6tsrainyNAZ585';
MRIESM20tsrainyNAZ585 = MRIESM20tsrainyNAZ585';
EnsembleMeantsrainyNAZ585 = EnsembleMeantsrainyNAZ585'; 

%average every 3rd element in NAZ rainy time series to get average of season
BCCCSM2MRtsrainyNAZ585 = mean(reshape(BCCCSM2MRtsrainyNAZ585,[3,51]));
CanESM5tsrainyNAZ585 = mean(reshape(CanESM5tsrainyNAZ585,[3,51])); 
CESM2tsrainyNAZ585	= mean(reshape(CESM2tsrainyNAZ585,[3,51])); 
CESM2WACCMtsrainyNAZ585 = mean(reshape(CESM2WACCMtsrainyNAZ585,[3,51])); 
ECEarth3tsrainyNAZ585 = mean(reshape(ECEarth3tsrainyNAZ585,[3,51])); 
ECEarth3VegtsrainyNAZ585 = mean(reshape(ECEarth3VegtsrainyNAZ585,[3,51])); 
MIROC6tsrainyNAZ585 = mean(reshape(MIROC6tsrainyNAZ585,[3,51])); 
MRIESM20tsrainyNAZ585 = mean(reshape(MRIESM20tsrainyNAZ585,[3,51])); 
EnsembleMeantsrainyNAZ585 = mean(reshape(EnsembleMeantsrainyNAZ585,[3,51])); 


%Get time series for 585 SAZ rainy season '[]crainySAZ585'
BCCCSM2MRtsrainySAZ585 = local(BCCCSM2MRcrainySAZ585,SAZmask,'omitnan');   
CanESM5tsrainySAZ585 = local(CanESM5crainySAZ585,SAZmask,'omitnan');
CESM2tsrainySAZ585	= local(CESM2crainySAZ585,SAZmask,'omitnan');
CESM2WACCMtsrainySAZ585 = local(CESM2WACCMcrainySAZ585,SAZmask,'omitnan');
ECEarth3tsrainySAZ585 = local(ECEarth3crainySAZ585,SAZmask,'omitnan');
ECEarth3VegtsrainySAZ585 = local(ECEarth3VegcrainySAZ585,SAZmask,'omitnan');
MIROC6tsrainySAZ585 = local(MIROC6crainySAZ585,SAZmask,'omitnan');
MRIESM20tsrainySAZ585 = local(MRIESM20crainySAZ585,SAZmask,'omitnan');

EnsembletsrainySAZ585 = [BCCCSM2MRtsrainySAZ585,CanESM5tsrainySAZ585,CESM2tsrainySAZ585,...
    CESM2WACCMtsrainySAZ585,ECEarth3tsrainySAZ585,ECEarth3VegtsrainySAZ585,MIROC6tsrainySAZ585,...
    MRIESM20tsrainySAZ585];

EnsembleMeantsrainySAZ585 = mean(EnsembletsrainySAZ585,2); 

%to reshape you must invert
BCCCSM2MRtsrainySAZ585 = BCCCSM2MRtsrainySAZ585';
CanESM5tsrainySAZ585 = CanESM5tsrainySAZ585';
CESM2tsrainySAZ585	= CESM2tsrainySAZ585';
CESM2WACCMtsrainySAZ585 = CESM2WACCMtsrainySAZ585';
ECEarth3tsrainySAZ585 = ECEarth3tsrainySAZ585';
ECEarth3VegtsrainySAZ585 = ECEarth3VegtsrainySAZ585';
MIROC6tsrainySAZ585 = MIROC6tsrainySAZ585';
MRIESM20tsrainySAZ585 = MRIESM20tsrainySAZ585';
EnsembleMeantsrainySAZ585 = EnsembleMeantsrainySAZ585'; 

%average every 3rd element in SAZ rainy time series to get average of season
BCCCSM2MRtsrainySAZ585 = mean(reshape(BCCCSM2MRtsrainySAZ585,[3,51]));
CanESM5tsrainySAZ585 = mean(reshape(CanESM5tsrainySAZ585,[3,51])); 
CESM2tsrainySAZ585	= mean(reshape(CESM2tsrainySAZ585,[3,51])); 
CESM2WACCMtsrainySAZ585 = mean(reshape(CESM2WACCMtsrainySAZ585,[3,51])); 
ECEarth3tsrainySAZ585 = mean(reshape(ECEarth3tsrainySAZ585,[3,51])); 
ECEarth3VegtsrainySAZ585 = mean(reshape(ECEarth3VegtsrainySAZ585,[3,51])); 
MIROC6tsrainySAZ585 = mean(reshape(MIROC6tsrainySAZ585,[3,51])); 
MRIESM20tsrainySAZ585 = mean(reshape(MRIESM20tsrainySAZ585,[3,51])); 
EnsembleMeantsrainySAZ585 = mean(reshape(EnsembleMeantsrainySAZ585,[3,51])); 

StartDatemonth585 = datetime(2071,01,01);
EndDatemonth585 = datetime(2100,12,31);
annualtime585 = StartDatemonth585:calyears(1):EndDatemonth585;
annualtime2_585 = datenum(annualtime585); 

%%% 2071-2100 (30 years)
% for time series: (22:51) OR for 'c' matrix:(64:153)
%Trends for 585 NAZ/DRY []tsdryNAZ585
[tr,p] = trend(BCCCSM2MRtsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(CanESM5tsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2tsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2WACCMtsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3tsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3VegtsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(MIROC6tsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(MRIESM20tsdryNAZ585(22:51),annualtime2_585)
[tr,p] = trend(EnsembleMeantsdryNAZ585(22:51),annualtime2_585)

%Mean for 585 NAZ/DRY []tsdryNAZ585
mean(BCCCSM2MRtsdryNAZ585(22:51),'all','omitnan')
mean(CanESM5tsdryNAZ585(22:51),'all','omitnan')
mean(CESM2tsdryNAZ585(22:51),'all','omitnan')
mean(CESM2WACCMtsdryNAZ585(22:51),'all','omitnan')
mean(ECEarth3tsdryNAZ585(22:51),'all','omitnan')
mean(ECEarth3VegtsdryNAZ585(22:51),'all','omitnan')
mean(MIROC6tsdryNAZ585(22:51),'all','omitnan')
mean(MRIESM20tsdryNAZ585(22:51),'all','omitnan')
mean(EnsembleMeantsdryNAZ585(22:51),'all','omitnan')

%Std for 585 NAZ/DRY []tsdryNAZ585
std(BCCCSM2MRtsdryNAZ585(22:51),'omitnan')
std(CanESM5tsdryNAZ585(22:51),'omitnan')
std(CESM2tsdryNAZ585(22:51),'omitnan')
std(CESM2WACCMtsdryNAZ585(22:51),'omitnan')
std(ECEarth3tsdryNAZ585(22:51),'omitnan')
std(ECEarth3VegtsdryNAZ585(22:51),'omitnan')
std(MIROC6tsdryNAZ585(22:51),'omitnan')
std(MRIESM20tsdryNAZ585(22:51),'omitnan')
std(EnsembleMeantsdryNAZ585(22:51),'omitnan')


%%% 2071-2100 (30 years)
% for time series: (22:51) OR for 'c' matrix:(64:153)
%Trends for 585 SAZ/DRY []tsdrySAZ585
[tr,p] = trend(BCCCSM2MRtsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(CanESM5tsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2tsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2WACCMtsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3tsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3VegtsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(MIROC6tsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(MRIESM20tsdrySAZ585(22:51),annualtime2_585)
[tr,p] = trend(EnsembleMeantsdrySAZ585(22:51),annualtime2_585)

%Mean for 585 SAZ/DRY []tsdrySAZ585
mean(BCCCSM2MRtsdrySAZ585(22:51),'all','omitnan')
mean(CanESM5tsdrySAZ585(22:51),'all','omitnan')
mean(CESM2tsdrySAZ585(22:51),'all','omitnan')
mean(CESM2WACCMtsdrySAZ585(22:51),'all','omitnan')
mean(ECEarth3tsdrySAZ585(22:51),'all','omitnan')
mean(ECEarth3VegtsdrySAZ585(22:51),'all','omitnan')
mean(MIROC6tsdrySAZ585(22:51),'all','omitnan')
mean(MRIESM20tsdrySAZ585(22:51),'all','omitnan')
mean(EnsembleMeantsdrySAZ585(22:51),'all','omitnan')

%Std for 585 SAZ/DRY []tsdrySAZ585
std(BCCCSM2MRtsdrySAZ585(22:51),'omitnan')
std(CanESM5tsdrySAZ585(22:51),'omitnan')
std(CESM2tsdrySAZ585(22:51),'omitnan')
std(CESM2WACCMtsdrySAZ585(22:51),'omitnan')
std(ECEarth3tsdrySAZ585(22:51),'omitnan')
std(ECEarth3VegtsdrySAZ585(22:51),'omitnan')
std(MIROC6tsdrySAZ585(22:51),'omitnan')
std(MRIESM20tsdrySAZ585(22:51),'omitnan')
std(EnsembleMeantsdrySAZ585(22:51),'omitnan')

%%% 2071-2100 (30 years)
% for time series: (22:51) OR for 'c' matrix:(64:153)
%Trends for 585 NAZ/WET []tsrainyNAZ585
[tr,p] = trend(BCCCSM2MRtsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(CanESM5tsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2tsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2WACCMtsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3tsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3VegtsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(MIROC6tsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(MRIESM20tsrainyNAZ585(22:51),annualtime2_585)
[tr,p] = trend(EnsembleMeantsrainyNAZ585(22:51),annualtime2_585)

%Mean for 585 NAZ/rainy []tsrainyNAZ585
mean(BCCCSM2MRtsrainyNAZ585(22:51),'all','omitnan')
mean(CanESM5tsrainyNAZ585(22:51),'all','omitnan')
mean(CESM2tsrainyNAZ585(22:51),'all','omitnan')
mean(CESM2WACCMtsrainyNAZ585(22:51),'all','omitnan')
mean(ECEarth3tsrainyNAZ585(22:51),'all','omitnan')
mean(ECEarth3VegtsrainyNAZ585(22:51),'all','omitnan')
mean(MIROC6tsrainyNAZ585(22:51),'all','omitnan')
mean(MRIESM20tsrainyNAZ585(22:51),'all','omitnan')
mean(EnsembleMeantsrainyNAZ585(22:51),'all','omitnan')

%Std for 585 NAZ/rainy []tsrainyNAZ585
std(BCCCSM2MRtsrainyNAZ585(22:51),'omitnan')
std(CanESM5tsrainyNAZ585(22:51),'omitnan')
std(CESM2tsrainyNAZ585(22:51),'omitnan')
std(CESM2WACCMtsrainyNAZ585(22:51),'omitnan')
std(ECEarth3tsrainyNAZ585(22:51),'omitnan')
std(ECEarth3VegtsrainyNAZ585(22:51),'omitnan')
std(MIROC6tsrainyNAZ585(22:51),'omitnan')
std(MRIESM20tsrainyNAZ585(22:51),'omitnan')
std(EnsembleMeantsrainyNAZ585(22:51),'omitnan')

%%% 2071-2100 (30 years)
% for time series: (22:51) OR for 'c' matrix:(64:153)
%Trends for 585 SAZ/WET []tsrainySAZ585
[tr,p] = trend(BCCCSM2MRtsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(CanESM5tsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2tsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(CESM2WACCMtsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3tsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(ECEarth3VegtsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(MIROC6tsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(MRIESM20tsrainySAZ585(22:51),annualtime2_585)
[tr,p] = trend(EnsembleMeantsrainySAZ585(22:51),annualtime2_585)

%Mean for 585 SAZ/rainy []tsrainySAZ585
mean(BCCCSM2MRtsrainySAZ585(22:51),'all','omitnan')
mean(CanESM5tsrainySAZ585(22:51),'all','omitnan')
mean(CESM2tsrainySAZ585(22:51),'all','omitnan')
mean(CESM2WACCMtsrainySAZ585(22:51),'all','omitnan')
mean(ECEarth3tsrainySAZ585(22:51),'all','omitnan')
mean(ECEarth3VegtsrainySAZ585(22:51),'all','omitnan')
mean(MIROC6tsrainySAZ585(22:51),'all','omitnan')
mean(MRIESM20tsrainySAZ585(22:51),'all','omitnan')
mean(EnsembleMeantsrainySAZ585(22:51),'all','omitnan')

%Std for 585 SAZ/rainy []tsrainySAZ585
std(BCCCSM2MRtsrainySAZ585(22:51),'omitnan')
std(CanESM5tsrainySAZ585(22:51),'omitnan')
std(CESM2tsrainySAZ585(22:51),'omitnan')
std(CESM2WACCMtsrainySAZ585(22:51),'omitnan')
std(ECEarth3tsrainySAZ585(22:51),'omitnan')
std(ECEarth3VegtsrainySAZ585(22:51),'omitnan')
std(MIROC6tsrainySAZ585(22:51),'omitnan')
std(MRIESM20tsrainySAZ585(22:51),'omitnan')
std(EnsembleMeantsrainySAZ585(22:51),'omitnan')

%Plot seasonal means (pick months- 4:9, apr - sep)
% BCCCSM2MRc	
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc 	
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc
% CHIRPSc
% CMAPc
% UDELc
DRY_mean = monthly(UDELc,modtime,4:9,@mean);  %modtime2 for CHIRPS

figure
pcolor(lon2,lat,DRY_mean)   %divide by 30 for UDEL and CHIRPS
shading interp
cmocean rain
cb = colorbar;
ylabel(cb,'Dry season average precip (mm/day)')
caxis([0 15])
xlim([-75 -43])
ylim([-18 7])


% BCCCSM2MRc	
% BCCESM1c 	
% CanESM5c 
% CESM2c 		
% CESM2WACCMc
% E3SM10c	
% ECEarth3c
% ECEarth3Vegc
% GISSE21Gc 
% GISSE21Hc
% MIROC6c 
% MRIESM20c 
% SAM0UNICONc 
% UDELc
% CHIRPSc
% CMAPc
%PLOT DRY SEASON VARIANCE %divide by ./30.4167 for UDEL and CHIRPS
DRY_var = monthly(UDELc./30.4167,modtime,4:9,@var);   %modtime2 for CHIRPS
figure %just variance
imagescn(lon2,lat,DRY_var) 
cb = colorbar;
ylabel(cb,'Dry season variance')
cmocean amp
xlim([-75 -43])
ylim([-18 7])

%PLOT DRY SEASON MEAN + VARIANCE %divide by ./30.4167 for UDEL and CHIRPS
DRY_mean = monthly(UDELc./30.4167,modtime,4:9,@mean);   %modtime2 for CHIRPS
figure  %mean with variance
imagescn(lon2,lat,DRY_mean)
cmocean rain
cb = colorbar;
ylabel(cb,'Dry season mean precip (mm/day)')
xlim([-75 -43])
ylim([-18 7])
caxis([0 10])
%plot variance as contours
hold on
contour(lon2,lat,DRY_var,'k','ShowText','on')  %10 levels, div by 30 UDEL CHIRPS

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Get annual pr from monthly ts using timetable and retime%%%%%%%
%%%%%%% tt is for TimeTable and tt2 is for the annual time series%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Create model time vector
StartDate = datetime(1979,01,01);
EndDate = datetime(2014,12,31);
modtime= StartDate:calmonths(1):EndDate;
modtimeColumn = modtime.';

StartDate2 = datetime(1981,01,01);
EndDate2 = datetime(2014,12,31);
modtime2= StartDate2:calmonths(1):EndDate2;
modtimeColumn2 = modtime2.';

%Create timetable (tt) and then aggregate (tt2)
%Create table from timetable (annual)
%Then create array from table(annual2)
UDELtt = timetable(modtimeColumn,UDELts);
UDELtt2 = retime(UDELtt,'yearly','mean');
UDELannual = timetable2table(UDELtt2);
UDELannual2 = table2array(UDELannual(:,[2]));

CMAPtt = timetable(modtimeColumn,CMAPts);
CMAPtt2 = retime(CMAPtt,'yearly','mean');
CMAPannual = timetable2table(CMAPtt2);
CMAPannual2 = table2array(CMAPannual(:,[2]));

CHIRPStt = timetable(modtimeColumn2,CHIRPSts);
CHIRPStt2 = retime(CHIRPStt,'yearly','mean');
CHIRPSannual = timetable2table(CHIRPStt2);
CHIRPSannual2 = table2array(CHIRPSannual(:,[2]));

BCCCSM2MRtt = timetable(modtimeColumn,BCCCSM2MRts);
BCCCSM2MRtt2 = retime(BCCCSM2MRtt,'yearly','mean');
BCCCSM2MRannual = timetable2table(BCCCSM2MRtt2);
BCCCSM2MRannual2 = table2array(BCCCSM2MRannual(:,[2]));

BCCESM1tt = timetable(modtimeColumn,BCCESM1ts);
BCCESM1tt2 = retime(BCCESM1tt,'yearly','mean');
BCCESM1annual = timetable2table(BCCESM1tt2);
BCCESM1annual2 = table2array(BCCESM1annual(:,[2]));

CanESM5tt = timetable(modtimeColumn,CanESM5ts);
CanESM5tt2 = retime(CanESM5tt,'yearly','mean');
CanESM5annual = timetable2table(CanESM5tt2);
CanESM5annual2 = table2array(CanESM5annual(:,[2]));

CESM2tt	= timetable(modtimeColumn,CESM2ts);
CESM2tt2 = retime(CESM2tt,'yearly','mean');
CESM2annual = timetable2table(CESM2tt2);
CESM2annual2 = table2array(CESM2annual(:,[2]));

CESM2WACCMtt = timetable(modtimeColumn,CESM2WACCMts);
CESM2WACCMtt2 = retime(CESM2WACCMtt,'yearly','mean');
CESM2WACCMannual = timetable2table(CESM2WACCMtt2);
CESM2WACCMannual2 = table2array(CESM2WACCMannual(:,[2]));

E3SM10tt = timetable(modtimeColumn,E3SM10ts);
E3SM10tt2 = retime(E3SM10tt,'yearly','mean');
E3SM10annual = timetable2table(E3SM10tt2);
E3SM10annual2 = table2array(E3SM10annual(:,[2]));

ECEarth3tt = timetable(modtimeColumn,ECEarth3ts);
ECEarth3tt2 = retime(ECEarth3tt,'yearly','mean');
ECEarth3annual = timetable2table(ECEarth3tt2);
ECEarth3annual2 = table2array(ECEarth3annual(:,[2]));

ECEarth3Vegtt = timetable(modtimeColumn,ECEarth3Vegts);
ECEarth3Vegtt2 = retime(ECEarth3Vegtt,'yearly','mean');
ECEarth3Vegannual = timetable2table(ECEarth3Vegtt2);
ECEarth3Vegannual2 = table2array(ECEarth3Vegannual(:,[2]));

GISSE21Gtt = timetable(modtimeColumn,GISSE21Gts);
GISSE21Gtt2 = retime(GISSE21Gtt,'yearly','mean');
GISSE21Gannual = timetable2table(GISSE21Gtt2);
GISSE21Gannual2 = table2array(GISSE21Gannual(:,[2]));

GISSE21Htt = timetable(modtimeColumn,GISSE21Hts);
GISSE21Htt2 = retime(GISSE21Htt,'yearly','mean');
GISSE21Hannual = timetable2table(GISSE21Htt2);
GISSE21Hannual2 = table2array(GISSE21Hannual(:,[2]));

MIROC6tt = timetable(modtimeColumn,MIROC6ts);
MIROC6tt2 = retime(MIROC6tt,'yearly','mean');
MIROC6annual = timetable2table(MIROC6tt2);
MIROC6annual2 = table2array(MIROC6annual(:,[2]));

MRIESM20tt = timetable(modtimeColumn,MRIESM20ts);
MRIESM20tt2 = retime(MRIESM20tt,'yearly','mean');
MRIESM20annual = timetable2table(MRIESM20tt2);
MRIESM20annual2 = table2array(MRIESM20annual(:,[2]));

SAM0UNICONtt = timetable(modtimeColumn,SAM0UNICONts);
SAM0UNICONtt2 = retime(SAM0UNICONtt,'yearly','mean');
SAM0UNICONannual = timetable2table(SAM0UNICONtt2);
SAM0UNICONannual2 = table2array(SAM0UNICONannual(:,[2]));

EnsembleMeantt = timetable(modtimeColumn,EnsembleMeants); 
EnsembleMeantt2 = retime(EnsembleMeantt,'yearly','mean');
EnsembleMeanannual = timetable2table(EnsembleMeantt2);
EnsembleMeanannual2 = table2array(EnsembleMeanannual(:,[2]));

%Plot ANNUAL PREC mod and obs time series(CHECK UNITS!!!!)
%All obs and mod are mm/day
%Change datenum to actual calendar dates
% modtime = datetime(modtime,'ConvertFrom','datenum');
StartDate = datetime(1981,01,01);
EndDate = datetime(2014,12,31);
annualtime= StartDate:calyears(1):EndDate;

%Remember that CHIRPS is 81-2014, so you have to make
%all the vectors 34 in length (get rid of '79 and '80)
figure
plot(annualtime,BCCCSM2MRannual2(3:36),'-+r')
title('Annual Precipitation 1981-2014')
xlabel('Time (years)')
ylabel('Precipitation (mm/day)')
grid
hold on 
plot(annualtime,BCCESM1annual2(3:36),'-ok')
hold on
plot(annualtime,CanESM5annual2(3:36),'-*b')
hold on
plot(annualtime,CESM2annual2(3:36),'-xk')
hold on
plot(annualtime,CESM2WACCMannual2(3:36),'-pm')
hold on
plot(annualtime,E3SM10annual2(3:36),'-*c')
hold on 
plot(annualtime,ECEarth3annual2(3:36),'--sm')
hold on
plot(annualtime,ECEarth3Vegannual2(3:36),':xk')
hold on
plot(annualtime,GISSE21Gannual2(3:36),'-.og')
hold on
plot(annualtime,GISSE21Hannual2(3:36),':>r')
hold on
plot(annualtime,MIROC6annual2(3:36),'-hb')
hold on
plot(annualtime,MRIESM20annual2(3:36),'--pr')
hold on
plot(annualtime,SAM0UNICONannual2(3:36),'-xb')
hold on
plot(annualtime,EnsembleMeanannual2(3:36),'--*r')
hold on
plot(annualtime,UDELannual2(3:36),'-.b')
hold on
plot(annualtime,CMAPannual2(3:36),'-dk')
hold on
plot(annualtime,CHIRPSannual2,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS')



% %Plot mod and obs time series(CHECK UNITS!!!!)
% %All obs and mod are now mm/day
% %Change datenum to actual calendar dates
% modtime = datetime(modtime,'ConvertFrom','datenum');
% figure
% plot(modtime,BCCCSM2MRts,'-+r')
% title('Precip 1979-2014 lon[-75,-44] lat[-15 6]')
% xlabel('Time (years)')
% ylabel('Precipitation (mm/day)')
% grid
% hold on 
% plot(modtime,BCCESM1ts,'-ok')
% hold on
% plot(modtime,CanESM5ts,'-*b')
% hold on
% plot(modtime,CESM2ts,'-xk')
% hold on
% plot(modtime,CESM2WACCMts,'-pm')
% hold on
% plot(modtime,E3SM10ts,'-*c')
% hold on 
% plot(modtime,ECEarth3ts,'--sm')
% hold on
% plot(modtime,ECEarth3Vegts,':xk')
% hold on
% plot(modtime,GISSE21Gts,'-.og')
% hold on
% plot(modtime,GISSE21Hts,':>r')
% hold on
% plot(modtime,MIROC6ts,'-hb')
% hold on
% plot(modtime,MRIESM20ts,'--pr')
% hold on
% plot(modtime,SAM0UNICONts,'-xb')
% hold on
% plot(modtime,EnsembleMeants,'--*r')
% hold on
% plot(modtime,UDELts,'-+r')
% hold on
% plot(modtime,CMAPts,'-dk')
% hold on
% plot(CHIRPSt,CHIRPSts,'-sm')
% legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
%     'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
%     'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CMAP','CHIRPS')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  CALCULATE PR STATS FOR TAYLOR DIAGRAM   %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Remember that CHIRPS ts is 408('81-'14) all other ts are 432 ('79-'14)
%Only need 25-432 for all other timestamps
%Use UDEL for reference and include CMAP, CHIRPS
%function [stats] = taylor_statistics(predicted,reference)

%This is for monthly statistics using CHIRPS as a reference
%(UDELts2) for mm/day & CHIRPSts2
BCCCSM2MRstats = taylor_statistics(BCCCSM2MRts(25:432),CHIRPSts2);
BCCESM1stats = taylor_statistics(BCCESM1ts(25:432),CHIRPSts2);
CanESM5stats = taylor_statistics(CanESM5ts(25:432),CHIRPSts2);
CESM2stats = taylor_statistics(CESM2ts(25:432),CHIRPSts2);	
CESM2WACCMstats = taylor_statistics(CESM2WACCMts(25:432),CHIRPSts2);
E3SM10stats = taylor_statistics(E3SM10ts(25:432),CHIRPSts2);
ECEarth3stats = taylor_statistics(ECEarth3ts(25:432),CHIRPSts2);
ECEarth3Vegstats = taylor_statistics(ECEarth3Vegts(25:432),CHIRPSts2);
GISSE21Gstats = taylor_statistics(GISSE21Gts(25:432),CHIRPSts2);
GISSE21Hstats = taylor_statistics(GISSE21Hts(25:432),CHIRPSts2);
MIROC6stats = taylor_statistics(MIROC6ts(25:432),CHIRPSts2);
MRIESM20stats = taylor_statistics(MRIESM20ts(25:432),CHIRPSts2);
SAM0UNICONstats = taylor_statistics(SAM0UNICONts(25:432),CHIRPSts2);
CMAPstats = taylor_statistics(CMAPts(25:432),CHIRPSts2);
UDELstats = taylor_statistics(UDELts2(25:432),CHIRPSts2);   %UDELts2
EnsembleMeanstats = taylor_statistics(EnsembleMeants(25:432),CHIRPSts2);

%This is for monthly statistics using CHIRPS as a reference
%NAZ Northern Amazon
BCCCSM2MRstatsNAZ = taylor_statistics(BCCCSM2MRtsNAZ,CHIRPStsNAZ);
BCCESM1statsNAZ = taylor_statistics(BCCESM1tsNAZ,CHIRPStsNAZ);
CanESM5statsNAZ = taylor_statistics(CanESM5tsNAZ,CHIRPStsNAZ);
CESM2statsNAZ = taylor_statistics(CESM2tsNAZ,CHIRPStsNAZ);	
CESM2WACCMstatsNAZ = taylor_statistics(CESM2WACCMtsNAZ,CHIRPStsNAZ);
E3SM10statsNAZ = taylor_statistics(E3SM10tsNAZ,CHIRPStsNAZ);
ECEarth3statsNAZ = taylor_statistics(ECEarth3tsNAZ,CHIRPStsNAZ);
ECEarth3VegstatsNAZ = taylor_statistics(ECEarth3VegtsNAZ,CHIRPStsNAZ);
GISSE21GstatsNAZ = taylor_statistics(GISSE21GtsNAZ,CHIRPStsNAZ);
GISSE21HstatsNAZ = taylor_statistics(GISSE21HtsNAZ,CHIRPStsNAZ);
MIROC6statsNAZ = taylor_statistics(MIROC6tsNAZ,CHIRPStsNAZ);
MRIESM20statsNAZ = taylor_statistics(MRIESM20tsNAZ,CHIRPStsNAZ);
SAM0UNICONstatsNAZ = taylor_statistics(SAM0UNICONtsNAZ,CHIRPStsNAZ);
CMAPstatsNAZ = taylor_statistics(CMAPtsNAZ,CHIRPStsNAZ);
UDELstatsNAZ = taylor_statistics(UDELtsNAZ,CHIRPStsNAZ);
EnsembleMeanstatsNAZ = taylor_statistics(EnsembleMeantsNAZ,CHIRPStsNAZ);

%This is for monthly statistics using CHIRPS as a reference
%SAZ Southern Amazon
BCCCSM2MRstatsSAZ = taylor_statistics(BCCCSM2MRtsSAZ,CHIRPStsSAZ);
BCCESM1statsSAZ = taylor_statistics(BCCESM1tsSAZ,CHIRPStsSAZ);
CanESM5statsSAZ = taylor_statistics(CanESM5tsSAZ,CHIRPStsSAZ);
CESM2statsSAZ = taylor_statistics(CESM2tsSAZ,CHIRPStsSAZ);	
CESM2WACCMstatsSAZ = taylor_statistics(CESM2WACCMtsSAZ,CHIRPStsSAZ);
E3SM10statsSAZ = taylor_statistics(E3SM10tsSAZ,CHIRPStsSAZ);
ECEarth3statsSAZ = taylor_statistics(ECEarth3tsSAZ,CHIRPStsSAZ);
ECEarth3VegstatsSAZ = taylor_statistics(ECEarth3VegtsSAZ,CHIRPStsSAZ);
GISSE21GstatsSAZ = taylor_statistics(GISSE21GtsSAZ,CHIRPStsSAZ);
GISSE21HstatsSAZ = taylor_statistics(GISSE21HtsSAZ,CHIRPStsSAZ);
MIROC6statsSAZ = taylor_statistics(MIROC6tsSAZ,CHIRPStsSAZ);
MRIESM20statsSAZ = taylor_statistics(MRIESM20tsSAZ,CHIRPStsSAZ);
SAM0UNICONstatsSAZ = taylor_statistics(SAM0UNICONtsSAZ,CHIRPStsSAZ);
CMAPstatsSAZ = taylor_statistics(CMAPtsSAZ,CHIRPStsSAZ);
UDELstatsSAZ = taylor_statistics(UDELtsSAZ,CHIRPStsSAZ);
EnsembleMeanstatsSAZ = taylor_statistics(EnsembleMeantsSAZ,CHIRPStsSAZ);

% THIS IS DRY SEASON TAYLOR DIAGRAM VALUES. APR-SEPT
%This is for monthly statistics using CHIRPS as a reference
%CHIRPS/UDELdsts is already mm/day like all other dsts (ds= dry season)
BCCCSM2MRstats = taylor_statistics(BCCCSM2MRdsts(3:36),CHIRPSdsts);
BCCESM1stats = taylor_statistics(BCCESM1dsts(3:36),CHIRPSdsts);
CanESM5stats = taylor_statistics(CanESM5dsts(3:36),CHIRPSdsts);
CESM2stats = taylor_statistics(CESM2dsts(3:36),CHIRPSdsts);	
CESM2WACCMstats = taylor_statistics(CESM2WACCMdsts(3:36),CHIRPSdsts);
E3SM10stats = taylor_statistics(E3SM10dsts(3:36),CHIRPSdsts);
ECEarth3stats = taylor_statistics(ECEarth3dsts(3:36),CHIRPSdsts);
ECEarth3Vegstats = taylor_statistics(ECEarth3Vegdsts(3:36),CHIRPSdsts);
GISSE21Gstats = taylor_statistics(GISSE21Gdsts(3:36),CHIRPSdsts);
GISSE21Hstats = taylor_statistics(GISSE21Hdsts(3:36),CHIRPSdsts);
MIROC6stats = taylor_statistics(MIROC6dsts(3:36),CHIRPSdsts);
MRIESM20stats = taylor_statistics(MRIESM20dsts(3:36),CHIRPSdsts);
SAM0UNICONstats = taylor_statistics(SAM0UNICONdsts(3:36),CHIRPSdsts);
CMAPstats = taylor_statistics(CMAPdsts(3:36),CHIRPSdsts);
UDELstats = taylor_statistics(UDELdsts(3:36),CHIRPSdsts);   %UDELdsts
EnsembleMeanstats = taylor_statistics(EnsembleMeandsts(3:36),CHIRPSdsts);

% THIS IS DRY SEASON TAYLOR DIAGRAM VALUES. APR-SEPT w/UPDATED STATS (line
% 29-36 on Var_stats Dry_Season tab
%This is for monthly statistics using CHIRPS as a reference
BCCCSM2MRstats = taylor_statistics(BCCCSM2MRdsarray(13:216),CHIRPSdsts);
BCCESM1stats = taylor_statistics(BCCESM1dsarray(13:216),CHIRPSdsts);
CanESM5stats = taylor_statistics(CanESM5dsarray(13:216),CHIRPSdsts);
CESM2stats = taylor_statistics(CESM2dsarray(13:216),CHIRPSdsts);	
CESM2WACCMstats = taylor_statistics(CESM2WACCMdsarray(13:216),CHIRPSdsts);
E3SM10stats = taylor_statistics(E3SM10dsarray(13:216),CHIRPSdsts);
ECEarth3stats = taylor_statistics(ECEarth3dsarray(13:216),CHIRPSdsts);
ECEarth3Vegstats = taylor_statistics(ECEarth3Vegdsarray(13:216),CHIRPSdsts);
GISSE21Gstats = taylor_statistics(GISSE21Gdsarray(13:216),CHIRPSdsts);
GISSE21Hstats = taylor_statistics(GISSE21Hdsarray(13:216),CHIRPSdsts);
MIROC6stats = taylor_statistics(MIROC6dsarray(13:216),CHIRPSdsts);
MRIESM20stats = taylor_statistics(MRIESM20dsarray(13:216),CHIRPSdsts);
SAM0UNICONstats = taylor_statistics(SAM0UNICONdsarray(13:216),CHIRPSdsts);
CMAPstats = taylor_statistics(CMAPdsarray(13:216),CHIRPSdsts);
UDELstats = taylor_statistics(UDELdsarray(13:216),CHIRPSdsts);   %UDELdsts
EnsembleMeanstats = taylor_statistics(EnsembleMeandsarray(13:216),CHIRPSdsts);

% %This is for monthly statistics and a time correction for UDEL ref
% %(UDELts2) for mm/day & CHIRPSts2
% BCCCSM2MRstats = taylor_statistics(BCCCSM2MRts(25:432),UDELts2(25:432));
% BCCESM1stats = taylor_statistics(BCCESM1ts(25:432),UDELts2(25:432));
% CanESM5stats = taylor_statistics(CanESM5ts(25:432),UDELts2(25:432));
% CESM2stats = taylor_statistics(CESM2ts(25:432),UDELts2(25:432));	
% CESM2WACCMstats = taylor_statistics(CESM2WACCMts(25:432),UDELts2(25:432));
% E3SM10stats = taylor_statistics(E3SM10ts(25:432),UDELts2(25:432));
% ECEarth3stats = taylor_statistics(ECEarth3ts(25:432),UDELts2(25:432));
% ECEarth3Vegstats = taylor_statistics(ECEarth3Vegts(25:432),UDELts2(25:432));
% GISSE21Gstats = taylor_statistics(GISSE21Gts(25:432),UDELts2(25:432));
% GISSE21Hstats = taylor_statistics(GISSE21Hts(25:432),UDELts2(25:432));
% MIROC6stats = taylor_statistics(MIROC6ts(25:432),UDELts2(25:432));
% MRIESM20stats = taylor_statistics(MRIESM20ts(25:432),UDELts2(25:432));
% SAM0UNICONstats = taylor_statistics(SAM0UNICONts(25:432),UDELts2(25:432));
% CMAPstats = taylor_statistics(CMAPts(25:432),UDELts2(25:432));
% CHIRPSstats = taylor_statistics(CHIRPSts2,UDELts2(25:432));   %CHIRPSts2
% EnsembleMeanstats = taylor_statistics(EnsembleMeants(25:432),UDELts2(25:432));

% %This is for annual statistics and a time correction for UDEL ref
% %Only use 3:36 because you want 81-2014, not 79-2014 (thanks chirps)
% BCCCSM2MRstats = taylor_statistics(BCCCSM2MRannual2(3:36),UDELannual2(3:36));
% BCCESM1stats = taylor_statistics(BCCESM1annual2(3:36),UDELannual2(3:36));
% CanESM5stats = taylor_statistics(CanESM5annual2(3:36),UDELannual2(3:36));
% CESM2stats = taylor_statistics(CESM2annual2(3:36),UDELannual2(3:36));	
% CESM2WACCMstats = taylor_statistics(CESM2WACCMannual2(3:36),UDELannual2(3:36));
% E3SM10stats = taylor_statistics(E3SM10annual2(3:36),UDELannual2(3:36));
% ECEarth3stats = taylor_statistics(ECEarth3annual2(3:36),UDELannual2(3:36));
% ECEarth3Vegstats = taylor_statistics(ECEarth3Vegannual2(3:36),UDELannual2(3:36));
% GISSE21Gstats = taylor_statistics(GISSE21Gannual2(3:36),UDELannual2(3:36));
% GISSE21Hstats = taylor_statistics(GISSE21Hannual2(3:36),UDELannual2(3:36));
% MIROC6stats = taylor_statistics(MIROC6annual2(3:36),UDELannual2(3:36));
% MRIESM20stats = taylor_statistics(MRIESM20annual2(3:36),UDELannual2(3:36));
% SAM0UNICONstats = taylor_statistics(SAM0UNICONannual2(3:36),UDELannual2(3:36));
% CMAPstats = taylor_statistics(CMAPannual2(3:36),UDELannual2(3:36));
% CHIRPSstats = taylor_statistics(CHIRPSannual2,UDELannual2(3:36));
% EnsembleMeanstats = taylor_statistics(EnsembleMeanannual2(3:36),UDELannual2(3:36));



%Create arrays with stats from excel sheet (copy over)
ccoef = [1,0.7629,0.7286,0.8285,0.909,0.899,0.8649,...	
    0.7884,0.8038,0.8527,0.8019,0.8528,0.8902,0.893,0.9723,0.9839,0.8976];
crmsd = [0,0.8348369538,1.002016027,0.8348873545,0.7229978328,0.790736354,0.7365556172,...	
    0.8523763923,0.8241520085,0.6670530719,0.7570686961,0.8438586765,0.8899753037,...	
    0.626026914,0.3344589486,0.2354720024,0.5953832972];
sdev = [1,1.104631823,1.266720427,1.040169346,1.693614233,1.752280631,1.130386573,1.075853032,...	
    1.126052114,1.323874805,1.260873948,1.609747493,1.87576231,1.350637569,1.359155285,...	
    1.399627035,1.271760496];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CMAP','CHIRPS','Ensemble Mean'}; %this is a 'cell' array

%Save stats in mat file for tay diag
save('Pr_stats.mat','ccoef','crmsd','sdev','ID')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create NORMALIZED arrays with stats from excel sheet (Precip_std)%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ccoef = [1,0.7629,0.7286,0.8285,0.909,0.899,0.8649,0.7884,...	
    0.8038,0.8527,0.8019,0.8528,0.8902,0.893,0.9723,0.9839,0.8976];
crmsd = [0,0.6120,0.7345,0.6120,0.5300,0.5796,0.5399,0.6248,0.6041,...	
    0.4890,0.5550,0.6186,0.6524,0.4589,0.2452,0.1726,0.4364];
sdev = [1,0.8097,0.9285,0.7625,1.2415,1.2845,0.8286,0.7886,0.8254,...	
    0.9704,0.9243,1.1800,1.3750,0.9901,0.9963,1.0260,0.9322];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CMAP','CHIRPS','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_norm.mat','ccoef','crmsd','sdev','ID');

%This is for Amazon River basin crop [-75 -52.5] [-13.5 1] UDEL ref
ccoef = [1,0.7472,0.7322,0.783,0.9147,0.9039,0.8564,0.7761,0.7969,...	
    0.8759,0.8407,0.8816,0.8951,0.9105,0.9711,0.9811,0.9024];
crmsd = [0,0.2995,0.7851,0.6244,0.6000,0.6422,0.5281,0.6306,0.6048,...	
    0.5022,0.5610,0.6245,0.7747,0.4461,0.2389,0.1940,0.4468];
sdev = [1,0.9356,1.1225,0.8385,1.3582,1.3830,0.9675,0.7817,0.8267,1.0152,...	
    0.9872,1.2905,1.5287,1.0781,0.9680,0.9926,1.0205];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CMAP','CHIRPS','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_UDEL2_norm.mat','ccoef','crmsd','sdev','ID')

%This is for Brazilian Amazon shp file crop with UDEL ref
ccoef = [1,0.7585,0.6852,0.7583,0.91,0.8987,0.8338,0.7317,0.7543,...	
    0.8613,0.8161,0.8516,0.8869,0.8931,0.9727,0.987,0.8936];
crmsd = [0,0.6518,0.7538,0.6520,0.5488,0.6030,0.5529,0.6817,0.6570,...	
    0.5229,0.5896,0.5865,0.6540,0.4565,0.2324,0.1634,0.4489];
sdev = [1,0.7483,0.8797,0.7699,1.2694,1.3125,0.8020,0.7410,0.7783,...	
    0.9848,0.9334,1.1145,1.3499,0.9708,0.9873,1.0174,0.9047];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CMAP','CHIRPS','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_UDEL3_norm.mat','ccoef','crmsd','sdev','ID')

%This is for Brazilian Amazon shp file crop with UDEL ref (with corrected
%time series for UDEL and CHIRPS) actual mm/day
ccoef = [1,0.7545,0.6825,0.7427,0.9087,0.898,0.8343,0.7204,0.7446,...	
    0.8665,0.8246,0.8572,0.8848,0.8932,0.9785,0.9873,0.8916];
crmsd = [0,0.6563,0.7571,0.6701,0.5519,0.6046,0.5523,0.6938,0.6684,...	
    0.5117,0.5753,0.5754,0.6580,0.4564,0.2065,0.1628,0.4530];
sdev = [1,0.7481,0.8802,0.7686,1.2696,1.3128,0.8026,0.7412,0.7785,...	
    0.9794,0.9289,1.1141,1.3495,0.9717,0.9842,1.0230,0.9045];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CMAP','CHIRPS','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_UDEL4_norm.mat','ccoef','crmsd','sdev','ID')

%This is for Legal Amazon of Brazil shp file crop with CHIRPS ref (with corrected
%time series for UDEL and CHIRPS) actual mm/day NORMALIZED
ccoef = [1,0.8575,0.8172,0.8545,0.9362,0.9297,0.9045,0.8306,0.8448,...
    0.9175,0.8765,0.8959,0.9256,0.9144,0.99,0.9849,0.9328];
crmsd = [0,0.5146,0.5932,0.5218,0.4811,0.5314,0.4264,0.5581,0.5353,...	
    0.3988,0.4817,0.5146,0.5508,0.4096,0.1415,0.1751,0.3612];
sdev = [1,0.8460,0.9574,0.8057,1.2648,1.3127,0.9047,0.7944,...	
    0.8281,0.9452,0.8926,1.1559,1.3258,0.9775,0.9784,0.9597,0.9554];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPS_norm.mat','ccoef','crmsd','sdev','ID')

%This is for Legal Brazilian Amazon shp file crop DRY SEASON with CHIRPS ref
ccoef = [1,0.1686,-0.0405,-0.1725,0,0.009,-0.0112,-0.1054,-0.0159,0.088,...
    0.1924,0.2758,0.1342,0.1577,0.9372,0.871,0.1619];
crmsd = [0,1.016825716,1.144148669,1.291059769,1.124058262,1.154947263,1.134354596,...
    1.110748368,1.1469111,1.064038172,1.002260171,1.024108488,1.103967855,1.158965344,...
    0.3782019086,0.5233550979,0.9869412356];
sdev = [1,0.4183827223,0.5170768458,0.6622300352,0.5138121547,0.5868910095,...
    0.5246107484,0.3895027624,0.5462079357,0.461828227,0.3962832747,0.6290808639,...
    0.6207935711,0.76469111,1.082872928,1.050979407,0.1803114013];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPSdry_norm.mat','ccoef','crmsd','sdev','ID')

%This is for Legal Brazilian Amazon shp file crop DRY SEASON with CHIRPS ref
%Using new version of STATS row 29-36 on Var_stats Dry_season tab
%THESE ARE NOT NORMALIZED
ccoef = [1,0.9366,0.9172,0.9333,0.9457,0.9453,0.922,0.9158,0.9202,...
    0.9317,0.9249,0.9409,0.9493,0.9388,0.9895,0.9828,0.9587];
crmsd = [0,0.8288,0.9152,0.8224,0.9983,1.0302,0.8552,0.9046,0.911,...
    0.8207,1.028,0.8522,1.1363,0.8859,0.3132,0.4016,0.6338];
sdev = [2.1748,1.7057,2.2961,2.2944,2.7654,2.8065,2.1651,2.2343,...
    2.3324,1.7972,1.3966,2.4791,2.9755,2.5183,2.1492,2.1053,2.2297];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPSdry_NEWSTATS_notnorm.mat','ccoef','crmsd','sdev','ID')

%This is for Legal Brazilian Amazon shp file crop DRY SEASON with CHIRPS ref
%Using new version of STATS row 38-42 on Var_stats Dry_season tab
%THESE ARE NORMALIZED
ccoef = [1,0.9366,0.9172,0.9333,0.9457,0.9453,0.922,0.9158,0.9202,...
    0.9317,0.9249,0.9409,0.9493,0.9388,0.9895,0.9828,0.9587];
crmsd = [0.00,0.38,0.42,0.38,0.46,0.47,0.39,0.42,...
    0.42,0.38,0.47,0.39,0.52,0.41,0.14,0.18,0.29];
sdev = [1.00,0.78,1.06,1.05,1.27,1.29,1.00,...
    1.03,1.07,0.83,0.64,1.14,1.37,1.16,0.99,0.97,1.03];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPSdry_NEWSTATS_norm.mat','ccoef','crmsd','sdev','ID')

%This is for Legal Brazilian Amazon shp file crop REGULAR with CHIRPS ref
%Using new version of STATS row 59-66 on Var_stats Precip(pr) tab
%THESE ARE NOT NORMALIZED
ccoef = [1,0.8575,0.8172,0.8545,0.9362,0.9297,0.9045,0.8306,0.8448,...
    0.9175,0.8765,0.8959,0.9256,0.9144,0.99,0.9849,0.9328];
crmsd = [0,1.4108,1.6263,1.4305,1.3189,1.4567,1.1689,1.53,...
    1.4675,1.0932,1.3205,1.4109,1.5099,1.1229,0.388,0.4801,0.9901];
sdev = [2.7448,2.3223,2.6279,2.2116,3.4716,3.6031,2.4831,2.1804,...
    2.2731,2.5945,2.4501,3.1728,3.6391,2.6832,2.6855,2.6342,2.6223];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPS_NEWSTATS_notnorm.mat','ccoef','crmsd','sdev','ID')

%This is for NAZ Northern Amazon mask 408 time series with CHIRPS ref
%Using new version of STATS row 68-79 on Var_stats Precip(pr) tab
%THESE ARE NORMALIZED
ccoef = [1	0.2345	0.1659	0.5547	0.7178	0.7218	0.3502,...
    0.2685	0.3109	0.5473	0.4069	0.6727	0.6988	0.7779	0.9728	0.9675	0.6792];
crmsd = [0.000	1.012	1.150	0.969	0.822	0.836	0.982,...
    1.118	1.081	0.930	1.056	0.787	0.841	0.632	0.232	0.253	0.734];
sdev = [1.000	0.517	0.758	1.051	1.155	1.191	0.646,...
    0.835	0.827	0.953	0.937	0.941	1.142	0.849	0.968	0.949	0.705];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPS_NAZ_norm.mat','ccoef','crmsd','sdev','ID')

%This is for SAZ Southern Amazon mask 408 time series with CHIRPS ref
%Using new version of STATS row 81-92 on Var_stats Precip(pr) tab
%THESE ARE NORMALIZED
ccoef = [1	0.9302	0.9041	0.9107	0.9499	0.9474	0.9409,...
    0.9247	0.9289	0.9367	0.9214	0.9427	0.9637	0.9145	0.9892	0.9811	0.9661];
crmsd = [0.000	0.386	0.449	0.414	0.385	0.401	0.346,...
    0.381	0.373	0.382	0.457	0.514	0.531	0.406	0.148	0.202	0.261];
sdev = [1.000	1.050	1.043	0.886	1.175	1.189	1.012,...
    0.947	0.973	0.785	0.681	1.333	1.423	0.951	0.971	0.924	1.000];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Pr_stats_CHIRPS_SAZ_norm.mat','ccoef','crmsd','sdev','ID')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  CREATE TAYLOR DIAGRAM FOR PR   %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Close any previously open graphics windows
close all;

% Set the figure properties
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
% set(gcf,'DefaultLineLineWidth',1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text

% Read in data from a mat file: sdev, crmsd, ccoef, and ID
%PICK CORRECT ONE!!!!
load('Pr_stats.mat');
load('Pr_stats_norm.mat'); 
load('Pr_stats_UDEL2_norm.mat');   %Amazon river basin norm
load('Pr_stats_UDEL3_norm.mat');   %Brazilian Amazon shp (terrabrasilis)
load('Pr_stats_UDEL4_norm.mat');   %Brazilian Amazon shp (terrabrasilis) (corrected UDEL/CHIRPS mm//day)
load('Pr_stats_CHIRPS_norm.mat');  %Legal Amazon of Brazil shp (terrabrasilis) CHIRPS obs, mm/day
load('Pr_stats_CHIRPSdry_norm.mat');  %Legal Amazon of Brazil shp (terrabrasilis) CHIRPS DRY SEASON obs, mm/day
load('Pr_stats_CHIRPSdry_NEWSTATS_notnorm.mat');  %Legal Amazon of Brazil shp (terrabrasilis) CHIRPS DRY SEASON obs, mm/day. NEW STATS. NOT NORM
load('Pr_stats_CHIRPS_NEWSTATS_notnorm.mat'); %Legal,not norm, new stats, all 31 years
load('Pr_stats_CHIRPSdry_NEWSTATS_norm.mat'); %legal, norm, new stats, dry season
load('Pr_stats_CHIRPS_NAZ_norm.mat'); %NAZ, norm, 408 time series
load('Pr_stats_CHIRPS_SAZ_norm.mat'); %SAZ, norm, 408 time series

% Specify labels for points in a cell array using gage ID.
label = ID;

% Produce the Taylor diagram.
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%	>> taylor_diagram
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,... 
    'markerLegend', 'on', ...
    'alpha',0,...
    'styleSTD', '-',...
    'colOBS','m',...
    'markerObs','o', ...
    'styleOBS','-.',...
    'widthOBS',3,...
    'markerSize',10,...
    'tickRMSangle',120,...
    'tickRMS',0.0:0.5:1.5,...   %make sure to change RMS tick marks!
    'showlabelsRMS', 'on', ...
    'rmslabelformat','%.1f',...
    'titleRMS','on',...
    'titleRMSDangle',150,...
    'titleOBS','Ref: CHIRPS');   %make sure to change ref title

% Write plot to file (PICK CORRECT ONE!!!!)
writepng(gcf,'Taylor_pr.png');
writepng(gcf,'Taylor_pr_norm_amazonia.png');


%%%%  TAYLOR SKILL SCORE BAR GRAPH
%%%% From Var_stats line 80 and 93 tab Stats (use THIS) NAZ and SAZ

%NAZ taylor skill score
X = categorical({'BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'});
%X = reordercats(X,{'Small','Medium','Large','Extra Large'});
Y = [0.41	0.54	0.78	0.84	0.84	0.56	0.61	0.63...
    0.77	0.70	0.83	0.83	0.87	0.99	0.98	0.74];

figure
bar(X,Y,'FaceColor',[0 .5 .5],'EdgeColor',[0 .5 .5])
ylabel('Taylor Skill Score')
ylim([0 1])
title('NAZ Taylor Skill Score','fontSize',12);

%SAZ taylor skill score
X2 = categorical({'BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','UDEL','CMAP','Ensemble Mean'});
%X = reordercats(X,{'Small','Medium','Large','Extra Large'});
Y2 = [0.96	0.95	0.94	0.95	0.95	0.97	0.96	0.96...
    0.91	0.83	0.90	0.87	0.95	0.99	0.98	0.98];

figure
bar(X2,Y2,'FaceColor','#F4A460','EdgeColor','#F4A460')
ylabel('Taylor Skill Score')
ylim([0 1])
title('SAZ Taylor Skill Score','fontSize',12);


%second version of Skill SCore. Use this for combined skill score graph
%This is withough CMAP or UDEL
%Then edit it through the Property Inspector
%Colors: SAZ (#F4A460) NAZ (0 .5 .5)
model_series = [0.47 0.97; 0.55	0.95; 0.79 0.96;0.87	0.92;0.86	0.91;0.65	0.96;0.63	0.96;0.65 0.97...
    ;0.82	0.94;0.76	0.88;0.85	0.89;0.86	0.87;0.88	0.96;0.79 0.98];
figure
b = bar(model_series,'grouped');
ylabel('Taylor Skill Score')
ylim([0 1])
legend('NAZ','SAZ','Fontsize',10,'Location','northeastoutside')
title('Taylor Skill Score','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean'})
xtickangle(45)
hold off;


%This is MFC ratio bar plot (Var_stats MRC_split data)
%This is withought CHIRPS CMAP or UDEL, but with NOAA & GLDAS
%Then edit it through the Property Inspector
%Colors: SAZ (0.13 0.05 0.53) NAZ (0.22 0.73 0.26)
model_series = [2.02 1.75; 1.7 1.36;0.91 1.71; 1.21 1.94; 1.2 1.3; 1.7 1.58; 1.71 1.6; 1.29 1.58...
    ;1.41 1.58; 1.42 1.6; 1.19 1.27; 1.13 1.19; 1.47 1.47; 1.46 1.53; 1.25 1.29; 1.33 1.52];
figure
b = bar(model_series,'grouped');
ylabel('pr/et')
ylim([0 2.2])
legend('NAZ','SAZ','Fontsize',10,'Location','northeastoutside')
%title('MFC Ratio (pr/et)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'GLDAS','20cRv2C','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean'})
xtickangle(45)
hold off;


%This is MFC ratio bar plot (Var_stats MRC_split data)
%This is withought CHIRPS CMAP or UDEL, but with NOAA only!!!!!
%Then edit it through the Property Inspector
%Colors: SAZ (0.13 0.05 0.53) NAZ (0.22 0.73 0.26)
model_series = [1.39 1.67;0.91 1.71; 1.21 1.94; 1.2 1.3; 1.7 1.58; 1.71 1.6; 1.29 1.58...
    ;1.41 1.58; 1.42 1.6; 1.19 1.27; 1.13 1.19; 1.47 1.47; 1.46 1.53; 1.25 1.29; 1.33 1.52];
figure
b = bar(model_series,'grouped');
ylabel('pr/et')
ylim([0 2.2])
legend('NAZ','SAZ','Fontsize',10,'Location','northeastoutside')
%title('MFC Ratio (pr/et)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15])
xticklabels({'20cRv2C','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean'})
xtickangle(45)
hold off;



%This is NAZ Et/Pr ratio stacked bar plot (Var_stats 'Copy of MRC_split data')
%This is withought CHIRPS CMAP or UDEL, but with NOAA only!!!!!
%Then edit it through the Property Inspector
%Colors: ET/PR (0.22 0.73 0.28) MFC/PR (0.39 0.62 0.79)
model_series = [0.59 0.41;0.5 0.5;0.91 0.09; 0.83 0.17; 0.84 0.16; 0.59 0.41; 0.59 0.41;...
    0.77 0.23; 0.71 0.29; 0.70 0.3; 0.84 0.16; 0.88 0.12; 0.68 0.32; 0.68 0.32;0.8 0.2; 0.75 0.25];
figure
b = bar(model_series,'stacked');
%ylabel('et/pr')
ylim([0 1.2])
yline(0.54, 'r', 'LineWidth', 2);
yline(0.75, 'k--', 'LineWidth', 2);
legend('ET/PR','MFC/PR','Obs Mean','Ensemble Mean','Fontsize',10,'Location','northeastoutside')
title('Ratio Analysis NAZ','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'20cRv2C','GLDAS','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean'})
xtickangle(45)
hold off;

%This is SAZ Et/Pr ratio stacked bar plot (Var_stats 'Copy of MRC_split data')
%This is withought CHIRPS CMAP or UDEL, but with NOAA only!!!!!
%Then edit it through the Property Inspector
%Colors: ET/PR (0.22 0.73 0.28) MFC/PR (0.39 0.62 0.79)
model_series = [0.74 0.26;0.57 0.43;0.58 0.42; 0.52 0.48;0.77 0.23;0.63 0.37; 0.63 0.37; 0.63 0.37;...
    0.63 0.37;0.63 0.37; 0.79 0.21; 0.84 0.16; 0.68 0.32; 0.65 0.35; 0.77 0.23; 0.66 0.34];
figure
b = bar(model_series,'stacked');
%ylabel('et/pr')
ylim([0 1.2])
yline(0.65, 'r', 'LineWidth', 2);
yline(0.66, 'k--', 'LineWidth', 2);
legend('ET/PR','MFC/PR','Obs Mean','Ensemble Mean','Fontsize',10,'Location','northeastoutside')
title('Ratio Analysis SAZ','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16])
xticklabels({'20cRv2C','GLDAS','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean'})
xtickangle(45)
hold off;









%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%     TEMP VALIDATION         %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%




% Get a list of all nc files in the current folder or subfolder
%MOD= pr,tas & OBS= precip (all), air (CAMS,UDEL), tmp (CRU)
%All have lat, lon, time

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%   TRY tas OBS FIRST  (temp. var)  %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all;
close all;
clc;
%Change current folder to Final_Files
cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6\Final_Files'

%UDEL (air), CRU (tmp), and CAMS for temperature (tas)
%All have 432 time steps 1979-2014 monthly sfc temp
ncdisp 'UDEL_tas.nc'
ncdisp 'CRU_tas.nc'
ncdisp 'CAMS_tas.nc'

lat = double(ncread('UDEL_tas.nc','lat'));
lon = double(ncread('UDEL_tas.nc','lon'));
UDELtas = double(ncread('UDEL_tas.nc','air'));
CRUtas = double(ncread('CRU_tas.nc','tmp'));
CAMStas = double(ncread('CAMS_tas.nc','air'));

%'hours since 1900-1-1 0:0:0' UDEL
%'days since 1900-1-1' CRU
%'hours since 1800-01-01 00:00:0.0' CAMS
UDELt = double(ncread('UDEL_tas.nc','time'));   %get time
CRUt = double(ncread('CRU_tas.nc','time'));   %get time
CAMSt = double(ncread('CAMS_tas.nc','time'));   %get time

UDELt = datenum(1900,1,1,UDELt,0,0);
CRUt = datenum(1900,1,CRUt);
CAMSt = datenum(1800,1,1,CAMSt,0,0);

%Check times
UDELt=datetime(UDELt,'ConvertFrom','datenum');
UDELt = datenum(UDELt);

%Save OBS tas nc files as mat
UDELtas = permute(UDELtas,[2 1 3]);
save('UDEL_tas.mat','lat','lon','UDELt','UDELtas')

CRUtas = permute(CRUtas,[2 1 3]);
save('CRU_tas.mat','lat','lon','CRUt','CRUtas')

CAMStas = permute(CAMStas,[2 1 3]);
save('CAMS_tas.mat','lat','lon','CAMSt','CAMStas')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%  NOW MOD tas (tas) %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%  lat, lon, time should all be the same %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ncdisp BCC-CSM2-MR_tas_ensmean.nc

%Load in lat/lon/time for ALL mod tas nc files
lat = double(ncread('BCC-CSM2-MR_tas_ensmean.nc','lat'));
lon = double(ncread('BCC-CSM2-MR_tas_ensmean.nc','lon'));
%'days since 1850-01-01'
modtime = double(ncread('BCC-CSM2-MR_tas_ensmean.nc','time'));
modtime = datenum(1850,1,modtime);

%Load individual tas nc files for each model ensmean
BCCCSM2MRtas = double(ncread('BCC-CSM2-MR_tas_ensmean.nc','tas'));
BCCESM1tas = double(ncread('BCC-ESM1_tas_ensmean.nc','tas'));
CanESM5tas = double(ncread('CanESM5_tas_ensmean.nc','tas'));
CESM2tas = double(ncread('CESM2_tas_ensmean.nc','tas'));
CESM2WACCMtas = double(ncread('CESM2-WACCM_tas_ensmean.nc','tas'));
E3SM10tas = double(ncread('E3SM-1-0_tas_ensmean.nc','tas'));
ECEarth3tas = double(ncread('EC-Earth3_tas_ensmean.nc','tas'));
ECEarth3Vegtas = double(ncread('EC-Earth3-Veg_tas_ensmean.nc','tas'));
GISSE21Gtas = double(ncread('GISS-E2-1-G_tas_ensmean.nc','tas'));
GISSE21Htas = double(ncread('GISS-E2-1-H_tas_ensmean.nc','tas'));
MIROC6tas = double(ncread('MIROC6_tas_ensmean.nc','tas'));
MRIESM20tas = double(ncread('MRI-ESM2-0_tas_ensmean.nc','tas'));
SAM0UNICONtas = double(ncread('SAM0-UNICON_tas_ensmean.nc','tas'));

%Save MOD tas nc files as mat
BCCCSM2MRtas = permute(BCCCSM2MRtas,[2 1 3]);
save('BCCCSM2MR_tas.mat','lat','lon','modtime','BCCCSM2MRtas')

BCCESM1tas = permute(BCCESM1tas,[2 1 3]);
save('BCCESM1_tas.mat','lat','lon','modtime','BCCESM1tas')

CanESM5tas = permute(CanESM5tas,[2 1 3]);
save('CanESM5_tas.mat','lat','lon','modtime','CanESM5tas')

CESM2tas = permute(CESM2tas,[2 1 3]);
save('CESM2_tas.mat','lat','lon','modtime','CESM2tas')

CESM2WACCMtas = permute(CESM2WACCMtas,[2 1 3]);
save('CESM2WACCM_tas.mat','lat','lon','modtime','CESM2WACCMtas')

E3SM10tas = permute(E3SM10tas,[2 1 3]);
save('E3SM10_tas.mat','lat','lon','modtime','E3SM10tas')

ECEarth3tas = permute(ECEarth3tas,[2 1 3]);
save('ECEarth3_tas.mat','lat','lon','modtime','ECEarth3tas')

ECEarth3Vegtas = permute(ECEarth3Vegtas,[2 1 3]);
save('ECEarth3Veg_tas.mat','lat','lon','modtime','ECEarth3Vegtas')

GISSE21Gtas = permute(GISSE21Gtas,[2 1 3]);
save('GISSE21G_tas.mat','lat','lon','modtime','GISSE21Gtas')

GISSE21Htas = permute(GISSE21Htas,[2 1 3]);
save('GISSE21H_tas.mat','lat','lon','modtime','GISSE21Htas')

MIROC6tas = permute(MIROC6tas,[2 1 3]);
save('MIROC6_tas.mat','lat','lon','modtime','MIROC6tas')

MRIESM20tas = permute(MRIESM20tas,[2 1 3]);
save('MRIESM20_tas.mat','lat','lon','modtime','MRIESM20tas')

SAM0UNICONtas = permute(SAM0UNICONtas,[2 1 3]);
save('SAM0UNICON_tas.mat','lat','lon','modtime','SAM0UNICONtas')



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   LOAD .mat files for tas OBS + MOD  %%%%%%%%%%%%%%%
%%%%%%%%   LOAD lon lat and obs time, modtime   %%%%%%%%%%%%%%%%%%%%
%%%%%%%%   MOD is modeled data OBS is observed  %%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% BCCCSM2MR	
% BCCESM1 	
% CanESM5 
% CESM2 		
% CESM2WACCM 	
% E3SM10	
% ECEarth3
% ECEarth3Veg
% GISSE21G 
% GISSE21H
% MIROC6 
% MRIESM20 
% SAM0UNICON 

clear all;
close all;
clc;
%Change current folder to Final_Files
cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6\Final_Files'
%Load in lat/lon/time for all files using 1 file (all the same lat/lon)
lat = double(ncread('.\MOD\BCC-CSM2-MR_tas_ensmean.nc','lat'));
lon = double(ncread('.\MOD\BCC-CSM2-MR_tas_ensmean.nc','lon'));

%THIS IS MOD TAS TIMES
%'days since 1850-01-01' (all the same for MOD)
modtime = double(ncread('.\MOD\BCC-CSM2-MR_tas_ensmean.nc','time'));
modtime = datenum(1850,1,modtime);

%THIS IS OBS TAS TIMES (this is diff for each obs dataset)
%'hours since 1900-1-1 0:0:0' UDEL
%'days since 1900-1-1' CRU
%'hours since 1800-01-01 00:00:0.0' CAMS
UDELt = double(ncread('.\OBS\UDEL_tas.nc','time'));   %get time
CRUt = double(ncread('.\OBS\CRU_tas.nc','time'));   %get time
CAMSt = double(ncread('.\OBS\CAMS_tas.nc','time'));   %get time

UDELt = datenum(1900,1,1,UDELt,0,0);
CRUt = datenum(1900,1,CRUt);
CAMSt = datenum(1800,1,1,CAMSt,0,0);

% Load in MOD tas mat files in MOD folder
fds = fileDatastore('.\MOD\*tas.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%Load in OBS tas mat files in OBS folder
fds2 = fileDatastore('.\OBS\*tas.mat', 'ReadFcn', @importdata);
fullFileNames2 = fds2.Files;
numFiles2 = length(fullFileNames2);
for k = 1 : numFiles2
    fprintf('Now reading file %s\n', fullFileNames2{k});
    load(fullFileNames2{k});
end

%Turn lat/lon into grid
[Lon,Lat] = meshgrid(lon,lat);

%load basic image of mean
figure
pcolor(Lon,Lat,mean(CanESM5tas,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 30])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Mask out all points that correspond to ocean (set ocean grid cells to NaN)
%new name for each dataset includes 'm' for mask
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
land = island(Lat,Lon);
ocean = ~land;   %ocean is NOT land

UDELm = mask3(UDELtas,ocean);
CRUm = mask3(CRUtas,ocean);
CAMSm= mask3(CAMStas,ocean);

BCCCSM2MRm = mask3(BCCCSM2MRtas,ocean);
BCCESM1m = mask3(BCCESM1tas,ocean);
CanESM5m = mask3(CanESM5tas,ocean);
CESM2m	= mask3(CESM2tas,ocean);
CESM2WACCMm = mask3(CESM2WACCMtas,ocean);
E3SM10m = mask3(E3SM10tas,ocean);
ECEarth3m = mask3(ECEarth3tas,ocean);
ECEarth3Vegm = mask3(ECEarth3Vegtas,ocean);
GISSE21Gm = mask3(GISSE21Gtas,ocean);
GISSE21Hm = mask3(GISSE21Htas,ocean);
MIROC6m = mask3(MIROC6tas,ocean);
MRIESM20m = mask3(MRIESM20tas,ocean);
SAM0UNICONm = mask3(SAM0UNICONtas,ocean);

%Replot with masked out ocean (change mod/obs) to quick check
%REMEMBER THAT mod/obs are in c
figure
pcolor(Lon,Lat,mean(UDELm,3))
shading interp
axis tight
cmocean thermal
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 30])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%   Create plots for 35-year annual mean temperature       %%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%subplot(6,3,1); pcolor(Lon,Lat,mean(UDELm,3))
figure
pcolor(Lon,Lat,mean(SAM0UNICONm,3))
shading interp
axis tight
cmocean thermal
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 30])



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%% THESE ARE SHAPEFILE CROPS  %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
S = shaperead('..\Shapefiles\Amazon_Basin\amazon_basin.shp');  %Amazon basin shapefile
mapshow(S)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude

%This is all of the Brazilian biomes
A = shaperead('..\Shapefiles\Amazon_biome\biome.shp','Selector'...
    {@(v1) (v1 == 1),'ID'});  %Amazon biome shapefile
mapshow(A)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude

%This is the Amazonian Brazilian biome
B = shaperead('..\Shapefiles\Amazon_biome\biome.shp','Selector',...
    {@(v1) (v1 == 1),'ID'});  %Amazon biome shapefile Brazilian outline
mapshow(B)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude

%Now use the shapefile to CROP (c) the nc files
%Use maskregion to do this
%new name for each dataset includes 'c' for crop

% filelon = lon2;
% filelat = lat;
% filevar = UDELp;
% W = S;
% varout = UDELc;

% [xx,yy]=meshgrid(filelon,filelat);
% index=zeros(size(filevar,2),size(filevar,1));
% for kk=1:length(W)
%     out=[W(kk).X ;W(kk).Y]';
%     aa=inpolygon(xx,yy,out(:,1),out(:,2)) +0;
%     try
%         index=index+aa;
%     catch
%         index=index+aa';
%     end
% end
% index(index==0)=nan;
% for kk=1:size(filevar,3)
%     varout(:,:,kk)=filevar(:,:,kk).*index';
% end
% end

%Use B- the amazonia brazil crop
lon2 = lon-360;
UDELc = maskregion(lon2,lat,UDELm,B);  %does this one need to be divided by 10?

UDELc = (maskregion(lon2,lat,UDELm,B))./10;
CRUc = (maskregion(lon2,lat,CRUm,S))./10;
CAMSc = (maskregion(lon2,lat,CAMSm,S))./10;

BCCCSM2MRc = (maskregion(lon2,lat,BCCCSM2MRm,S))./10;
BCCESM1c = (maskregion(lon2,lat,BCCESM1m,S))./10;
CanESM5c = (maskregion(lon2,lat,CanESM5m,S))./10;
CESM2c	= (maskregion(lon2,lat,CESM2m,S))./10;
CESM2WACCMc = (maskregion(lon2,lat,CESM2WACCMm,S))./10;
E3SM10c = (maskregion(lon2,lat,E3SM10m,S))./10;
ECEarth3c = (maskregion(lon2,lat,ECEarth3m,S))./10;
ECEarth3Vegc = (maskregion(lon2,lat,ECEarth3Vegm,S))./10;
GISSE21Gc = (maskregion(lon2,lat,GISSE21Gm,S))./10;
GISSE21Hc = (maskregion(lon2,lat,GISSE21Hm,S))./10;
MIROC6c = (maskregion(lon2,lat,MIROC6m,S))./10;
MRIESM20c = (maskregion(lon2,lat,MRIESM20m,S))./10;
SAM0UNICONc = (maskregion(lon2,lat,SAM0UNICONm,S))./10;

%permute back to correct lat lon time (220,261,432)
%Do not need this anymore
%UDELcorrect = permute(UDELc,[2 1 3]);

figure
pcolor(lon2,lat,mean(UDELc,3))
shading interp
axis tight
cmocean thermal
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([20 28])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create a mask to crop to smaller domain and plot mask to check domain
%Amd use local function to get time series of monthly data   %%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% mask = geomask(Lat,Lon,[-14 2],[-68 -50]);  %just a square for amazonia
% mask = geomask(Lat,Lon,[-13.5 -2],[-66 -59]);  %just a square for rondonia + western amazona
% mask = geomask(Lat,Lon,[-12 0.5],[-69 -57]);  %amazonia
mask = geomask(Lat,Lon,[-13.5 1],[-75 -52.5]);  %amazonia

imagescn(Lon,Lat,mask)   %just for box mask
axis xy tight
title 'Amazon mask'
xlabel 'longitude'
ylabel 'latitude'
ax = axis;
borders('countries')
axis(ax)


%Use local function to get tas time series of masked domain
%THIS USES THE MASK FUNCTION (boxed region)
UDELts = local(UDELm,mask,'omitnan');
CRUts = local(CRUm,mask,'omitnan');
CAMSts = local(CAMSm,mask,'omitnan');
% %Create CHIRPS time vector
% StartDate = datetime(1981,01,01);
% EndDate = datetime(2014,12,31);
% CHIRPSt= StartDate:calmonths(1):EndDate;

BCCCSM2MRts = local(BCCCSM2MRm,mask,'omitnan');
BCCESM1ts = local(BCCESM1m,mask,'omitnan');
CanESM5ts = local(CanESM5m,mask,'omitnan');
CESM2ts	= local(CESM2m,mask,'omitnan');
CESM2WACCMts = local(CESM2WACCMm,mask,'omitnan');
E3SM10ts = local(E3SM10m,mask,'omitnan');
ECEarth3ts = local(ECEarth3m,mask,'omitnan');
ECEarth3Vegts = local(ECEarth3Vegm,mask,'omitnan');
GISSE21Gts = local(GISSE21Gm,mask,'omitnan');
GISSE21Hts = local(GISSE21Hm,mask,'omitnan');
MIROC6ts = local(MIROC6m,mask,'omitnan');
MRIESM20ts = local(MRIESM20m,mask,'omitnan');
SAM0UNICONts = local(SAM0UNICONm,mask,'omitnan');

Ensemblets = [BCCCSM2MRts,BCCESM1ts,CanESM5ts,CESM2ts,CESM2WACCMts,...
    E3SM10ts,ECEarth3ts,ECEarth3Vegts,GISSE21Gts,GISSE21Hts,MIROC6ts,...
    MRIESM20ts,SAM0UNICONts];

EnsembleMeants = mean(Ensemblets,2);  %calc Ensemble mean (keep rows)


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Create mean monthly tas over the time period using timeseries%%
%%%%%%% use reshapetimeseries and doy to calculuate this series%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% cla;
% plot(doy(modtime),UDELts);

% BCCCSM2MR	
% BCCESM1 	
% CanESM5 
% CESM2 		
% CESM2WACCM 	
% E3SM10	
% ECEarth3
% ECEarth3Veg
% GISSE21G 
% GISSE21H
% MIROC6 
% MRIESM20 
% SAM0UNICON 

%t = datenum('jan 1, 1979'):datenum('dec 31, 2014');

UDELtasavg = season(UDELts,modtime,'monthly');
CRUtasavg = splitapply(@nanmean, CRUts,g);
CAMStasavg = splitapply(@nanmean, CAMSts,g);
BCCCSM2MRtasavg = splitapply(@nanmean, BCCCSM2MRts,g);
BCCESM1tasavg = splitapply(@nanmean, BCCESM1ts,g);
CanESM5tasavg = splitapply(@nanmean, CanESM5ts,g);
CESM2tasavg = splitapply(@nanmean, CESM2ts,g);
CESM2WACCMtasavg = splitapply(@nanmean, CESM2WACCMts,g);
E3SM10tasavg = splitapply(@nanmean, E3SM10ts,g);
ECEarth3tasavg = splitapply(@nanmean, ECEarth3ts,g);
ECEarth3Vegtasavg = splitapply(@nanmean, ECEarth3Vegts,g);
GISSE21Gtasavg = splitapply(@nanmean, GISSE21Gts,g);
GISSE21Htasavg = splitapply(@nanmean, GISSE21Hts,g);
MIROC6tasavg = splitapply(@nanmean, MIROC6ts,g);
MRIESM20tasavg = splitapply(@nanmean, MRIESM20ts,g);
SAM0UNICONtasavg = splitapply(@nanmean, SAM0UNICONts,g);
EnsembleMeantasavg = splitapply(@nanmean, EnsembleMeants,g);


figure
plot(season(UDELts,modtime,'monthly'),'-+r')
box off
axis tight
xlabel 'month of year'
ylabel 'seasonal temperature cycle'
hold on
plot(season(CRUts,modtime,'monthly'),'-ok');
hold on
plot(season(CAMSts,modtime,'monthly'),'-+b');
hold on
plot(season(BCCCSM2MRts,modtime,'monthly'),'-xk');
hold on
plot(season(BCCESM1ts,modtime,'monthly'),'-pm');
hold on
plot(season(CanESM5ts,modtime,'monthly'),'-*c');
hold on
plot(season(CESM2ts,modtime,'monthly'),'--sm');
hold on
plot(season(CESM2WACCMts,modtime,'monthly'),':xk');
hold on
plot(season(E3SM10ts,modtime,'monthly'),'-.og');
hold on
plot(season(ECEarth3ts,modtime,'monthly'),':>r');
hold on
plot(season(ECEarth3Vegts,modtime,'monthly'),'-hb');
hold on
plot(season(GISSE21Gts,modtime,'monthly'),'--pr');
hold on
plot(season(GISSE21Hts,modtime,'monthly'),'-xb');
hold on
plot(season(MIROC6ts,modtime,'monthly'),'--*r');
hold on
plot(season(MRIESM20ts,modtime,'monthly'),'-.b');
hold on
plot(season(SAM0UNICONts,modtime,'monthly'),'-dk');
hold on
plot(season(EnsembleMeants,modtime,'monthly'),'-sm');
legend('UDEL','CRU','CAMS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%Get annual ts from monthly ts using timetable and retime%%%%%%%
%%%%%%% tt is for TimeTable and tt2 is for the annual time series%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %Create model time vector
StartDate = datetime(1979,01,01);
EndDate = datetime(2014,12,31);
modtime= StartDate:calmonths(1):EndDate;
modtimeColumn = modtime.';

%Create timetable (tt) and then aggregate (tt2)
UDELtt = timetable(modtimeColumn,UDELts);
UDELtt2 = retime(UDELtt,'yearly','mean');
UDELannual = timetable2table(UDELtt2);
UDELannual2 = table2array(UDELannual(:,[2]));

CRUtt = timetable(modtimeColumn,CRUts);
CRUtt2 = retime(CRUtt,'yearly','mean');
CRUannual = timetable2table(CRUtt2);
CRUannual2 = table2array(CRUannual(:,[2]));

CAMStt = timetable(modtimeColumn,CAMSts);
CAMStt2 = retime(CAMStt,'yearly','mean');
CAMSannual = timetable2table(CAMStt2);
CAMSannual2 = table2array(CAMSannual(:,[2]));

BCCCSM2MRtt = timetable(modtimeColumn,BCCCSM2MRts);
BCCCSM2MRtt2 = retime(BCCCSM2MRtt,'yearly','mean');
BCCCSM2MRannual = timetable2table(BCCCSM2MRtt2);
BCCCSM2MRannual2 = table2array(BCCCSM2MRannual(:,[2]));

BCCESM1tt = timetable(modtimeColumn,BCCESM1ts);
BCCESM1tt2 = retime(BCCESM1tt,'yearly','mean');
BCCESM1annual = timetable2table(BCCESM1tt2);
BCCESM1annual2 = table2array(BCCESM1annual(:,[2]));

CanESM5tt = timetable(modtimeColumn,CanESM5ts);
CanESM5tt2 = retime(CanESM5tt,'yearly','mean');
CanESM5annual = timetable2table(CanESM5tt2);
CanESM5annual2 = table2array(CanESM5annual(:,[2]));

CESM2tt	= timetable(modtimeColumn,CESM2ts);
CESM2tt2 = retime(CESM2tt,'yearly','mean');
CESM2annual = timetable2table(CESM2tt2);
CESM2annual2 = table2array(CESM2annual(:,[2]));

CESM2WACCMtt = timetable(modtimeColumn,CESM2WACCMts);
CESM2WACCMtt2 = retime(CESM2WACCMtt,'yearly','mean');
CESM2WACCMannual = timetable2table(CESM2WACCMtt2);
CESM2WACCMannual2 = table2array(CESM2WACCMannual(:,[2]));

E3SM10tt = timetable(modtimeColumn,E3SM10ts);
E3SM10tt2 = retime(E3SM10tt,'yearly','mean');
E3SM10annual = timetable2table(E3SM10tt2);
E3SM10annual2 = table2array(E3SM10annual(:,[2]));

ECEarth3tt = timetable(modtimeColumn,ECEarth3ts);
ECEarth3tt2 = retime(ECEarth3tt,'yearly','mean');
ECEarth3annual = timetable2table(ECEarth3tt2);
ECEarth3annual2 = table2array(ECEarth3annual(:,[2]));

ECEarth3Vegtt = timetable(modtimeColumn,ECEarth3Vegts);
ECEarth3Vegtt2 = retime(ECEarth3Vegtt,'yearly','mean');
ECEarth3Vegannual = timetable2table(ECEarth3Vegtt2);
ECEarth3Vegannual2 = table2array(ECEarth3Vegannual(:,[2]));

GISSE21Gtt = timetable(modtimeColumn,GISSE21Gts);
GISSE21Gtt2 = retime(GISSE21Gtt,'yearly','mean');
GISSE21Gannual = timetable2table(GISSE21Gtt2);
GISSE21Gannual2 = table2array(GISSE21Gannual(:,[2]));

GISSE21Htt = timetable(modtimeColumn,GISSE21Hts);
GISSE21Htt2 = retime(GISSE21Htt,'yearly','mean');
GISSE21Hannual = timetable2table(GISSE21Htt2);
GISSE21Hannual2 = table2array(GISSE21Hannual(:,[2]));

MIROC6tt = timetable(modtimeColumn,MIROC6ts);
MIROC6tt2 = retime(MIROC6tt,'yearly','mean');
MIROC6annual = timetable2table(MIROC6tt2);
MIROC6annual2 = table2array(MIROC6annual(:,[2]));

MRIESM20tt = timetable(modtimeColumn,MRIESM20ts);
MRIESM20tt2 = retime(MRIESM20tt,'yearly','mean');
MRIESM20annual = timetable2table(MRIESM20tt2);
MRIESM20annual2 = table2array(MRIESM20annual(:,[2]));

SAM0UNICONtt = timetable(modtimeColumn,SAM0UNICONts);
SAM0UNICONtt2 = retime(SAM0UNICONtt,'yearly','mean');
SAM0UNICONannual = timetable2table(SAM0UNICONtt2);
SAM0UNICONannual2 = table2array(SAM0UNICONannual(:,[2]));

EnsembleMeantt = timetable(modtimeColumn,EnsembleMeants); 
EnsembleMeantt2 = retime(EnsembleMeantt,'yearly','mean');
EnsembleMeanannual = timetable2table(EnsembleMeantt2);
EnsembleMeanannual2 = table2array(EnsembleMeanannual(:,[2]));

%Plot ANNUAL TEMP mod and obs time series(CHECK UNITS!!!!)
%All obs and mod are deg c
%Change datenum to actual calendar dates
% modtime = datetime(modtime,'ConvertFrom','datenum');
StartDate = datetime(1979,01,01);
EndDate = datetime(2014,12,31);
annualtime= StartDate:calyears(1):EndDate;

figure
plot(annualtime,BCCCSM2MRannual2,'-+r')
title('Annual Tempearture 1979-2014')
xlabel('Time (years)')
ylabel('Temperature (°C)')
grid
hold on 
plot(annualtime,BCCESM1annual2,'-ok')
hold on
plot(annualtime,CanESM5annual2,'-*b')
hold on
plot(annualtime,CESM2annual2,'-xk')
hold on
plot(annualtime,CESM2WACCMannual2,'-pm')
hold on
plot(annualtime,E3SM10annual2,'-*c')
hold on 
plot(annualtime,ECEarth3annual2,'--sm')
hold on
plot(annualtime,ECEarth3Vegannual2,':xk')
hold on
plot(annualtime,GISSE21Gannual2,'-.og')
hold on
plot(annualtime,GISSE21Hannual2,':>r')
hold on
plot(annualtime,MIROC6annual2,'-hb')
hold on
plot(annualtime,MRIESM20annual2,'--pr')
hold on
plot(annualtime,SAM0UNICONannual2,'-xb')
hold on
plot(annualtime,EnsembleMeanannual2,'--*r')
hold on
plot(annualtime,UDELannual2,'-.b')
hold on
plot(annualtime,CAMSannual2,'-dk')
hold on
plot(annualtime,CRUannual2,'-sm')
legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CAMS','CRU')



% %Plot mod and obs time series(CHECK UNITS!!!!)
% %All obs and mod are deg c
% %Change datenum to actual calendar dates
% modtime = datetime(modtime,'ConvertFrom','datenum');
% figure
% plot(modtime,BCCCSM2MRts,'-+r')
% title('TEMP 1979-2014 lon[-66,-59] lat[-13.5 -2]')
% xlabel('Time (years)')
% ylabel('Temperature (°C)')
% grid
% hold on 
% plot(modtime,BCCESM1ts,'-ok')
% hold on
% plot(modtime,CanESM5ts,'-*b')
% hold on
% plot(modtime,CESM2ts,'-xk')
% hold on
% plot(modtime,CESM2WACCMts,'-pm')
% hold on
% plot(modtime,E3SM10ts,'-*c')
% hold on 
% plot(modtime,ECEarth3ts,'--sm')
% hold on
% plot(modtime,ECEarth3Vegts,':xk')
% hold on
% plot(modtime,GISSE21Gts,'-.og')
% hold on
% plot(modtime,GISSE21Hts,':>r')
% hold on
% plot(modtime,MIROC6ts,'-hb')
% hold on
% plot(modtime,MRIESM20ts,'--pr')
% hold on
% plot(modtime,SAM0UNICONts,'-xb')
% hold on
% plot(modtime,EnsembleMeants,'--*r')
% hold on
% plot(modtime,UDELts,'-.b')
% hold on
% plot(modtime,CAMSts,'-dk')
% hold on
% plot(modtime,CRUts,'-sm')
% legend('BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
%     'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
%     'MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean','UDEL','CAMS','CRU')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  CALCULATE TAS STATS FOR TAYLOR DIAGRAM   %%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Remember that time step is 432 (monthly data from 1979-2014)
%Use UDEL for reference and include CAMS, CRU
%function [stats] = taylor_statistics(predicted,reference)

%THIS IS FOR UDEL 
% BCCCSM2MRstats = taylor_statistics(BCCCSM2MRts,UDELts);
% BCCESM1stats = taylor_statistics(BCCESM1ts,UDELts);
% CanESM5stats = taylor_statistics(CanESM5ts,UDELts);
% CESM2stats = taylor_statistics(CESM2ts,UDELts);	
% CESM2WACCMstats = taylor_statistics(CESM2WACCMts,UDELts);
% E3SM10stats = taylor_statistics(E3SM10ts,UDELts);
% ECEarth3stats = taylor_statistics(ECEarth3ts,UDELts);
% ECEarth3Vegstats = taylor_statistics(ECEarth3Vegts,UDELts);
% GISSE21Gstats = taylor_statistics(GISSE21Gts,UDELts);
% GISSE21Hstats = taylor_statistics(GISSE21Hts,UDELts);
% MIROC6stats = taylor_statistics(MIROC6ts,UDELts);
% MRIESM20stats = taylor_statistics(MRIESM20ts,UDELts);
% SAM0UNICONstats = taylor_statistics(SAM0UNICONts,UDELts);
% CAMSstats = taylor_statistics(CAMSts,UDELts);
% CRUstats = taylor_statistics(CRUts,UDELts);
% EnsembleMeanstats = taylor_statistics(EnsembleMeants,UDELts);

% %THIS IS FOR CAMS monthly
% BCCCSM2MRstats = taylor_statistics(BCCCSM2MRts,CAMSts);
% BCCESM1stats = taylor_statistics(BCCESM1ts,CAMSts);
% CanESM5stats = taylor_statistics(CanESM5ts,CAMSts);
% CESM2stats = taylor_statistics(CESM2ts,CAMSts);	
% CESM2WACCMstats = taylor_statistics(CESM2WACCMts,CAMSts);
% E3SM10stats = taylor_statistics(E3SM10ts,CAMSts);
% ECEarth3stats = taylor_statistics(ECEarth3ts,CAMSts);
% ECEarth3Vegstats = taylor_statistics(ECEarth3Vegts,CAMSts);
% GISSE21Gstats = taylor_statistics(GISSE21Gts,CAMSts);
% GISSE21Hstats = taylor_statistics(GISSE21Hts,CAMSts);
% MIROC6stats = taylor_statistics(MIROC6ts,CAMSts);
% MRIESM20stats = taylor_statistics(MRIESM20ts,CAMSts);
% SAM0UNICONstats = taylor_statistics(SAM0UNICONts,CAMSts);
% UDELstats = taylor_statistics(UDELts,CAMSts);
% CRUstats = taylor_statistics(CRUts,CAMSts);
% EnsembleMeanstats = taylor_statistics(EnsembleMeants,CAMSts);

%THIS IS FOR CAMS annual
BCCCSM2MRstats = taylor_statistics(BCCCSM2MRannual2,CAMSannual2);
BCCESM1stats = taylor_statistics(BCCESM1annual2,CAMSannual2);
CanESM5stats = taylor_statistics(CanESM5annual2,CAMSannual2);
CESM2stats = taylor_statistics(CESM2annual2,CAMSannual2);	
CESM2WACCMstats = taylor_statistics(CESM2WACCMannual2,CAMSannual2);
E3SM10stats = taylor_statistics(E3SM10annual2,CAMSannual2);
ECEarth3stats = taylor_statistics(ECEarth3annual2,CAMSannual2);
ECEarth3Vegstats = taylor_statistics(ECEarth3Vegannual2,CAMSannual2);
GISSE21Gstats = taylor_statistics(GISSE21Gannual2,CAMSannual2);
GISSE21Hstats = taylor_statistics(GISSE21Hannual2,CAMSannual2);
MIROC6stats = taylor_statistics(MIROC6annual2,CAMSannual2);
MRIESM20stats = taylor_statistics(MRIESM20annual2,CAMSannual2);
SAM0UNICONstats = taylor_statistics(SAM0UNICONannual2,CAMSannual2);
UDELstats = taylor_statistics(UDELannual2,CAMSannual2);
CRUstats = taylor_statistics(CRUannual2,CAMSannual2);
EnsembleMeanstats = taylor_statistics(EnsembleMeanannual2,CAMSannual2);

%Create arrays with stats from excel sheet (copy over) UDEL ref
ccoef = [1,0.5777,0.568,0.6651,0.705,0.6667,0.6656,0.6075,0.6041,...	
    0.373,0.3683,0.5723,0.5817,0.6531,0.9062,0.9376,0.6845];
crmsd = [0,0.8363,0.8457,1.9595,0.7747,0.8477,0.07948,1.2849,1.332,...	
    1.5983,1.5371,1.939,0.925,0.728,0.3477,0.2315,0.8494];
sdev = [0.6628,1.0207,1.0228,2.3368,1.083,1.1308,1.0634,1.5748,...	
    1.6232,1.7225,1.6523,1.4423,1.1372,0.9602,0.8063,0.6444,1.1522];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CAMS','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save stats in mat file for tay diag
save('Tas_stats_UDEL.mat','ccoef','crmsd','sdev','ID')

%Create arrays with stats from excel sheet (copy over) CAMS ref
ccoef = [1,0.5883,0.5536,0.6564,0.7029,0.6812,0.6803,0.5772,0.5808,...	
    0.3426,0.3685,0.5646,0.6033,0.6683,0.9062,0.9115,0.6775];
crmsd = [0,0.8506,0.8849,1.9072,0.7716,0.8286,0.7838,1.2901,1.3284,...	
    1.6327,1.5487,1.1904,0.9149,0.733,0.3477,0.3438,0.8478];
sdev = [0.8063,1.0207,1.0228,2.3368,1.083,1.1308,1.0634,1.5748,...	
    1.6232,1.7225,1.6523,1.4423,1.1372,0.9602,0.6628,0.6444,1.1522];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save stats in mat file for tay diag
save('Tas_stats_CAMS.mat','ccoef','crmsd','sdev','ID')

%Create arrays with stats from excel sheet (copy over) CAMS ref with
%western amazonia
ccoef = [1,0.4869,0.4964,0.6044,0.6447,0.6065,0.656,0.4795,0.4595,...	
    0.1635,0.201,0.5775,0.5506,0.6183,0.9212,0.8743,0.6325];
crmsd = [0,0.8556,0.8467,1.8068,0.8644,0.9418,0.7198,1.0202,...	
    1.0982,1.865,1.6787,0.8804,0.9683,0.8394,0.3085,0.3892,0.7628];
sdev = [0.7924,0.8888,0.887,2.1718,1.1275,1.1806,0.9205,1.1265,...	
    1.2071,1.8228,1.6478,1.0548,1.1434,1.0528,0.7375,0.7523,0.9542];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save stats in mat file for tay diag
save('Tas_stats_CAMS2.mat','ccoef','crmsd','sdev','ID')

%Create arrays with stats from excel sheet (copy over) CAMS ref with
%western amazonia and annual time series
ccoef = [1,0.7513,0.8333,0.6556,0.6955,0.6378,0.7228,0.7575,0.7264,...	
    0.5126,0.5646,0.4468,0.7002,0.5639,0.9087,0.8592,0.867];
crmsd = [0,0.32,0.2716,0.6358,0.363,0.3785,0.3346,0.3158,0.3402,...	
    0.5492,0.4584,0.5223,0.3527,0.4434,0.2129,0.2699,0.2552];
sdev = [0.4837,0.3865,0.3556,0.8375,0.4411,0.3785,0.3342,0.3712,...	
    0.4235,0.6072,0.4984,0.5058,0.2668,0.4653,0.3721,0.3078,0.3355];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save stats in mat file for tay diag
save('Tas_stats_CAMS3.mat','ccoef','crmsd','sdev','ID')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Create NORMALIZED arrays with stats from excel sheet (Temp (tas)%%
%%%%%%%%%%%%%%%%%%%%%%%%  UDEL is ref   %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ccoef = [1,0.5777,0.568,0.6651,0.705,0.6667,0.6656,0.6075,0.6041,...	
    0.373,0.3683,0.5723,0.5817,0.6531,0.9062,0.9376,0.6845];
crmsd = [0,1.2618,1.2760,2.9564,1.1688,1.2790,0.1199,1.9386,2.0097,...	
    2.4114,2.3191,2.9255,1.3956,1.0984,0.5246,0.3493,1.2815];
sdev = [1,1.5400,1.5432,3.5256,1.6340,1.7061,1.6044,2.3760,2.4490,...	
    2.5988,2.4929,2.1761,1.7158,1.4487,1.2165,0.9722,1.7384];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','CAMS','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Tas_stats_norm.mat','ccoef','crmsd','sdev','ID')


ccoef = [1,0.7513,0.8333,0.6556,0.6955,0.6378,0.7228,0.7575,...	
    0.7264,0.5126,0.5646,0.4468,0.7002,0.5639,0.9087,0.8592,0.867];
crmsd = [0,0.6616,0.5615,1.3145,0.7505,0.7825,0.6918,0.6529,0.7033,...	
    1.1354,0.9477,1.0798,0.7292,0.9167,0.4401,0.5580,0.5276];
sdev = [1,0.7990,0.7352,1.7314,0.9119,0.7825,0.6909,0.7674,0.8755,...	
    1.2553,1.0304,1.0457,0.5516,0.9620,0.7693,0.6363,0.6936];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Tas_stats_CAMS3_norm.mat','ccoef','crmsd','sdev','ID')

%#3 CAMS normalized for lat[-12 0.5] lon[-69 -57]
ccoef = [1,0.754,0.8196,0.662,0.6704,0.6356,0.7105,0.689,0.7053,...	
    0.5066,0.5622,0.4533,0.6704,0.5518,0.8727,0.9123,0.8592];
crmsd = [0,0.6569,0.5880,1.2156,0.7560,0.7756,0.7067,0.7271,0.7221,1.1303,...	
    0.9317,1.0348,0.7634,0.9059,0.5173,0.4915,0.5536];
sdev = [1,0.7660,0.6867,1.6190,0.8148,0.7109,0.6452,0.7469,0.8422,...	
    1.2374,0.9912,0.9788,0.4905,0.9055,0.7015,0.6406,0.6476];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Tas_stats_CAMS4_norm.mat','ccoef','crmsd','sdev','ID')

%CAMS normalized for lat[-13.5 1] lon[-75 -52.5]
ccoef = [1,0.7299,0.795,0.7287,0.6268,0.5973,0.6769,0.7103,0.6902,...	
    0.4741,0.5647,0.3956,0.6273,0.5399,0.8782,0.9079,0.8242];
crmsd = [0,0.6860,0.6132,1.0274,0.8158,0.8205,0.7361,0.7068,0.7478,...
    1.1691,0.9348,1.2062,0.7820,0.9564,0.5302,0.5364,0.5826];
sdev = [1,0.7888,0.7051,1.4946,0.8686,0.7700,0.6886,0.7747,0.8790,...	
    1.2430,1.0038,1.1778,0.5561,0.9915,0.6489,0.5732,0.6867];
ID = {'Obs','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H',...
    'MIROC6','MRIESM20','SAM0UNICON','UDEL','CRU','Ensemble Mean'}; %this is a 'cell' array

%Save NORMALIZED stats in mat file for tay diag
save('Tas_stats_CAMS5_norm.mat','ccoef','crmsd','sdev','ID')


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%  CREATE TAYLOR DIAGRAM FOR TAS   %%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Close any previously open graphics windows
close all;

% Set the figure properties
set(gcf,'units','inches','position',[0,10.0,14.0,10.0]);
% set(gcf,'DefaultLineLineWidth',1.5); % linewidth for plots
set(gcf,'DefaultAxesFontSize',18); % font size of axes text

% Read in data from a mat file: sdev, crmsd, ccoef, and ID
%PICK CORRECT ONE!!!!
load('Tas_stats.mat');
load('Tas_stats_CAMS.mat');
load('Tas_stats_CAMS2.mat');   %west amazonia monthly
load('Tas_stats_CAMS3.mat');   %west amazonia annual
load('Tas_stats_CAMS3_norm.mat');   %west amazonia annual normalized
load('Tas_stats_CAMS4_norm.mat');   %amazonia annual normalized
load('Tas_stats_CAMS5_norm.mat');   %amazon river basin normalized
load('Tas_stats_norm.mat');

% Specify labels for points in a cell array using gage ID.
label = ID;

%Create rms tick labels
tt = [0 0.5 1 1.5];
string(tt);

% Produce the Taylor diagram.
%
% Label the points and change the axis options for SDEV, CRMSD, and CCOEF.
% Increase the upper limit for the SDEV axis and rotate the CRMSD contour 
% labels (counter-clockwise from x-axis). Exchange color and line style
% choices for SDEV, CRMSD, and CCOEFF variables to show effect. Increase
% the line width of all lines.
%
% For an exhaustive list of options to customize your diagram, please 
% call the function without arguments:
%	>> taylor_diagram
[hp, ht, axl] = taylor_diagram(sdev,crmsd,ccoef, ...
    'markerLabel',label,... 
    'markerLegend', 'on', ...
    'styleSTD', '-',...
    'colOBS','m',...
    'markerObs','o', ...
    'styleOBS','-.',...
    'widthOBS',3,...
    'markerSize',10,...
    'tickRMSangle', 120,...
    'tickRMS',0.0:0.5:1.5,...   %make sure to change RMS tick marks!
    'showlabelsRMS', 'on', ...
    'rmslabelformat','%.1f',...
    'titleRMS','on',...
    'titleRMSDangle',80,...
    'titleOBS','Ref: CAMS');   %make sure to change ref title

% Write plot to file (PICK CORRECT ONE!!!!)
writepng(gcf,'Taylor_tas.png');
writepng(gcf,'Taylor_tas_norm_amazonia.png');



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%     extries (plots/etc)     %%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


% create a globeimage and center around amazon
figure
globeimage
view(30,-10)