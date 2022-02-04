# Matlab-Scripts
Programs in MATLAB  to handle nc, shapefiles, etc.

/Validation scripts: includes scripts to calculate model bias and RMSE (WRF-ERA5 with CHIRPS and UDEL as obs)
![WRFphys_pr_bias](https://user-images.githubusercontent.com/83616016/152476499-cbf410a0-8a30-4c40-9834-a2348bddb4a3.png)
![WRFphys_t2_rmse](https://user-images.githubusercontent.com/83616016/152476509-3a365b0f-e9a5-44c6-926a-aa69f4ae5d1d.png)

/Amazon_CMIP6 analysis subfolder: contains a script with MANY different ways to anlayze climate data: ribbon plots; dry/wet season CDFs; seasonal mean plots; anomalies; mean/std; taylor stats; etc.
![Taylor_p_new](https://user-images.githubusercontent.com/83616016/152448065-dc159de3-cd65-46d1-985c-ae9ea0e8a273.png)
![Skill Score_NAZ](https://user-images.githubusercontent.com/83616016/152448070-4c4d0adf-941c-4a6c-8619-52b8e630c60d.png)
![Annual_Cycle_Prec_UPDATED CHIRPS  Legal Amazon of Brazil crop _NAZ](https://user-images.githubusercontent.com/83616016/152448093-4ee5f287-87d6-4f86-ae87-6b4c7e9f6acb.png)
![Ensemble Mean_Whole Domain_2050-2100_SSP585](https://user-images.githubusercontent.com/83616016/152448114-d7600b2e-17b0-4a5a-b431-b6fe12c44fb0.png)
![SAZ_BarPlot_hist_585_dry season](https://user-images.githubusercontent.com/83616016/152448137-df4f0080-a96c-49e0-935f-bb46336a2724.png)
![NAZ_ECDF_hist + 585_dry](https://user-images.githubusercontent.com/83616016/152448144-c4335d32-5926-4c60-a7d0-8f9f3002f005.png)
![Stacked_Ratio Analysis_NAZ +SAZ](https://user-images.githubusercontent.com/83616016/152448202-ab0002ce-8d4f-4d9d-96d8-925b4fa736a0.png)
![spatial stdev](https://user-images.githubusercontent.com/83616016/152448209-f275d7a9-d566-4801-b7bf-cb9e1e49b2cb.png)
![RMSE_BIAS_CCOEF NAZ SAZ_side by side](https://user-images.githubusercontent.com/83616016/152448221-d8e479ed-c3ca-49c4-887a-c9e512ce3d74.png)

rmse_WRFcmip6_CHIRPS: Uploads nc CMIP6 files and creates mat files. Loads in mat files and creates bias + rmse plots with CHIRPS and ERA5 as observational data

![wrftest2 bias_ERA5_all months](https://user-images.githubusercontent.com/83616016/132908170-1801ea66-10cb-4444-bf41-59af6b36ccda.png)

/EOF subfolder contains scripts to calculate EOFs from CMIP6 input files
![EOF_mode 1](https://user-images.githubusercontent.com/83616016/152439438-d83ba08b-3178-4a22-bd5c-90ed6d2a827a.png)
