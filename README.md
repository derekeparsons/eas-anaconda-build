# eas-anaconda-build

Scripts to install anaconda and build on MacOS and Linux hosts

# Scripts

install-anaconda2/3.sh - Downloads and installs the Anaconda installer in a system location accessible
by all users (by default, /opt)

update-base.sh - After install, update to the newest versions of the base packages

create-<env>.sh - Create the environment and install the packages for that environment

# Issues

* Anaconda install location is still hard coded.  Pay attention to the paths used in these scripts

* Currently using Python 3.7 since Python 3.8 was causing package conflicts with many of the packages we were trying to install
