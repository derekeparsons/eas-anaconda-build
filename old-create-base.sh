#!/bin/bash
# previously 2-create-anaconda-root-new.sh

### CHECK THE PATH carefully, this needs to be manually set to the right anaconda build currently

source deactivate 2> /dev/null

export PATH=/opt/anaconda3/bin:/usr/local/bin:/usr/texbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin

conda config --add channels conda-forge
conda config --set channel_priority strict

conda update conda --yes
if [ $? -ne 0 ]; then echo "Conda update failed.  Check the environment."; exit; fi
conda update --all --yes
pip install --upgrade pip
pip install --upgrade httplib2
pip install --upgrade backports.ssl-match-hostname

conda install --yes future netcdf4 ssh pywget simplejson pyproj pygrib pydap gdal geos shapely xarray basemap geotiff seaborn metpy matplotlib pynio pyngl icu tzlocal

conda install --yes -c ncas cf-python

conda install --yes dateutil  node-webkit  ujson  zeromq  abstract-rendering  atom casuarius   dynd-python enaml gevent-websocket ipython-notebook ipython-qtconsole launcher lcms llvm llvmpy mock pyface runipy traitsui

pip install --upgrade area

conda install --yes wrf-python cartopy
conda install -c eumetsat egenix-mx-base --yes

