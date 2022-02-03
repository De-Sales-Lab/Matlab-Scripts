%%%%%%%%%%%%%%%%%%   This is for temp    %%%%%%%%%%%%%%%%%%%%%%%%%
%This is degrees K (-273.16 for C)!!!!!!!!!!!!!!!!!!!!!!!!
%'days since 1850-1-1'
ncdisp tas_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc
t = ncread('tas_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','time');
t = datenum(1850,1,t);

lat = ncread('tas_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','lat');
lon = ncread('tas_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','lon');
temp = ncread('tas_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','tas');


temp = permute(temp,[2 1 3]);
save('MIROC6_hist_temp.mat','lat','lon','t','temp')

%Load MATLAB data of temp
load MIROC6_hist_temp.mat
whos

%%%%%%%%%%%%%%conmpute spatial trend
[tr,p] = trend(temp,12);  %per year

%set lat lon to be full grids
[Lon,Lat] = meshgrid(lon,lat);
%recenter grid
[Lat,Lon,tr] = recenter(Lat,Lon,tr);
% ADD SIGNIFICANCE WITH STIPPLING
StatisticallySignificant = p<0.1;   %define significance (0.1,0.01,0.05,etc)


%%%  PLOT SPATIAL TREND & SIGNIFICANCE
figure
imagescn(Lon,Lat,tr*10)  %decadal? Multiply by 10
cb = colorbar;
ylabel(cb,'Decadal Temp Trend \circC yr^{-1}')
cmocean('balance','pivot')
hold on
stipple(Lon,Lat,StatisticallySignificant)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
%text(-56.53,-3.452,'Amazon','vert','top','horiz','center','fontangle','italic')

%%% CHECK FINITE MEASUREMENTS (modeled so should be just 1 color= 780 measurements!)
figure
imagescn(lon,lat,sum(isfinite(temp),3))
cb = colorbar;
ylabel(cb,'Sum of Finite TEMP Measurements')
caxis([779 781])

%%% TEMP FOR SPECIFIED MONTH
temp_mean = monthly(temp,t,7,@mean);
[Lon,Lat] = meshgrid(lon,lat);
[Lat,Lon,temp_mean] = recenter(Lat,Lon,temp_mean);

figure
imagescn(Lon,Lat,temp_mean-273.16)
shading interp
cmocean thermal
cb = colorbar;
ylabel(cb,'Mean \circC')
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([5 35])

%%% INTERANNUAL VARIABILITY
month_var = monthly(temp,t,7,@var);
[Lon,Lat] = meshgrid(lon,lat);
[Lat,Lon,month_var] = recenter(Lat,Lon,month_var);

figure
imagescn(Lon,Lat,month_var)
cmocean amp
cb = colorbar;
ylabel(cb,'Variability')
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 10])

%%% Get the mean of the entire dataset
temp_mean_all = mean(temp,3);
[Lon,Lat] = meshgrid(lon,lat);
[Lat,Lon,temp_mean_all] = recenter(Lat,Lon,temp_mean_all);

figure
imagescn(Lon,Lat,temp_mean_all-273.16)
colormap jet
cb = colorbar;
%ylabel(cb,' 1950-2014 Mean Temp \circC')
ylabel(cb,'Mean Temp K')
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([-5 35])


%%% COMPARE ONE MONTH TO ANNUAL AVERAGE
temp_anomaly = monthly(temp,t,7,@mean) - mean(temp,3);
[Lon,Lat] = meshgrid(lon,lat);
[Lat,Lon,temp_anomaly] = recenter(Lat,Lon,temp_anomaly);

figure
imagescn(Lon,Lat,temp_anomaly)
cmocean('-tarn','pivot')
cb = colorbar;
ylabel(cb,'Temp anopmaly \circC')
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([-10 20])






%%%%%%%%%%%%%%%%%%%%%%%%    PRECIPITATION PATTERNS      %%%%%%%%%%%%%%%%%%
%%%% Units are kg m-2 s-1, there are 86400 sec/day
%%%% Multiply average by 86400 to get mm/day and then by 30/31 to get
%%%% mm/month
ncdisp pr_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc

t = ncread('pr_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','time');  %check t values
%time is 'days since 1850-1-1' and type is already double
%DateNumber = datenum(Y,M,D)
t = datenum(1850,1,t);
%here is how you can get a date vectors from datenum array
[year, month, day] = datevec(t);

lat = ncread('pr_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','lat');
lon = ncread('pr_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','lon');
pr = ncread('pr_Amon_MIROC6_historical_r1i1p1f1_gn_195001-201412.nc','pr');

%rearange as lat x lon x time
pr = permute(pr,[2 1 3]);

%Save MIROC6 prec data as matlab file
save('MIROC6_hist_prec.mat','lat','lon','t','pr')


%Load MATLAB data of prec
load MIROC6_hist_prec.mat
whos

%%%%%%%%%%%%%%conmpute spatial trend
[tr,p] = trend(pr,12);  %per year

%set lat lon to be full grids
[Lon,Lat] = meshgrid(lon,lat);
%recenter grid
[Lat,Lon,tr] = recenter(Lat,Lon,tr);
% ADD SIGNIFICANCE WITH STIPPLING
StatisticallySignificant = p<0.01;   %define significance


%%%  PLOT SPATIAL TREND & SIGNIFICANCE
figure
imagescn(Lon,Lat,tr*86400*30*12)
cb = colorbar;
ylabel(cb,'Prec Trend mm yr^{-1}')
cmocean('-balance','pivot')
hold on
stipple(Lon,Lat,StatisticallySignificant)
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
text(-65.49,-9.719,'Rondonia','vert','top','horiz','center','fontangle','italic')

%%% CHECK FINITE MEASUREMENTS (modeled so should be just 1 color= 780 measurements!)
figure
imagescn(lon,lat,sum(isfinite(pr),3))
cb = colorbar;
ylabel(cb,'Sum of Finite PR Measurements')
caxis([779 781])

%precip for specified months?
pr_mean = monthly(pr,t,7,@mean);
[Lat,Lon,pr_mean] = recenter(Lat,Lon,pr_mean);

figure
imagescn(Lon,Lat,pr_mean*86400*30)
shading interp
cmocean rain
cb = colorbar;
ylabel(cb,'Mean (mm/month)')
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 300])

%%% INTERANNUAL VARIABILITY
month_var = monthly(pr,t,7,@var);
[Lat,Lon,month_var] = recenter(Lat,Lon,month_var);

figure
imagescn(Lon,Lat,month_var*86400*30)
cmocean amp
cb = colorbar;
ylabel(cb,'Variability')
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 0.01])

%%% CREATE MAP FOR MEAN PREC & VARIANCE FOR A MONTH
%calc mean prec
month_mean = monthly(pr,t,7);
[Lat,Lon,month_mean] = recenter(Lat,Lon,month_mean);

figure
imagescn(Lon,Lat,month_mean*86400*30)
cmocean rain
cb= colorbar;
ylabel(cb,'mean Prec (mm/month)')

%plot variance w/contours
hold on
contour(Lon,Lat,month_var,0:0.0001:0.01,'k')
borders('countries','color',rgb('dark gray'))
caxis([0 300])


%%% MASK OUT OCEAN
ocean = ~landmask(lat,lon);
month_mean(ocean) = Nan;
pcolorm(lat,lon,month_mean)










