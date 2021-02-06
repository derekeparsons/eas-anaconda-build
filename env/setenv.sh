source deactivate 2> /dev/null
export PATH=/usr/local/bin:/usr/texbin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin
export LD_LIBRARY_PATH="/usr/local/lib"
export LDFLAGS="-L/usr/local/lib"
export CPPFLAGS="-I/usr/local/include"
export PYTHONPATH=""

envdir="/usr/local/env/"

for env in "$@"
do
	source $envdir$env
done
