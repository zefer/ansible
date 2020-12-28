#!/bin/bash
set -e
playlistdir=/var/lib/mpd/music/radio
mkdir -p $playlistdir

declare -A radios
radios["BBC Radio 1"]="http://www.radiofeeds.co.uk/bbcradio1.pls"
radios["BBC Radio 2"]="http://www.radiofeeds.co.uk/bbcradio2.pls"
radios["BBC Radio 3"]="http://www.radiofeeds.co.uk/bbcradio3.pls"
radios["BBC Radio 4"]="http://www.radiofeeds.co.uk/bbcradio4fm.pls"
radios["BBC Radio 4 Extra"]="http://www.radiofeeds.co.uk/bbcradio4extra.pls"
radios["BBC 6 Music"]="http://www.radiofeeds.co.uk/bbc6music.pls"

for k in "${!radios[@]}"
do
	filepath="${playlistdir}/${k}.m3u"
	rm -f "$filepath"
	echo "#EXTM3U" >> "$filepath"
	pls=${radios[$k]}
	echo "#EXTINF:-1, BBC - $k" >> "$filepath"
	curl -s $pls | grep File1 | sed 's/File1=\(.*\)/\1/' >> "$filepath"
done
