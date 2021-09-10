%%%%%%%%%%%%    Load in WRF prec nc file (test1) & CHIRPS %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%  Do this within Dissertation\Data\WRF_files\precipitation_grb2nc'%%%%%%%
clear all
cd 'C:\Users\User\Documents\Dissertation\Data\WRF_files\precipitation_grb2nc'

ncdisp 'CHIRPS_pr.nc'
ncdisp 'ERA5_prv2.nc'  %v2 is on the same grid as others
ncdisp 'wrftest1.nc'

lat = double(ncread('wrftest1.nc','lat'));
lon = double(ncread('wrftest1.nc','lon'));

%CHIRPS is precip
CHIRPSpr = double(ncread('CHIRPS_pr.nc','precip'));
CHIRPSt = double(ncread('CHIRPS_pr.nc','time'));   %get time

%ERA5 is mtpr
ERA5pr = double(ncread('ERA5_prv2.nc','MTPR'));
ERA5t = double(ncread('ERA5_prv2.nc','forecast_initial_time'));   %get time

%WRFtest1 is prec
wrftest1pr = double(ncread('wrftest1.nc','prec'));
wrftest2pr = double(ncread('wrftest2.nc','prec'));
wrftest1t = double(ncread('prec.nc','time'));   %get time
wrftest2t = double(ncread('wrftest2.nc','time'));   %get time

%CHIRPS 'days since 1980-1-1 0:0:0'
%wrf 'months since 2010-05-01 00:00'
%ERA5 'months since 2010-5-1 00:00:00'
CHIRPSt = datenum(1980,1,CHIRPSt);
ERA5t = datenum(2010,ERA5t,1);
wrftest1t = datenum(2010,wrftest1t,1);
wrftest2t = datenum(2010,wrftest2t,1);

%Check times
CHIRPSt=datetime(CHIRPSt,'ConvertFrom','datenum');
CHIRPSt = datenum(CHIRPSt);

%Save OBS pr nc files as mat
CHIRPSpr = permute(CHIRPSpr,[2 1 3]);
save('CHIRPS_pr.mat','lat','lon','CHIRPSt','CHIRPSpr')

%check size of ERA5 (4D) 269x120x12x12
size(ERA5pr)

may2010=ERA5pr(:,:,1);
jun2010=ERA5pr(:,:,2);
jul2010=ERA5pr(:,:,3);
aug2010=ERA5pr(:,:,4);
sep2010=ERA5pr(:,:,5);
oct2010=ERA5pr(:,:,6);
nov2010=ERA5pr(:,:,7);
dec2010=ERA5pr(:,:,8);
jan2011=ERA5pr(:,:,9);
feb2011=ERA5pr(:,:,10);
mar2011=ERA5pr(:,:,11);
apr2011=ERA5pr(:,:,12);

ERA5prcat=cat(3,may2010,jun2010,jul2010,aug2010,sep2010,oct2010,nov2010,dec2010,...
    jan2011,feb2011,mar2011,apr2011);

ERA5pr = permute(ERA5prcat,[2 1 3]);
save('ERA5_pr.mat','lat','lon','ERA5t','ERA5pr')

%Save WRFtest1 pr nc files as mat
wrftest1pr = permute(wrftest1pr,[2 1 3]);
save('wrftest1_pr.mat','lat','lon','wrftest1t','wrftest1pr')

%Save WRFtest2 pr nc files as mat
wrftest2pr = permute(wrftest2pr,[2 1 3]);
save('wrftest2_pr.mat','lat','lon','wrftest2t','wrftest2pr')

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%   LOAD .mat files for pr OBS + MOD  %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
clear all
cd 'C:\Users\User\Documents\Dissertation\Data\WRF_files\precipitation_grb2nc'

% Load in wrf mat files
fds = fileDatastore('.\*pr.mat', 'ReadFcn', @importdata);
fullFileNames = fds.Files;
numFiles = length(fullFileNames);
for k = 1 : numFiles
    fprintf('Now reading file %s\n', fullFileNames{k});
    load(fullFileNames{k});
end

%ERA5pr = squeeze(num2cell(permute(ERA5pr2,[1,2,4,3]),1:3));

lat = double(ncread('wrftest1.nc','lat'));
lon = double(ncread('wrftest1.nc','lon'));

%Turn lat/lon into grid
[Lon,Lat] = meshgrid(lon,lat);
lon2 = lon-360;

StartDate = datetime(2010,05,01);
EndDate = datetime(2011,04,30);
modtime= StartDate:calmonths(1):EndDate;

%load basic image of CHIRPS (CHIRPS- mm/month, WRF-mm/6hr)
%CHIRPSpr(:,:,5:16)
%ERA5pr(:,:,:)*86400*124
figure
pcolor(lon2,lat,mean(ERA5pr(:,:,:)*86400*124,3))  %this is avg may10-apr2011
%pcolor(lon2,lat,CHIRPSpr(:,:,1))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
%title('CHIRPS pr may2010-apr2011')
title('ERA5 pr may2010-apr2011')
xlabel longitude
ylabel latitude
caxis([0 300])

%load basic image of wrftest1
figure
pcolor(lon2,lat,mean(wrftest1pr(:,:,1:12)*124,3))  %this is avg may10-apr2011
%pcolor(lon2,lat,wrftest1pr(:,:,13))  %mult 120 for werftest1
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('wrftest2 pr may2010-apr2011')
xlabel longitude
ylabel latitude
caxis([0 300])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    BIAS  MAPS   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load basic image of CHIRPS (CHIRPS- mm/month, WRF-mm/6hr)
%CHIRPSpr(:,:,5:16)
%ERA5pr(:,:,:)*86400*124 or *86400 for mm/day
%wrftest1pr(:,:,1:12): for mm/day *4

mycolormap_gwb = customcolormap(linspace(0,1,11), {'#543005','#8c510a','#bf812d',...
    '#dfc27d','#f6e8c3','#f5f5f5','#c7eae5','#80cdc1','#35978f','#01665e','#003c30'});

Months = {'May 2010','Jun 2010','Jul 2010','Aug 2010','Sep 2010','Oct 2010 ','Nov 2010',...
    'Dec 2011','Jan 2011','Feb 2011','Mar 2011','Apr 2011'};

wrftest2pr = wrftest2pr(:,:,1:12);

figure('pos',[100 100 500 700])
for k = 1:12
subplot(3,4,k)
pcolor(lon2,lat,(mean(wrftest2pr(:,:,k)*4,3)-mean(ERA5pr(:,:,k),3)*86400))
shading interp
axis tight
colormap(flipud(mycolormap_gwb))
cb = colorbar;
hold on
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' Bias [mm/day]'])
xlabel longitude
ylabel latitude
caxis([-15 15])
end

mean(wrftest2pr(:,:,1:12)*4,'all','omitnan')  
mean(ERA5pr(:,:,1:12)*86400,'all','omitnan')  

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   RMSE PLOTS pr    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Equation: 1)subtract mod - obs 2)square difference 3)sum of diff 4)Divide sum
%by data points 5)take square root of that total
%yt is theoretical (obs) and ye is experimental (model)

%CHIRPS: 5 (may2010) - 16 (Apil 2011)
%wrf & ERA5%: 1 (may2010) - 12 (April 2011)
%If using ERA5, multiply ERA5*86400 (mm/day) and wrf*4 (mm/day)
mycolormap_gyr = customcolormap(linspace(0,1,11), {'#a60126','#d7302a','#f36e43','#faac5d','#fedf8d','#fcffbf','#d7f08b','#a5d96b','#68bd60','#1a984e','#006936'});
mycolormap_gyr2 = customcolormap(linspace(0,1,6), {'#f36e43','#faac5d','#fedf8d','#fcffbf','#d7f08b','#a5d96b',});
mycolormap_gp = customcolormap(linspace(0,1,11), {'#523107','#523107','#bf812c','#e2c17e','#f3e9c4','#f6f4f4','#cae9e3','#81cdc1','#379692','#01665e','#003d2e'});

yt = ERA5pr(:,:,12)*86400;  %month by month (May 2010=5; April 2011=16) OR season

%28? (4*28)=112  (Feb)
%30? (4*30)=120  (Apr,Jun,Sep,Nov)
%31? (4*31)=124  (May, Jul, Aug, Oct, Dec, Jan, Mar)

%Change between wrftest1 and wrftest2
%for ERA5, for mm/day
%ye = wrftest2pr(:,:,1)*120;   %month by month (May 2010=1; April 2011=12) or season
ye = wrftest2pr(:,:,12)*4; 

E = (ye-yt);  %Errors
SQE = E.^2;  %square errors
MSE = mean(SQE,3);  %Mean square error
RMSE = sqrt(MSE);  %Root mean square errors  (USE THIS for plot)

figure
contourf(lon2,lat,RMSE,'edgecolor','none')
shading interp
axis tight
colormap(mycolormap_gyr2);
%cmocean -solar
title('Apr 2011 RMSE test2: ERA5')   %CHANGE THIS
hold on
cb = colorbar;
borders('countries','color',rgb('dark gray'))
%xlabel longitude
%ylabel latitude
%caxis([0 500])    %for mm/month
caxis([0 15])     %for mm/day
%xlim([-75 -43])
%ylim([-20 7])
