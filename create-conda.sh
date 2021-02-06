# create-conda.sh
#
#  Creates the standard Conda environment.  Just the base with a package or
#   two installed on it
#

# Uses:
#
# EAS2500 - Instrumentation

# Notes:
#
# Python is currently pinned to 3.7 due to limited availability of packages
# in 3.8
#

conda create --name conda python=3.7 -y
source activate conda
conda install -c conda-forge sharppy -y
