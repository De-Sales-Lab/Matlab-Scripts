%%%%%%%%%%%%    Load in WRF prec phys * ctl nc file & CHIRPS         %%%%%%%%%%%%%%%
%%%%%%%%%%%  Do this within C:\Users\User\Documents\Dissertation\Data\WRF_runs\ERA5_runs\Validation\mly means'%%%%%%%
clear all
cd 'C:\Users\User\Documents\Dissertation\Data\WRF_runs\ERA5_runs\Validation\mly means'

ncdisp 'UDEL_tas_2015.nc'
ncdisp 'ctl_t2_2015_merge.nc'
ncdisp 'phys_t2_2015_merge.nc'

lat = double(ncread('ctl_t2_2015_merge.nc','lat'));
lon = double(ncread('ctl_t2_2015_merge.nc','lon'));

%UDEL is 'air' for 12 months degC
UDELt2 = double(ncread('UDEL_tas_2015.nc','air'));
UDELt = double(ncread('UDEL_tas_2015.nc','time'));   %get time

%WRFctl is 'mt2' for 6 monts (may-oct) K
WRFctlt2 = double(ncread('ctl_t2_2015_merge.nc','mt2'));
WRFctlt = double(ncread('ctl_t2_2015_merge.nc','time'));   %get time

%WRFphys is 't2' for 6 monts (may-oct) K
WRFphyst2 = double(ncread('phys_t2_2015_merge.nc','mt2'));
WRFphyst = double(ncread('phys_t2_2015_merge.nc','time'));   %get time

%Select the 6 months for UDEL (may-oct OR 5:10)
UDELt2 = UDELt2(:,:,5:10);

%Permute files into 'lat' 'lon' and 'time'
UDELt2 = permute(UDELt2,[2 1 3]);
WRFctlt2 = permute(WRFctlt2,[2 1 3]);
WRFphyst2 = permute(WRFphyst2,[2 1 3]);

%Turn lat/lon into grid & set time
[Lon,Lat] = meshgrid(lon,lat);
lon2 = lon-360;

StartDate = datetime(2015,05,01);
EndDate = datetime(2015,10,31);
modtime= StartDate:calmonths(1):EndDate;

%load basic image of CHIRPS (CHIRPS- mm/month, WRF-mm/6hr)
figure
pcolor(lon2,lat,mean(UDELt2,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('UDEL temp may2015-oct2015')
xlabel longitude
ylabel latitude
caxis([0 45])

%load basic image of WRFctl
figure
pcolor(lon2,lat,mean(WRFctlt2-273.15,3))  %this is avg may-oct
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('WRFctl temp may2015-oct2015')
xlabel longitude
ylabel latitude
caxis([0 45])

%load basic image of WRFphys
figure
pcolor(lon2,lat,mean(WRFphyst2-273.15,3))  %this is avg may-oct
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
title('WRFphys temp may2015-oct2015')
xlabel longitude
ylabel latitude
caxis([0 45])


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
pcolor(lon2,lat,(mean(WRFctlt2(:,:,k)-273.15,3)-mean(UDELt2(:,:,k),3)))
shading interp
axis tight
colormap(mycolormap_gwb)
cb = colorbar;
hold on
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' CTL Bias [°C]'])
xlabel longitude
ylabel latitude
caxis([-10 10])
end

%BIAS for WRFctl
figure('pos',[100 100 500 700])
for k = 1:6
subplot(2,3,k)
pcolor(lon2,lat,(mean(WRFphyst2(:,:,k)-273.15,3)-mean(UDELt2(:,:,k),3)))
shading interp
axis tight
colormap(mycolormap_gwb)
cb = colorbar;
hold on
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' PHYS Bias [°C]'])
xlabel longitude
ylabel latitude
caxis([-10 10])
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

yt = UDELt2(:,:,1);  %month by month 1=MAY; 2=JUN; 3=JUL:; 4=AUG; 5=SEP; 6=OCT

%Change between WRFctl and WRFphys
%1=MAY; 2=JUN; 3=JUL:; 4=AUG; 5=SEP; 6=OCT
%ye = WRFctlt2(:,:,1)-273.15;
ye = WRFphyst2(:,:,1)-273.15; 

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
title({'Month:','Apr 2015', 'PHYS RMSE [°C]'})   %CHANGE THIS
hold on
cb = colorbar;
borders('countries','color',rgb('dark gray'))
%xlabel longitude
%ylabel latitude
caxis([0 15])  
%xlim([-75 -43])
%ylim([-20 7])

%%RMSE for WRFctlt2
figure('pos',[100 100 500 700])
for k = 1:6
yt = UDELt2(:,:,k);
ye = WRFctlt2(:,:,k)-273.15; 
E = (ye-yt);  %Errors
SQE = E.^2;  %square errors
MSE = mean(SQE,3);  %Mean square error
RMSE = sqrt(MSE);  %Root mean square errors  (USE THIS for plot)
subplot(2,3,k)
contourf(lon2,lat,RMSE,'edgecolor','none')
shading interp
axis tight
colormap(mycolormap_gyr2);
hold on
cb = colorbar;
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' CTL RMSE'])  %Change title
xlabel longitude
ylabel latitude
caxis([0 10])
end

%%RMSE for WRFphyst2
figure('pos',[100 100 500 700])
for k = 1:6
yt = UDELt2(:,:,k);
ye = WRFphyst2(:,:,k)-273.15; 
E = (ye-yt);  %Errors
SQE = E.^2;  %square errors
MSE = mean(SQE,3);  %Mean square error
RMSE = sqrt(MSE);  %Root mean square errors  (USE THIS for plot)
subplot(2,3,k)
contourf(lon2,lat,RMSE,'edgecolor','none')
shading interp
axis tight
colormap(mycolormap_gyr2);
hold on
cb = colorbar;
borders('countries','color','k','linewidth',2)
title(['Month: ',convertCharsToStrings(Months(k)),' PHYS RMSE'])  %Change title
xlabel longitude
ylabel latitude
caxis([0 10])
end





