# create-mww3-conda.sh
#
#  Create Mark Wysocki's default anaconda environment
#  Package list captured from comparing his currently installed environment to a newly installed anaconda base
#

# Notes:
#
# Python is currently pinned to 3.7 due to limited availability of packages
# in 3.8
#
# 20201204
#   matplotlib=3.3.3 has been added to avoid matplotlib 3.3.2, which is buggy and
#   the current default.  Once matplotlib 3.3.2 is no longer the default, this
#   requirement can be removed

conda create --name default python=3.7 -y
source activate default
conda install xlwings -y
conda install -c unidata pint metpy -y 
conda install -c conda-forge matplotlib=3.3.3 -y

