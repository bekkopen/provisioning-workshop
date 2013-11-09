#!/bin/sh


# Alle filer ligger under hjemmekatalog for å gjøre det enklere i starten :)
PID_FILE=/home/devops/devops.pid
APP_HOME=/home/devops
APP_JAR=devops.jar
DAEMON=/home/devops/devops.jar
LOGS=/home/devops/logs

# init-functions inneholder status_of_proc
. /lib/lsb/init-functions

case "$1" in
  start)
    if [ ! -f $PID_FILE ]; then
echo "Starting devops..."
      mkdir -p $LOGS
      cd $APP_HOME
      nohup java -jar "$APP_JAR" 1>$LOGS/stdout.log 2>$LOGS/stderr.log &
      PID=$!
      cd -
      echo "Started devops with PID: ${PID}"
      touch ${PID_FILE}
      echo "${PID}" | tee ${PID_FILE}
    else
echo "devops already running"
    fi
    ;;
  stop)
    echo "Stopping devops..."
    if [ -f $PID_FILE ]; then
PID=`cat ${PID_FILE}`
      test -z $PID || kill $PID
      rm $PID_FILE
    else
echo "devops already stopped"
    fi
    ;;
  restart)
    $0 stop
    $0 start
    ;;
  status)
	status_of_proc -p $PID_FILE "$DAEMON" devopsjavaapp
	;;
  *)
    echo "Usage: $0 {start|stop|restart}"
    ;;
esac