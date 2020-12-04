# create-adm.sh
#
#  Creates the adm/dynamics anaconda environment
#

# Uses:
#
#  EAS3411 - Atmospheric Thermodynamics and Hydrostatics Laboratory
#  EAS3421 - Atmospheric Dynamics Discussion: Quantitative Visualization

# Notes:
#
# Python is currently pinned to 3.7 due to limited availability of packages
# in 3.8
#
# 20201204
#   matplotlib=3.3.3 has been added to avoid matplotlib 3.3.2, which is buggy and 
#   the current default.  Once matplotlib 3.3.2 is no longer the default, this
#   requirement can be removed

conda create --name adm python=3.7 -y
source activate adm
conda install numpy scipy netcdf4 cartopy xarray -y
conda install ipython jupyter -y
conda install -c conda-forge metpy siphon python-wget cfgrib matplotlib=3.3.3 -y
