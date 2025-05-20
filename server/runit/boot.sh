#!/usr/bin/env sh

shutdown() {
  echo "shutting down container"

  # first shutdown any service started by runit
  for _srv in $(ls -1 /etc/service); do
    sv force-stop $_srv
  done

  # shutdown runsvdir command
  kill -HUP $RUNSVDIR
  wait $RUNSVDIR

  # give processes time to stop
  sleep 0.5

  # kill any other processes still running in the container
  for _pid  in $(ps -eo pid | grep -v PID  | tr -d ' ' | grep -v '^1$' | head -n -6); do
    timeout -f 5 /bin/sh -c "kill $_pid && wait $_pid || kill -9 $_pid"
  done
  exit 0
}

# store enviroment variables
export > /etc/envvars

PATH=/usr/local/bin:/usr/local/sbin:/bin:/sbin:/usr/bin:/usr/sbin

if [ "$JOB_ONLY" = "1" ] || [ "$JOB_ONLY" = "Yes" ] || [ "$CRON_ONLY" = "1" ] || [ "$CRON_ONLY" = "Yes" ] 
then
  # Stop service fpm
  touch /etc/service/fpm/down
fi

if [ "$CRON_ONLY" = "1" ] || [ "$CRON_ONLY" = "Yes" ] 
then
  # allow supercronic run
  rm -rf /etc/service/supercronic/down
fi

exec env - PATH=$PATH runsvdir -P /etc/service &

RUNSVDIR=$!
echo "Started runsvdir, PID is $RUNSVDIR"
echo "wait for processes to start...."

sleep 5
for _srv in $(ls -1 /etc/service); do
    sv status $_srv
done

# catch shutdown signals
trap shutdown SIGTERM SIGHUP SIGQUIT SIGINT
wait $RUNSVDIR

shutdown