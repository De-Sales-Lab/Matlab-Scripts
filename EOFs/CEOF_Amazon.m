%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%  Updated to include CMIP6 models and obs %%%%%%%%%%%%%%%
%%%%%%%%%%%%%%   Load in pr mat files first *c.mat   %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  This data has been masked for ocean   %%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  And has been cropped for Legal Amazon  %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%  Data contains NaN already in mat files %%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
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

CHIRPSc = CHIRPSc./30.4167;
UDELc = UDELc./30.4167;

%check averages of stack- switch out dataset
mean(CHIRPSc,'all','omitnan')

%DO I NEED THIS?
vname='Pr'
thour='Day'
yr=4; %select year to process (yr=1 for 2003, yr=2 for 2004, ....)

reg=[-90 -25;-34.875 19.875];   %lon/lat (S. America roughly)
im=1:1;
iyr=1:1;

lo=reg(1,1):0.25:reg(1,2);   %increments between lat/lon is 0.25
la=reg(2,1):0.25:reg(2,2);

nx0=261;   %lon
ny0=220;   %lat
nt=408;   %1981-2014 monthly data
x=-90:0.25:-25;    %lon with 0.25 inc
y=-34.875:0.25:19.875;  %lat with 0.25 inc

%variable 3D matrix for precipitation (lat, lon, time)
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
% GLDASc
% CHIRPSc

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

nd=size(dt,1);


%DO I NEED THIS?
%match year
if yr==1; year=2003;end
if yr==2; year=2004;end
if yr==3; year=2005;end
if yr==4; year=2006;end

%DO I NEED THIS?- yes for reshaping in line ~125
[ism, indx]=ismember(lo,x);
[ism, indy]=ismember(la,y);
[xi, yi]=meshgrid(lo,la);
[ny, nx]=size(xi);

%DO I NEED THIS?
%I believe this is the land-sea mask used in line ~146
%Crops with 'in'
load gcoastpatchlo   %global coastline patch data
%gcoastpatchlo contains s with long and lat structure
%Why the third structure? For Africa? I need South America. 2? 
%It is 499 long for each lat/long, that's why px/py are 499
[px, py]=poly2cw(s(3).long,s(3).lat);  %polygon contour to clockwise ordering
in=inpolygon(xi,yi,px,py);
along=[-180;-180;180;180;-180;s(3).long;-180];
alat=[-90;90;90;-90;-90;s(3).lat;-90];


%use this to create array with nan size of lat lon time models
z=nan(ny0,nx0,nt,nd);

%read in binary files and add together or stack into z (nan matrix)
%Can't get Read_pr_datasets_cropped to work (the way it's reading the
%files??) Reads the first dim of dt (the Data as []c)
for i=1:nd
    tmp=Read_pr_datasets_cropped(dt{i,1});
    if isempty(tmp)
        disp(['var non-exist: ' dt{i,1}])
    else
        z(:,:,:,i)=tmp;
    end
end

%Stack all data myslef (DIFFERENT THAN ORIGINAL- replicate above line 112-122)
%These are formatted as lat lon time with NaN values.
%Stacked in order from dt
z= cat(3,CHIRPSc,CMAPc,UDELc,GLDASprc,BCCCSM2MRc,BCCESM1c,CanESM5c,...
    CESM2c,CESM2WACCMc,E3SM10c,ECEarth3c,ECEarth3Vegc,GISSE21Gc,...
    GISSE21Hc,MIROC6c,MRIESM20c,SAM0UNICONc);

fhd=z;   %is this just to save in case something goes wrong?
z=reshape(z,[ny0 nx0 nt nd]);   %to categorize by dataset (nd=17 datasets)
z=z(indy,indx,:,:);    %Not sure exactly what this does??? But indy=220 indx=261 (lat/lon)

%DO I NEED THIS?
%grab selected year for 1 year
y1=((yr-1)*36)+1; y2=y1+35;
q=nan(ny,nx,36,nd);
for i=1:nd
    q(:,:,:,i)=z(:,:,y1:y2,i);   %WHERE ELSE IS q used??? I don't see it used
end
nt=36;   %this is where the 36 comes from

%calculate and remove total mean
% mm = nanmean(z,3);   %nanmean not recommended. Use mean with 'omitnan'
mm = mean(z,3,'omitnan');    %get mean in 3D, 'omitnan'
ff=NaN(ny,nx,nt,nd);    %create array of NaN values lat/lon/time/datasets
for i=1:nt
    ff(:,:,i,:) = z(:,:,i,:) - mm(:,:,1,:);
end
z=ff;   %z is now ff (total mean removed)

%DO I NEED THIS?
%My files are masked for ocean and cropped by shapefile (Legal Amazon of Brazil)
%apply sea-land mask #points (lat*lon), time, models
z=reshape(z,[ny*nx nt nd]);   %run this
z=z(in,:,:);   %don't need to run this- already cropped for land/sea

%determine which models have NAN in the data and exclude them!
%Does this mean any NaN in the data or completely nan?
%What if ii returns nothing? This means that my data have nan
%I know that my data have nan, but how to handle this?
%Can't compute eig with nan values
ii=find(~any(any(isnan(z),2),1));  %Problem with this
%ii = find(~any(isnan(z),2),1); %maybe this could work??? Not yet..
z=z(:,:,ii);
zz=reshape(z,[size(z,1) size(z,2)*size(z,3)]);  %zz will be lon*lat and time*models


%nd2 = nd since all files are good ones
%What if ii is empty? No values.

nd2=length(ii);   %if ii is empty, this returns 0 length. nd=17
modname=dt(ii,2);
% modname=dt(:,2);   %all of column 2 of dt (names of datasets)

%calculate commom EOFs 
X=zz';
[vv dd]=eig(X*X');     %data cannot contain NaN!!! THIS IS MY ISSUE
vv=X'*vv*(dd^-0.5);  %transposed orig data*eig/sqrt(PC)??
vv=fliplr(vv);       %flip array left to right
dd0=flipud(diag(dd));    % dd0 not used anywhere
dd0=dd0(1:6)/sum(dd0);   %1:6 select fewer PC
clear dd

%calculate partial explained variance dd var for SEPARATE
for i=1:nd2
    disp(i)
    X0=z(:,:,i)';   %original data
    dtmp=X0*vv;   %mult one group eof by data itself
    dtmp=dtmp'*dtmp;%vv'*(X0'*X0)*vv;   %ytansposed
    dtmp=abs(diag(dtmp));
    dd(:,i)=dtmp(1:6)/sum(dtmp);    %select fewer PCs. Divide by sum
end

%calculate commom PCs
tt=X*vv;
clear X

%collect first 3 EOF's and PC's
vv=vv(:,1:3);   %vv is EOF
tt=tt(:,1:3);   %tt is PC
tt=reshape(tt,[36,1,nd2,3]);   %I think I would change 36 to 408
tt=squeeze(mean(tt,2));
eoftt=tt;  %eigenvalues (pc)
eofdd=dd;  %explained variance for each model (ev)

eofvv=nan(ny*nx,3);
eofvv(in,:)=vv;
eofvv=reshape(eofvv,ny,nx,3);  %eigenvectors (eof)

%select 3 first eofs for bar plot
eofdd=eofdd(1:3,:);

%reverse sign of 1st EOF
for i=1:3
    eofvv(:,:,i)=-1*eofvv(:,:,i);
    eoftt(:,:,i)=-1*eoftt(:,:,i);
end
eofvv(:,:,2) = -1*eofvv(:,:,2); %change sign of 2nd eof to match climat eof (fig.9)

%define plot name (title)
pname=[num2str(year) [sprintf(' Common EOF 5-%s %s',thour,vname)]];
figure('position',[25 25 1260 945],'color','white','name',pname); 
hn=annotation('textbox',[0  0.95 1 0.05],'HorizontalAlignment','center','edgecolor','none','string',pname);
set(hn,'fonts',16,'color','black');

[lcc,lss]=linstyw(modname,1,2);

cv1=[-0.03:0.01:0.03];  %colorbar for 1st contour plot
cv2=[-0.03:0.01:0.03];  %colorbar for 2nd contour plot
cv={cv1 ; cv2};

cores=flipud(jet(length(cv{1})+1));

%first EOF
    i=1
    axes('pos',[0.1300    0.55    0.3347    0.3412]);
    title(['Eigenvector-',num2str(i)],'fonts',12);
    hold on
    [C h hb]=freecontourf2(lo,la,eofvv(:,:,i),cv{i},cores);
    set(h,'edgecolor','none')
    hc=mapnorm(lo,la,true,false,false,false,false,0,[10 10],1,'g');
    set(hc,'fonts',11,'xaxisloc','bott')
    gmaplab(3);
    grid off
    
%second EOF
     i=2
     axes('pos',[0.5703    0.55    0.3347    0.3412]);
     title(['Eigenvector-',num2str(i)],'fonts',12);
     hold on
     [C h hb]=freecontourf2(lo,la,eofvv(:,:,i),cv{i},cores);
     set(h,'edgecolor','none')
     hc=mapnorm(lo,la,true,false,false,false,false,0,[10 10],1,'g');
     set(hc,'fonts',11,'xaxisloc','bott')
     gmaplab(3);
     grid off
    
%bar plot
lab=['a' 'b' 'c' 'd' 'e' 'f' 'g' 'h' 'i' 'j' 'k' 'l' 'm' 'n' 'p' 'q' 'r'];
lab2={'REA2' 'REA1' {'ERA';'Interim'} 'COLA' {'CAM';'Dust'} {'CAM';'No Dust'} ...
     'MRI' 'GMAO' {'FVGCM';'Aer'} {'FVGCM';'No Aer'} ...
      {'CFS'} {'GFS'} {'HadAM3'} {'UCLA','GCM'} ...
      {'MRF'} {'CPC';'GTS'} 'ALMIP' 'CMAP'};
%create matrix for bar plot (eofddd) 
%if all models have data, then eofddd=eofdd
for k=1:nd
    eofddd(1:3,k) = nan;
end
eofddd(1:3,ii)=eofdd(1:3,1:nd2);

%reorder eofdd so obs_xie,almip and cmap are last
j=[2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 1 18 17];
k=[1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18];
tmpp=eofddd;
eofddd(:,k) = tmpp(:,j);
dt_org=dt;
dt(k,:) = dt_org(j,:);

    axes('pos',[0.1300    0.1100    0.7750    0.3412]);
    bar(eofddd'*100)
    ylim([0 100])  %change y-axis to 0-100.
    xlim([0.5 nd+0.5]) %expand x-axis
    set(gca,'xtick',1:nd);  %ticks
    h0=my_xticklabels(gca,[1:nd],lab2,'fonts',7);
    set(gcf,'color','w')  % ???
    colormap jet;
    set(gca,'fonts',11,'layer','top') %bold-line box
    hl=legend('Eig1','Eig2','Eig3');  %add legend
    set(hl,'fonts',9,'xaxisloc','bott')
    title('Explained variance of eigenvalue(%)','fonts',12); %add title

fname=['ceof_05d_5day' num2str(year)];
savpic('.\figures',fname,'all');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%