clear all;

cd 'C:\Users\Corrie\Documents\Dissertation\Data\CMIP6\Analysis_CMIP6'

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

% %These are cropped files (shapefile- Legal Amazon of Brazil)
% fds = fileDatastore('.\Final_Files\*c.mat', 'ReadFcn', @importdata);
% fullFileNames = fds.Files;
% numFiles = length(fullFileNames);
% for k = 1 : numFiles
%     fprintf('Now reading file %s\n', fullFileNames{k});
%     load(fullFileNames{k});
% end

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

% GET ENSEMBLE MEAN
%Combine all 13 models in 3d matrix of mean
EnsembleMeanpr = cat(13,BCCCSM2MRpr+BCCESM1pr+CanESM5pr+CESM2pr+CESM2WACCMpr+...
    E3SM10pr+ECEarth3pr+ECEarth3Vegpr+GISSE21Gpr+GISSE21Hpr+MIROC6pr,...
    MRIESM20pr+SAM0UNICONpr);
EnsembleMeanpr(isnan(EnsembleMeanpr)) = 0;
EnsembleMeanpr = sum(EnsembleMeanpr,13)./sum(EnsembleMeanpr ~=0,4);

%Turn lat/lon into grid
[Lon,Lat] = meshgrid(lon,lat);
lon2 = lon-360;   %adjust lon

%load basic image of mean pr (pr or c) (UDEL/CHIRPS/GLDAS no ocean)
figure
pcolor(lon2,Lat,mean(CHIRPSpr,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 10])

%Mask out all points that correspond to ocean (set ocean grid cells to NaN)
%new name for each dataset includes 'c' for crop
%And select only 1981-2014 (:,:,25:432) except CHIRPS
land = island(Lat,Lon);
ocean = ~land;   %ocean is NOT land

UDELc = mask3(UDELpr(:,:,25:432),ocean);  %OBS pr
CHIRPSc = mask3(CHIRPSpr,ocean);
CMAPc= mask3(CMAPpr(:,:,25:432),ocean);
GLDASc= mask3(GLDASpr(:,:,25:432),ocean);  %GLDAS pr

BCCCSM2MRc = mask3(BCCCSM2MRpr(:,:,25:432),ocean);    %MOD pr
BCCESM1c = mask3(BCCESM1pr(:,:,25:432),ocean);
CanESM5c = mask3(CanESM5pr(:,:,25:432),ocean);
CESM2c	= mask3(CESM2pr(:,:,25:432),ocean);
CESM2WACCMc = mask3(CESM2WACCMpr(:,:,25:432),ocean);
E3SM10c = mask3(E3SM10pr(:,:,25:432),ocean);
ECEarth3c = mask3(ECEarth3pr(:,:,25:432),ocean);
ECEarth3Vegc = mask3(ECEarth3Vegpr(:,:,25:432),ocean);
GISSE21Gc = mask3(GISSE21Gpr(:,:,25:432),ocean);
GISSE21Hc = mask3(GISSE21Hpr(:,:,25:432),ocean);
MIROC6c = mask3(MIROC6pr(:,:,25:432),ocean);
MRIESM20c = mask3(MRIESM20pr(:,:,25:432),ocean);
SAM0UNICONc = mask3(SAM0UNICONpr(:,:,25:432),ocean);
EnsembleMeanc = mask3(EnsembleMeanpr(:,:,25:432),ocean);

%Replot with masked out ocean (change mod/obs) to quick check
figure
pcolor(lon2,Lat,mean(CESM2c,3))
shading interp
axis tight
cmocean dense
cb = colorbar;
hold on
borders('countries','color',rgb('dark gray'))
xlabel longitude
ylabel latitude
caxis([0 10])

nx=261; %lon
ny=220; %lat
nt=408; %time
nd=1;  %or 1 for just individual datasets

%REMOVE seasonal cycles from individual datasets before cat (Method 1)
%OR just skip to z = cat(3, ALL DATASETS). Just remove the longterm mean
%(~line 185)
StartDate = datetime(1981,01,01,"Format","MMM-uuuu");  %for each dataset create time vector
EndDate = datetime(2014,12,31,"Format","MMM-uuuu");
dates= StartDate:calmonths(1):EndDate;
modtimeColumn = dates.';
modtime = datenum(dates');

%DESEASON datasets. Assumes monthly, but can force that with 'monthly'
%deseason removes the seasonal (aka annual) cycle of variability
%As Will contain average values for each of the 12 months of the year
%Can specify 'linear' 'quadratic' or 'none' for ...'detrend', DetrendOption)
%By default anomalies are calculated after removing linear least squares trend
%Trend is strongly non-linear? 'quadratic'
%Performed along DIM3
CHIRPSd = deseason(CHIRPSc,modtime,'monthly');
BCCCSM2MRd = deseason(BCCCSM2MRc,modtime,'monthly');  
BCCESM1d = deseason(BCCESM1c,modtime,'monthly');  
CanESM5d = deseason(CanESM5c,modtime,'monthly'); 
CESM2d = deseason(CESM2c,modtime,'monthly');
CESM2WACCMd = deseason(CESM2WACCMc,modtime,'monthly'); 
E3SM10d = deseason(E3SM10c,modtime,'monthly'); 
ECEarth3d = deseason(ECEarth3c,modtime,'monthly'); 
ECEarth3Vegd = deseason(ECEarth3Vegc,modtime,'monthly'); 
GISSE21Gd = deseason(GISSE21Gc,modtime,'monthly'); 
GISSE21Hd = deseason(GISSE21Hc,modtime,'monthly'); 
MIROC6d = deseason(MIROC6c,modtime,'monthly'); 
MRIESM20d = deseason(MRIESM20c,modtime,'monthly'); 
SAM0UNICONd = deseason(SAM0UNICONc,modtime,'monthly'); 
CMAPd = deseason(CMAPc,modtime,'monthly'); 
UDELd = deseason(UDELc,modtime,'monthly'); 


%Plot CHIRPS ts before deseason and after deseason
%CHIRPSc = before deseason CHIRPSd= after deseason
mask = geomask(Lat,Lon,[-18 6],[-76 -42]);  %just a square around Brazilian Amazon

figure
imagescn(lon2,lat,mask)   %just for box mask
axis xy tight
title 'Brazilian Amazon mask'
xlabel 'longitude'
ylabel 'latitude'
ax = axis;
borders('countries')
axis(ax)

CHIRPSts = local(CHIRPSc,mask,'omitnan');  %get time series for mask (regular)
CHIRPSts_deseason = local(CHIRPSd,mask,'omitnan');  %deseasoned

figure
plot(dates,CHIRPSts,'k','linewidth',2)
box off
axis tight
xlabel 'year'
ylabel 'mm/day'
hold on
plot(dates,CHIRPSts_deseason,'r','linewidth',2) 
legend('CHIRPS','CHIRPS deseasoned','Location','northeastoutside')

%Get time series of each dataset
UDELts = local(UDELc,mask,'omitnan');       %OBS
CHIRPSts = local(CHIRPSc,mask,'omitnan');
CMAPts = local(CMAPc,mask,'omitnan');

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
EnsembleMeants = local(EnsembleMeanc,mask,'omitnan');

%Calculate autocorrelation of CHIRPSts for sampling errors
%Calc effective sampling size
acf = autocorr(EnsembleMeants,'NumLags',1);
top = (1-0.824.^2);
bottom = (1+0.824.^2);
div = top/bottom;
N.eff = 408*div;

% %THIS IS TO EXTRACT RAINY SEASON BEFORE LONGTERM MEAN
% %Evaluate RAINY SEASON ONLY (feb, mar, apr) Month==2,3,4
% %Extract before long-term mean (long-term mean evaluated for rainy season only)
% rainySEASON = month(dates) == 1 | month(dates) == 2 | month(dates) == 12;
% 
% % Extract rainy season data from dataset
% CHIRPScrainy = CHIRPSc(:,:,rainySEASON);
% nt=102;  %new time vector


%COMBINE datasets (CEOF) OR label 1 dataset as 'z' (EOF)
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
% EnsembleMeanc
% UDELc
% CMAPc
% CHIRPSc
z = UDELc;   %JUST CHIRPS (or individual datasets) all months
z = CHIRPScrainy;   %JUST CHIRPS (or individual datasets) rainy season
z = cat(3,CHIRPSc,BCCCSM2MRc,BCCESM1c,CanESM5c,CESM2c,CESM2WACCMc,...
    E3SM10c,ECEarth3c,ECEarth3Vegc,GISSE21Gc,GISSE21Hc,MIROC6c,MRIESM20c,...
    SAM0UNICONc,CMAPc,UDELc);

z = UDELc;    %JUST individual datasets- all months  ###1
z=reshape(z,[ny nx nt nd]);
z(isnan(z))=0;

%REMOVE long-term trend
mm = nanmean(z,3);
ff=nan(ny,nx,nt,nd);

for i=1:nt
    ff(:,:,i,:) = z(:,:,i,:) - mm(:,:,1,:);
end
z=ff;

%THIS IS TO EXTRACT RAINY SEASON AFTER LONGTERM MEAN
%Evaluate RAINY SEASON ONLY (DJF) Month==12,1,2
%Extract after long-term mean (long-term mean evaluated for all months)
rainySEASON = month(dates) == 1 | month(dates) == 2 | month(dates) == 12;

% Extract rainy season data from dataset
z = z(:,:,rainySEASON);
nt=102;  %new time vector

%reshape  ###2
z=reshape(z,[ny*nx nt nd]);
zz=reshape(z,[size(z,1) size(z,2)*size(z,3)]);
X=zz';

%plot covariance matrix
covarmat=X*X';
[x,y] = find(covarmat>590000);

scatter(x,y,'ro','MarkerFaceColor','r')  %plot
xlim([0 408])
ylim([0 408])

%calculate commom EOFs   ###3
[vv dd]=eig(X*X');
vv=X'*vv*(dd^-0.5);
vv=fliplr(vv);

%combined explained variances
dd0=flipud(diag(dd));
cexpvar=dd0(1:3)/sum(dd0);

%calculate partial explained variance (first 3)
clear dd
for i=1:nd
    X0=z(:,:,i)';
    dtmp=X0*vv;
    dtmp=dtmp'*dtmp;%vv'*(X0'*X0)*vv;
    dtmp=abs(diag(dtmp));
    dd(:,i)=dtmp(1:3)/sum(dtmp);
end

%calculate first 3 partial PC
tt=X*vv;
clear X
vv=vv(:,1:3);   %first 3 eof
tt=tt(:,1:3);   %first 3 eof
tt=reshape(tt,[nt,1,nd,3]);
tt=squeeze(mean(tt,2));

%final product
eoftt=tt;   %eigenvalues (pc)
eofdd=dd;  %explained variance (ev)
eofvv=reshape(vv,ny,nx,3);  %eof


for i=1:3
    figure
    pcolor(Lon,Lat,eofvv(:,:,i))
    shading interp
    axis tight
    cb = colorbar;
    hold on
    xlabel longitude
    ylabel latitude
end

%scale to -1 1 just for 1 model   ###4
for k = 1:3

   % Find the the maximum value in the time series of each principal component:
   maxval = max(abs(eoftt(:,k)));
   
   % Divide the time series by its maximum value:
   eoftt(:,k) = eoftt(:,k)/maxval;
   
   % Multiply the corresponding EOF map:
   eofvv(:,:,k) = eofvv(:,:,k).*maxval;
end

%scale to -1 1 just for ALL datasets
%eoftt = PC (408x16x3) 
%eofvv = eof maps (220x261x3)
for k = 1:16

   % Find the the maximum value in the time series of each principal component:
   maxval1 = max(abs(eoftt(:,k,1)));
   maxval2 = max(abs(eoftt(:,k,2)));
   maxval3 = max(abs(eoftt(:,k,3)));
   % Divide the time series by its maximum value:
   eoftt(:,k,1) = eoftt(:,k,1)/maxval1;
   eoftt(:,k,2) = eoftt(:,k,2)/maxval2;
   eoftt(:,k,3) = eoftt(:,k,3)/maxval3;
   % Multiply the corresponding EOF maps:
   %eofvv(:,:,k) = eofvv(:,:,k).*maxval;
end

Lon=Lon-360;
s = [1 1 1 1 1 1];

%map for EOF (one dataset) (Neg (-) for CHIRPS, CMAP, GISSE21H)   ###5
% Divide EnsembleMean by 10
figure('pos',[100 100 500 700])
for k = 1:3
   subplot(3,1,k)
   imagescn(Lon,Lat,eofvv(:,:,k)*s(k));  %(-) for CHIRPS, CMAP, GISSE21H
   %imagescn(Lon,Lat,eofvv(:,:,k)/10*s(k));  %(-) for EnsembleMean (divide by 10)
   %axis xy off
   %title(['Mode ',num2str(k),' (',num2str(eofdd(k,1)*100,'%0.1f'),'%)'])
   title(['Mode ',num2str(k),' (',num2str(eofdd(k)*100,'%0.1f'),'%)'])  %avg all models
   %caxis([-2 2]) %mostly use this
   borders('countries','color',rgb('dark gray'))
   %caxis([-.02 .02])   %this is if you don't scale to -1 1
   caxis([-10 10])
   %xlim([-75 -43])
   %ylim([-20 7])
   cb = colorbar;
end
colormap(gcf,cmocean('balance','pivot',0))
%colormap(flipud(jet))

%map for CEOF (all datasets)
figure('pos',[100 100 500 700])
for k = 1:3
   subplot(3,1,k)
   imagescn(Lon,Lat,eofvv(:,:,k)*s(k));
   %axis xy off
   %title(['Mode ',num2str(k),' (',num2str(eofdd(k,1)*100,'%0.1f'),'%)'])
   title(['Mode ',num2str(k),' (',num2str(mean(eofdd(k,1:16))*100,'%0.1f'),'%)'])  %avg all models
   %caxis([-2 2]) %mostly use this
   borders('countries','color',rgb('dark gray'))
   caxis([-.02 .02])   %this is if you don't scale to -1 1
   %caxis([-10 10])
   %xlim([-75 -43])
   %ylim([-20 7])
   cb = colorbar;
end
colormap(gcf,cmocean('balance','pivot',0))
%colormap(flipud(jet))

% CEOF ANLAYSIS (all datasets combined)
%Create bar plot with % for first 3 modes of all datasets
%Input modes % from excel file (Var_stats EOF tab) copy and paste
ID_bar = categorical({'CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','CMAP','UDEL'});
ID_bar = reordercats(ID_bar,{'CHIRPS','BCCCSM2MR','BCCESM1','CanESM5','CESM2','CESM2WACCM',...
    'E3SM10','ECEarth3','ECEarth3Veg','GISSE21G','GISSE21H','MIROC6','MRIESM20',...
    'SAM0UNICON','CMAP','UDEL'});
vals_bar = [0.460875093195382,0.555925769912461,0.581598422128350,0.561445587907016,0.667265487064126,...
    0.670111268830897,0.676214674330156,0.615391776890034,0.626043470593112,0.481789769072340,0.407677117196678,...
    0.667884986214602,0.672253020941795,0.558093449562230,0.481419541695420,0.438694809615433;0.119697362135520,...
    0.0708928201965625,0.0677013208737940,0.131543448091438,0.127720261588284,0.128926082867190,0.0863163779493795,...
    0.121237252911287,0.116190370576049,0.166797706521305,0.158264386711851,0.110536181111828,0.102055976065911,...
    0.112455578789580,0.134049139376416,0.110029046080771;0.0278709310715947,0.0912855649937792,0.0838584054516254,...
    0.0420675855630421,0.0468153615539287,0.0441144901645238,0.0680423759637175,0.0678911621099029,0.0674714033461022,...
    0.0680042305069452,0.0642464224129607,0.0229361908245803,0.0400537521199244,0.0623005964448119,0.0438673678836321,...
    0.0350479888316113];
% ID_bar = categorical({'CHIRPS','CESM2','MRIESM20'});
% ID_bar = reordercats(ID_bar,{'CHIRPS','CESM2','MRIESM20'});
% vals_bar = [60.96 20.25 2.65; 67.74 14.1 3.43; 68.55 16.06 2.85];
b = bar(ID_bar,vals_bar);
set(b,{'Displayname'},{'Mode 1','Mode 2','Mode 3'}')
ylim([0 1])
%ylabel('%')
legend('Fontsize',12)
title('Explained variance of eigenvalue','fontSize',12);

% EOF ANLAYSIS (each dataset computed separately)
%Create bar plot with % for first 3 modes of all datasets
%Input modes % from excel file (Var_stats EOF tab) copy and paste
ID_bar = categorical({'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1','CanESM5',...
    'CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg','GISSE21G',...
    'GISSE21H','MIROC6','MRIESM20','SAM0UNICON'});
ID_bar = reordercats(ID_bar,{'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON'});
vals_bar = [52.9,54.2,51.7,75.4,65.6,...
    65,71,72,72,67.2,67.6,62.4,61.4,72.7,71.8,61.7;...
    14.4,15.2,13.5,13.3,9.7,13.2,12.4,...
    11.7,11.3,12.3,12.3,11.8,14.5,11.5,11.7,13.9];
err_bar = [4.080,4.251,4.028,5.829,5.157,...
    5.066,5.434,5.532,5.545,5.320,5.335,4.814,4.761,5.669,5.497,4.794;...
    1.111,1.192,1.052,1.028,0.763,1.029,0.949,0.899,...
    0.870,0.974,0.971,0.910,1.124,0.897,0.896,1.080];

b = bar(ID_bar,vals_bar);
set(b,{'Displayname'},{'Mode 1','Mode 2'}')
ylim([0 100])
ylabel('%')
legend('Fontsize',10,'Location','northeastoutside')
title('Explained variance of eigenvalue (%)','fontSize',12);
hold on
er = errorbar(ID_bar,vals_bar,err_low,err_high);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  
hold off

%second version of grouped barplot (using v2 and N.eff from EOF tab on
%Var_stats. This is just the autocorr multiplied by sample size
model_series = [52.9 14.4; 54.2 15.2; 51.7 13.5; 75.4 13.3; 65.6 9.7; 65 13.2;...
    71 12.4; 72 11.7; 72 11.3; 67.2 12.3; 67.6 12.3; 62.4 11.8; 61.4 14.5;...
    72.7 11.5; 72.8 11.7; 61.7 13.9];
model_error = [4.08 1.111; 4.251 1.192; 4.028 1.052; 5.829 1.028; 5.157 0.763;...
    5.066 1.029; 5.434 0.949; 5.532 0.899; 5.545 0.870; 5.320 0.974; 5.335 0.971;...
    4.814 0.91; 4.761 1.124; 5.669 0.897; 5.497 0.896; 4.794 1.08];
figure
b = bar(model_series,'grouped');
ylabel('%')
ylim([0 100])
legend('Mode 1','Mode 2','Fontsize',10,'Location','northeastoutside')
title('Explained variance of eigenvalue (%)','fontSize',12);
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

%second version of grouped barplot (using v1 (yellow) and N from EOF tab on
%Var_stats. This is N*((1-r^2)/(1+r^2)) with r being the autocorr lag-1
model_series = [52.9 14.4; 54.2 15.2; 51.7 13.5; 63.4 11.1; 65.6 9.7; 65 13.2;...
    71 12.4; 72 11.7; 72 11.3; 67.2 12.3; 67.6 12.3; 62.4 11.8; 61.4 14.5;...
    72.7 11.5; 72.8 11.7; 61.7 13.9;79 11];
model_error = [8.47 2.306; 8.028 2.251; 7.892 2.061; 10.038 1.758; 9.624 1.423;...
    9.9 2.01; 11.843 2.068; 11.76 1.911; 11.618 1.823; 9.588 1.755; 9.765 1.777;...
    9.979 1.887; 9.576 2.261; 11.051 1.748; 11.953 1.948; 9.534 2.148;13.499 1.88];
figure
b = bar(model_series,'grouped');
ylabel('%')
ylim([0 100])
legend('Mode 1','Mode 2','Fontsize',10,'Location','northeastoutside')
title('Explained variance of eigenvalue (%)','fontSize',12);
hold on;
[ngroups, nbars] = size(model_series);
x=nan(nbars,ngroups);
for i = 1:nbars
    x(i,:) = b(i).XEndPoints;
end
errorbar(x',model_series,model_error,'k','linestyle','none');
% Set the remaining axes properties
xticks([1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17])
xticklabels({'CHIRPS','CMAP','UDEL','BCCCSM2MR','BCCESM1',...
    'CanESM5','CESM2','CESM2WACCM','E3SM10','ECEarth3','ECEarth3Veg',...
    'GISSE21G','GISSE21H','MIROC6','MRIESM20','SAM0UNICON','Ensemble Mean'})
xtickangle(45)
hold off;

%Third method for each bar plot (MODE 1)
data = [52.9,54.2,51.7,75.4,65.6,...
    65,71,72,72,67.2,67.6,62.4,61.4,72.7,71.8,61.7]';
errlow = [4.080,4.251,4.028,5.829,5.157,...
    5.066,5.434,5.532,5.545,5.320,5.335,4.814,4.761,5.669,5.497,4.794];
errhigh = [4.080,4.251,4.028,5.829,5.157,...
    5.066,5.434,5.532,5.545,5.320,5.335,4.814,4.761,5.669,5.497,4.794];

bar(ID_bar,data)      %mode 1: '#0072BD' mode 2:'#D95319'  
ylim([0 100])
ylabel '%'
hold on

title 'Mode 1 Explained Variance with Sampling Errors'
er = errorbar(ID_bar,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

%Third method for each bar plot (MODE 2)
data = [14.4,15.2,13.5,13.3,9.7,13.2,12.4,...
    11.7,11.3,12.3,12.3,11.8,14.5,11.5,11.7,13.9]';
errhigh = [1.111,1.192,1.052,1.028,0.763,1.029,0.949,0.899,...
    0.870,0.974,0.971,0.910,1.124,0.897,0.896,1.080];
errlow  = [1.111,1.192,1.052,1.028,0.763,1.029,0.949,0.899,...
    0.870,0.974,0.971,0.910,1.124,0.897,0.896,1.080];

bar(ID_bar,data,'facecolor','#D95319')      %mode 1: '#0072BD' mode 2:'#D95319'       
ylim([0 100])
ylabel '%'
hold on

title 'Mode 2 Explained Variance with Sampling Errors'
er = errorbar(ID_bar,data,errlow,errhigh);    
er.Color = [0 0 0];                            
er.LineStyle = 'none';  

hold off

%Create plot for 34 years of monthly data
%eoftt is explained variance (PC)
%plot the first three modes of variability as TIME SERIES
figure
subsubplot(3,1,1)
plot(modtime,eoftt(:,1))  %modtime change  and grabs the 1 row all columns
box off
axis tight
ylabel 'pc1'
title 'The first three principal components'

subsubplot(3,1,2)
plot(modtime,eoftt(:,2))  %modtime change
box off
axis tight
set(gca,'yaxislocation','right')
ylabel 'pc2'

subsubplot(3,1,3)
plot(modtime,eoftt(:,3))  %modtime change
box off
axis tight
ylabel 'pc3'
datetick('x','keeplimits')

%anomaly to plot first mode and multiply by -1
%anomaly of pc1
figure('pos',[100 100 600 250])
anomaly(modtime,-eoftt(:,1),'topcolor',rgb('red'),...  %modtime change
   'bottomcolor',rgb('periwinkle blue')) % First principal component is ??
box off
axis tight
datetick('x','keeplimits')
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
% EnsembleMean
% UDEL
% CMAP
% CHIRPS
%Average each month over the entire time series ***2 PCs***   ###6
%Seasonal anomalies for one dataset
%Multiplied by one (FOR CHRIPS/CMAP to match seasonal cycle)
figure
subsubplot(2,1,1)
plot(season(eoftt(:,1),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 1 seasonal anomaly'
title('UDEL', 'FontSize', 12) %change

subsubplot(2,1,2)
plot(season(eoftt(:,2),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
set(gca,'yaxislocation','right')
xlabel 'month of year'
ylabel 'PC 2 seasonal anomaly'


%Average each month over the entire time series ***3 PCs***
%Seasonal anomalies for one dataset
%Multiplied by one (FOR CHRIPS/CMAP to match seasonal cycle)
figure
subsubplot(3,1,1)
plot(season(eoftt(:,1),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 1 seasonal anomaly'
legend('Ensemble Mean') %change

subsubplot(3,1,2)
plot(season(-eoftt(:,2),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
set(gca,'yaxislocation','right')
xlabel 'month of year'
ylabel 'PC 2 seasonal anomaly'

subsubplot(3,1,3)
plot(season(-eoftt(:,3),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 3 seasonal anomaly'


%Average each month over the entire time series
%Seasonal anomalies for one dataset
%NOT Multiplied by one (SAM0UNICON/MRIESM20UDEL)
figure
subsubplot(3,1,1)
plot(season(eoftt(:,1),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
title 'Not multiplied by -1'
xlabel 'month of year'
ylabel 'PC 1 seasonal anomaly'
legend('UDEL') %change

subsubplot(3,1,2)
plot(season(eoftt(:,2),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
set(gca,'yaxislocation','right')
xlabel 'month of year'
ylabel 'PC 2 seasonal anomaly'

subsubplot(3,1,3)
plot(season(eoftt(:,3),modtime,'monthly'),'--+r','linewidth',2)  %multiply by -1
box off
axis tight
xlabel 'month of year'
ylabel 'PC 3 seasonal anomaly'


%This is just a barplot for one dataset of expvar of eigenvalue
figure
%axes('pos',[0.1300    0.1100    0.7750    0.3412]);
bar(eofdd'*100)
ylim([0 100])  %change y-axis to 0-100.
xlim([0.5 nd+0.5]) %expand x-axis
set(gca,'xtick',1:nd);  %ticks
%h0=my_xticklabels(gca,[1:nd],lab2,'fontSize',7);
set(gcf,'color','w')  
colormap jet;
set(gca,'fontSize',11,'layer','top') %bold-line box
hl=legend('Eig1','Eig2','Eig3');  %add legend
set(hl,'fontSize',9);
title('Explained variance of eigenvalue(%)','fontSize',12); %add title
