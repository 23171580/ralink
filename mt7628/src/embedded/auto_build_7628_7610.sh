if [ -d rlt_wifi ]; then
	#Auto-build server's workspace naming is rlt_wifi
	mv rlt_wifi mt_wifi
else
	echo "Wifi Driver no found."
    exit 1
fi

#if [ -d mt_wifi ]; then
	cd mt_wifi/embedded
	chmod 744 *.sh
	# replace the Kconfig & Makefile for 7628 to prevent the 7612's setting is overwrite
	cp Kconfig.ap.mt Kconfig
	cp mt_wifi_ap/Kconfig.ap.mt mt_wifi_ap/Kconfig
	cp mt_wifi_ap/Makefile.ap.mt mt_wifi_ap/Makefile
	./Release.sh auto_build
	cd ../../
    rm -rf mt_wifi
#else
#	exit 1
#fi

if [ -d release/mt_wifi_auto_build ]; then
	mv release/mt_wifi_auto_build mt_wifi
fi

if [ -d release/mt_wifi_ap_auto_build ]; then
    mv release/mt_wifi_ap_auto_build mt_wifi_ap
fi

if [ -d release/mt_wifi_sta_auto_build ]; then
    mv release/mt_wifi_sta_auto_build mt_wifi_sta
fi

if [ -d release ]; then
	rm -rf release
fi
