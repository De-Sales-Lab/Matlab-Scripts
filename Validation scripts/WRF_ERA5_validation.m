%%%%%%%%%%%%    Load in WRF prec phys * ctl nc file & CHIRPS         %%%%%%%%%%%%%%%
%%%%%%%%%%%  Do this within Dissertation\Data\WRF_files\precipitation_grb2nc'%%%%%%%
clear all
cd 'C:\Users\User\Documents\Dissertation\Data\WRF_runs\ERA5_runs\Validation\mly means'

ncdisp 'CHIRPS_pr_2015.nc'
ncdisp 'ctl_pr_2015_merge.nc'
ncdisp 'phys_pr_2015_merge.nc'

lat = double(ncread('ctl_pr_2015_merge.nc','lat'));
lon = double(ncread('ctl_pr_2015_merge.nc','lon'));

%CHIRPS is 'precip' for 12 months
CHIRPSpr = double(ncread('CHIRPS_pr_2015.nc','precip'));
CHIRPSt = double(ncread('CHIRPS_pr_2015.nc','time'));   %get time

%WRFctl is 'mprec' for 6 monts (may-oct)
WRFctlpr = double(ncread('ctl_pr_2015_merge.nc','mprec'));
WRFctlt = double(ncread('ctl_pr_2015_merge.nc','time'));   %get time

%WRFphys is 'mprec' for 6 monts (may-oct)
WRFphyspr = double(ncread('phys_pr_2015_merge.nc','mprec'));
WRFphyst = double(ncread('phys_pr_2015_merge.nc','time'));   %get time

%Select the 6 months for CHIPRS (may-oct OR 5:10)
CHIRPSpr = CHIRPSpr(:,:,5:10);

%Permute files into 'lat' 'lon' and 'time'
CHIRPSpr = permute(CHIRPSpr,[2 1 3]);
WRFctlpr = permute(WRFctlpr,[2 1 3]);
WRFphyspr = permute(WRFphyspr,[2 1 3]);

%Turn lat/lon into grid & set time
[Lon,Lat] = meshgrid(lon,lat);
lon2 = lon-360;

StartDate = datetime(2015,05,01);
EndDate = datetime(2015,10,31);
modtime= StartDate:calmonths(1):EndDate;

%load basic image of CHIRPS (CHIRPS- mm/month, WRF-mm/6hr)
figure
pcolor(lon2,lat,mean(CHIRPSpr,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('CHIRPS pr may2015-oct2015')
xlabel longitude
ylabel latitude
caxis([0 300])

%load basic image of WRFctl
figure
pcolor(lon2,lat,mean(WRFctlpr*120,3))  %this is avg may-oct
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('WRFctl pr may2015-oct2015')
xlabel longitude
ylabel latitude
caxis([0 300])

%load basic image of WRFphys
figure
pcolor(lon2,lat,mean(WRFphyspr*120,3))  %this is avg may-oct
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('WRFphys pr may2015-oct2015')
xlabel longitude
ylabel latitude
caxis([0 300])


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%    BIAS  MAPS   %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%load basic image of CHIRPS (CHIRPS- mm/month, WRF-mm/6hr)
%CHIRPSpr: mm/month: divide my ~30?
%wrf: for mm/day *4

mycolormap_gwb = customcolormap(linspace(0,1,11), {'#543005','#8c510a','#bf812d',...
    '#dfc27d','#f6e8c3','#f5f5f5','#c7eae5','#80cdc1','#35978f','#01665e','#003c30'});

Months = {'May 2015','Jun 2015','Jul 2015','Aug 2015','Sep 2015','Oct 2015'};

%BIAS for WRFctl
figure('pos',[100 100 500 700])
for k = 1:6
subplot(2,3,k)
pcolor(lon2,lat,(mean(WRFctlpr(:,:,k)*4,3)-mean(CHIRPSpr(:,:,k),3)/30))
shading interp
axis tight
colormap(flipud(mycolormap_gwb))
cb = colorbar;
hold on
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' CTL Bias [mm/day]'])
xlabel longitude
ylabel latitude
caxis([-15 15])
end

%BIAS for WRFctl
figure('pos',[100 100 500 700])
for k = 1:6
subplot(2,3,k)
pcolor(lon2,lat,(mean(WRFphyspr(:,:,k)*4,3)-mean(CHIRPSpr(:,:,k),3)/30))
shading interp
axis tight
colormap(flipud(mycolormap_gwb))
cb = colorbar;
hold on
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' PHYS Bias [mm/day]'])
xlabel longitude
ylabel latitude
caxis([-15 15])
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%   RMSE PLOTS pr    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%Equation: 1)subtract mod - obs 2)square difference 3)sum of diff 4)Divide sum
%by data points 5)take square root of that total
%yt is theoretical (obs) and ye is experimental (model)

%wrf*4*30 (mm/day)
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











