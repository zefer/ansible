#!/bin/bash
set -e
playlistdir=/var/lib/mpd/music/BBCRADIO
mkdir -p $playlistdir

declare -A radios
radios["BBC Radio 1"]="http://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-aac-lc-a/vpid/bbc_radio_one/format/pls.pls"
radios["BBC Radio 2"]="http://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-aac-lc-a/vpid/bbc_radio_two/format/pls.pls"
radios["BBC Radio 3"]="http://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-aac-lc-a/vpid/bbc_radio_three/format/pls.pls"
radios["BBC Radio 4"]="http://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-aac-lc-a/vpid/bbc_radio_fourfm/format/pls.pls"
radios["BBC Radio 4 Extra"]="http://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-aac-lc-a/vpid/bbc_radio_four_extra/format/pls.pls"
radios["BBC 6 Music"]="http://open.live.bbc.co.uk/mediaselector/5/select/mediaset/http-icy-aac-lc-a/vpid/bbc_6music/format/pls.pls"

for k in "${!radios[@]}"
do
	filepath="${playlistdir}/${k}.m3u"
	rm -f "$filepath"
	echo "#EXTM3U" >> "$filepath"
	pls=${radios[$k]}
	echo "#EXTINF:-1, BBC - $k" >> "$filepath"
	curl -s $pls | grep File1 | sed 's/File1=\(.*\)/\1/' >> "$filepath"
done
