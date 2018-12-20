#!/bin/env bash

INTERFACE=$1
STATE=$2
USER=h4rdl1nk

case $STATE in
	up)
		DONE=0

		while [ ${DONE} -eq 0 ]
		do 
        		if `ps -fe | grep -v grep | egrep "xfce4/panel/wrapper.*libsystray" >/dev/null` && [ -f /home/$USER/.Xauthority ] 
        		then
				su $USER -c "DISPLAY=:0.0 octopi-notifier &"
				su $USER -c "DISPLAY=:0.0 megasync &"
                		DONE=1
        		fi
		done
		;;
	down)
		killall octopi-notifier megasync
		;;
esac

