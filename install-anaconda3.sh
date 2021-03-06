#!/bin/bash

INST_DIR="/opt/anaconda3"
FLAGS="-b -f -p $INST_DIR"
OS="$(/usr/bin/uname)"
USR="$SUDO_USER"
OSX_URL="$(wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-MacOSX-x86_64\.sh\)\">64-Bit Command Line Installer.*@\1@p')"
LINUX_URL="$(wget -O - https://www.anaconda.com/distribution/ 2>/dev/null | sed -ne 's@.*\(https:\/\/repo\.anaconda\.com\/archive\/Anaconda3-.*-Linux-x86_64\.sh\)\">64-Bit (x86) Installer.*@\1@p')"
OSX_INST="$(echo $OSX_URL | cut -d/ -f 5)"
LINUX_INST="$(echo $LINUX_URL | cut -d/ -f 5)"

if [ $UID -ne 0 ]
then
        echo "This script should be run as root"
        exit
fi

# Create the install directory
if [[ ! -d $INST_DIR ]]
then
        mkdir $INST_DIR || { echo "Create $INST_DIR manually, then rerun"; exit 1; }
elif [[ ! -z "$(ls $INST_DIR)" ]]
then
        echo "$INST_DIR is not empty.  Aborting to prevent clobbering an existing install..."
        exit 2
fi

# Set permissions for the install directory
chown $USR $INST_DIR

if [[ "$OS" == "Darwin" ]]
then
        if [ ! -z "$OSX_URL" ]
        then
                echo -n "OSX Detected.  Downloading Installer from $OSX_URL... "
                if [[ -e "$OSX_INST" ]]
                then
                    echo "already exists!"
                else
                    wget -q $OSX_URL && echo "ok" || echo "failed!"
                fi
                echo "Running $OSX_INST $FLAGS... "
                sudo -u $USR bash $OSX_INST $FLAGS || { echo "Installation Failed!"; exit; }
        else
                echo "Unable to get the OSX Download URL!"
                if [ ! -z "$OSX_INST" ]
                then
                        echo "Using local copy of the installer at $OSX_INST... "
                        sudo -u $USR bash $OSX_INST $FLAGS || { echo "Installation Failed!"; exit; }
                else
                        echo "Exiting..."
                        exit
                fi
        fi
elif [[ "$OS" == "Linux" ]]
then
        if [ ! -z "$LINUX_URL" ]
        then
            echo -n "Linux Detected.  Downloading Installer from $LINUX_URL... "
            if [[ -e "$LINUX_INST" ]]
            then
                echo "already exists!"
            else
                wget -q $LINUX_URL && echo "ok" || echo "failed!"
            fi
	    	echo "Running $LINUX_INST $FLAGS... "
	    	sudo -u $USR bash $LINUX_INST $FLAGS || { echo "Installation Failed!"; exit; }
	    else
            echo "Unable to get the Linux Download URL!"
            if [ ! -z "$LINUX_INST" ]
            then
                    echo "Using local copy of the installer at $LINUX_INST... "
                    sudo -u $USR bash $LINUX_INST $FLAGS || { echo "Installation Failed!"; exit; }
            else
                    echo "Exiting..."
                    exit
            fi
	    fi
fi

echo "Installation complete."
