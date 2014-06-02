#!/bin/bash
kernel=`uname -r`
echo "Checking system"
echo
uname -a
echo "Kernel: $kernel"
cat /etc/*-release
echo
echo

for i in snd_soc_bcm2708 snd_soc_bcm2708_i2s bcm2708_dmaengine snd_soc_pcm5102a snd_soc_hifiberry_dac; do
 f=`grep $i /etc/modules`
 if [ "$f" == "" ]; then
  echo $i missing in /etc/modules
 fi
 
 f=`lsmod | grep $i`
 if [ "$f" == "" ]; then
  echo $i module not loaded
 fi

 f=`grep $i /etc/modprobe.d/*blacklist*`
 if [ "$f" != "" ]; then
  echo $i is blacklisted
 fi

done

for i in drivers/dma/bcm2708-dmaengine.ko sound/soc/bcm/snd-soc-bcm2708-i2s.ko sound/soc/bcm/snd-soc-hifiberry-dac.ko sound/soc/codecs/snd-soc-pcm5102a.ko; do
 ls -l /lib/modules/$kernel/kernel/$i 2>/dev/null >/dev/null
 if [ $? != 0 ]; then
  echo module file /lib/modules/$kernel/kernel/$i not found
 fi
done

echo "Sound cards"
aplay -l

if [ ! -f sin1000_48khz.wav ]; then
 wget http://www.hifiberry.com/files/sin1000_48khz.wav
fi
aplay sin1000_48khz.wav
