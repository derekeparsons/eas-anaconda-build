conda create --name adm-dev python=3.7 -y
source activate adm-dev
conda install numpy scipy matplotlib netcdf4 cartopy xarray -y
conda install ipython jupyter -y
conda install -c conda-forge metpy siphon python-wget cfgrib jupytext -y
