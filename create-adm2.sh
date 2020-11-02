conda create --name adm2 python=3.7 -y
source activate adm2
conda install numpy scipy matplotlib netcdf4 cartopy xarray -y
conda install ipython jupyter -y
conda install -c conda-forge  python-wget cfgrib metpy siphon -y
