#!/bin/bash

# Numenta source and services: Shutdown, Update, Rebuild, Startup.
#	For the full Grok stack running on localhost / OS X laptop.
#	Meant to be run from ~/nta/
#
# Args:
#	--fullBuild = 	Do a full engine/trunk build
#
# Prereq:
#	* Numenta environment variables ($NTA, etc.)
#	* Full stack installed (Engine, API, Web App) on localhost, in ~/nta/
#	* Running and happy MySQL on localhost
#
# Desc:
# 	1. Shuts things down:
#		* Stops unified web service (grok-app, grok-common, grok-docs)
#		* Stops API server
#		* Stops Engine
# 	2. Updates 'master' in all GIT repos in ~/nta/
#		* Will work even if you're currently in branch
#		* Also tries to update submodules
#	3. Rebuild engine:
#		* Will do a full build if "--fullBuild" argument is passed
#		* Will do an incremental build every time
#	4. Start things back up:
#		* Start Engine (with --hardReset)
#		* Start API server
#		* Start unified web services (with a fresh grok-docs rebuild)
#		* Open WebApp and API in new browser windows to show off

# comand finder
WHICH="/usr/bin/which"

# commands
CD=cd
CUT=$($WHICH cut)
DATE=$($WHICH date)
GIT=$($WHICH git)
GREP=$($WHICH grep)
JPS=$($WHICH jps)
KILL=$($WHICH kill)
LN=$($WHICH ln)
LS=$($WHICH ls)
MAKE=$($WHICH make)
MKDIR=$($WHICH mkdir)
NOHUP=$($WHICH nohup)
NS=$($WHICH nupic-services.py)
OPEN=$($WHICH open)
PRINTF=$($WHICH printf)
PS=$($WHICH ps)
PYTH=$($WHICH python)
READ=$($WHICH read)
RM=$($WHICH rm)
TPUT=$($WHICH tput)

# shell colors
BLUE=$($TPUT setaf 4)
NORM=$($TPUT sgr0)

# directories
API_DIR="grok-api-server"
APP_DIR="grok-app"
NTA_ROOT="$HOME/nta"

# passed-in args
FULL_BUILD=
if [ "$1" == "--fullBuild" ]; then
	FULL_BUILD="true"
	echo "<< Going to do a full build!!! >>"
fi

# show and execute command
function print_exec {
	echo ""
	echo "$BLUE>>> $1$NORM"
	$1
}

echo ""
echo "$BLUE##### 0. STARTING #############################################$NORM"
echo $($DATE)
echo ""


echo ""
echo "$BLUE##### 1. SHUT DOWNS ###########################################$NORM"
echo ""


### Stop web stack

print_exec "$NTA_ROOT/$APP_DIR/bin/stop-unified-web.sh"


### Stop API server

API_PS=$($PS -e -o pid,command | $GREP "grokapi.webapi" | $GREP -v grep | $CUT -d " " -f1)
if [ "$API_PS" ]; then
	print_exec "$KILL $API_PS"
fi


### Stop Engine

print_exec "$JPS"
print_exec "$NS stop"
print_exec "$KILL -9 `$JPS | $CUT -d ' ' -f1`"
print_exec "$JPS"


echo ""
echo "$BLUE##### 2. UPDATE GIT MASTERS IN ~/nta/ #########################$NORM"
echo ""


### Update all git repos

print_exec "$CD $NTA_ROOT/"

REPOS=$($LS -1 $NTA_ROOT)
for REPO in $REPOS
do
	if [ -d "$NTA_ROOT/$REPO/.git/" ]; then
		print_exec "$CD $REPO/"

		BRANCH=$($GIT rev-parse --abbrev-ref HEAD)
		if [ "$BRANCH" != "master" ]; then
			print_exec "$GIT stash"
			print_exec "$GIT checkout master"
		fi

		print_exec "$GIT pull"
		print_exec "$GIT submodule update"

		if [ "$BRANCH" != "master" ]; then
			print_exec "$GIT checkout $BRANCH"
			print_exec "$GIT stash pop"
		fi

		print_exec "$CD $NTA_ROOT/"
	fi
done


echo ""
echo "$BLUE##### 3. REBUILD ENGINE #######################################$NORM"
echo ""


### (Optional) Engine full build

if [ "$FULL_BUILD" ]; then
	print_exec "$CD $NUPIC/build_system/"

	print_exec "$PYTH setup.py --autogen"
	print_exec "$MKDIR $NTA_ROOT/build/"
	print_exec "$CD $NTA_ROOT/build/"
	print_exec "$RM -Rf $NTA_ROOT/build/*"
	print_exec "$NUPIC/configure"
	print_exec "$MAKE"
	print_exec "$MAKE install"
	print_exec "$CD $NTA_ROOT/"
	print_exec "$LN -s eng current"

	print_exec "$CD $NTA_ROOT/"
fi


### Engine incremental build

print_exec "$CD $TRUNK/"
print_exec "./build_system/build_engine.sh $TRUNK/ $NTA_ROOT/eng/"
print_exec "$CD $NTA_ROOT/"


echo ""
echo "$BLUE##### 4. START UPS ############################################$NORM"
echo ""


### Start Engine

print_exec "$JPS"
print_exec "$NS --hardReset"
print_exec "$NS start"
print_exec "$JPS"


### Start API server

print_exec "$CD $NTA_ROOT/$API_DIR/"
echo ""
echo "$BLUE>>> Starting API Server (python -m grokapi.webapi 8081)$NORM"
$PRINTF "\n" | $NOHUP $PYTH -m grokapi.webapi 8081 > /tmp/grok-api-nohup.log &
print_exec "$CD $NTA_ROOT/"


### Build and start web stack

print_exec "$NTA_ROOT/$APP_DIR/bin/bounce-unified-web.sh -b"


### Show the results

print_exec "$OPEN http://localhost:8081/"
print_exec "$OPEN https://localhost/"


echo ""
echo $($DATE)
echo "$BLUE##### 5. FINISHED #############################################$NORM"
echo ""
