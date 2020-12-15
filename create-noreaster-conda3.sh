# Script to create the conda3 environment on noreaster
conda create --name conda3 python=3.7 -y
source activate conda3
conda install netcdf4 libnetcdf basemap scikit-image scikit-learn -y
conda install -c conda-forge cartopy cftime geos hdf4 metpy opencv pyproj shapely xarray -y
