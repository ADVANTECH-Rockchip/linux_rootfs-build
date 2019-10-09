#!/bin/bash
set-card-profile 0 alsa_card.platform-rt5660-sound

amixer cset name="DAC1 MIXL DAC1 Switch" 1
amixer cset name="DAC1 MIXR DAC1 Switch" 1
amixer cset name="Stereo DAC MIXL DAC L1 Switch" 1
amixer cset name="Stereo DAC MIXR DAC R1 Switch" 1
amixer cset name="OUT MIXL DACL Switch" 1
amixer cset name="OUT MIXR DACR Switch" 1
amixer cset name="LOUTVOL L Switch" 1
amixer cset name="LOUTVOL R Switch" 1
amixer cset name="LOUT MIX OUTMIX Switch" 1
amixer cset name="OUT Playback Switch" 1 1
amixer cset name="Headphones Switch" 1
#amixer cset name="OUT Playback Volume" 39,39

/etc/boot_times

sleep 8
#AMP_SHUTDN
echo 102 > /sys/class/gpio/export
echo out > /sys/class/gpio/gpio102/direction
echo 1 > /sys/class/gpio/gpio102/value
#750mV(rms)
echo 02 0808 > /sys/kernel/debug/asoc/rockchip_rt5660/codec:rt5660.1-001c/codec_reg
echo 66 0c00 > /sys/kernel/debug/asoc/rockchip_rt5660/codec:rt5660.1-001c/codec_reg
echo 4e 0480 > /sys/kernel/debug/asoc/rockchip_rt5660/codec:rt5660.1-001c/codec_reg
echo 51 0480 > /sys/kernel/debug/asoc/rockchip_rt5660/codec:rt5660.1-001c/codec_reg
#Performance
echo performance | tee $(find /sys/ -name *governor)
#Disables hung_task_timeout_secs message
echo 0 > /proc/sys/kernel/hung_task_timeout_secs
