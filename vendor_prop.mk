#
# Copyright (C) 2018 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Audio
PRODUCT_PROPERTY_OVERRIDES += \
    af.fast_track_multiplier=1 \
    av.offload.enable=false \
    audio.offload.disable=true \
    audio.offload.video=false \
    audio.deep_buffer.media=false \
    htc.audio.debug.printlow=1 \
    htc.audio.hdaudio.videoplayback=1 \
    persist.vendor.audio.fluence.voicecall=true \
    persist.vendor.audio.fluence.voicerec=false \
    persist.vendor.audio.fluence.speaker=true \
    persist.vendor.bt.enable.splita2dp=false \
    persist.vendor.audio.hw.binder.size_kbyte=1024 \
    ro.af.client_heap_size_kbyte=7168 \
    ro.config.media_vol_steps=25 \
    ro.config.vc_call_vol_steps=7 \
    ro.vendor.audio.sdk.ssr=false \
    ro.vendor.audio.sdk.fluencetype=fluence \
    vendor.audio.dmid=-1286820014 \
    vendor.audio.dolby.ds2.enabled=1 \
    vendor.audio.dolby.ds2.hardbypass=1 \
    vendor.audio.flac.sw.decoder.24bit=true \
    vendor.audio_hal.period_size=192 \
    vendor.audio.hw.aac.encoder=true \
    vendor.audio.offload.buffer.size.kb=1024 \
    vendor.audio.offload.gapless.enabled=false \
    vendor.audio.offload.multiaac.enable=false \
    vendor.audio.offload.multiple.enabled=false \
    vendor.audio.offload.pcm.16bit.enable=false \
    vendor.audio.offload.pcm.24bit.enable=false \
    vendor.audio.offload.passthrough=false \
    vendor.audio.offload.track.enable=false \
    vendor.audio.parser.ip.buffer.size=262144 \
    vendor.audio.safx.pbe.enabled=true \
    vendor.audio.tunnel.encode=false \
    vendor.audio.use.sw.alac.decoder=true \
    vendor.audio.use.sw.ape.decoder=true \
    vendor.voice.path.for.pcm.voip=true

# Bluetooth
PRODUCT_PROPERTY_OVERRIDES += \
    persist.bt.enableAptXHD=true \
    ro.bt.bdaddr_path=/sys/module/htc_bdaddress/parameters/bdaddress

# Camera
PRODUCT_PROPERTY_OVERRIDES += \
    camera.disable_zsl_mode=1 \
    Camera.no_navigation_bar=true \
    persist.camera.antibanding=50 \
    persist.camera.tuning_spec=htc \
    persist.ts.postmakeup=false \
    persist.ts.rtmakeup=false \
    vendor.camera.aux.packagelist=org.codeaurora.snapcam,com.android.camera,org.lineageos.snap

# CNE & DPM
PRODUCT_PROPERTY_OVERRIDES += \
    persist.vendor.cne.feature=1 \
    persist.vendor.dpm.feature=0 \

# Enable STM events
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.coresight.config=stm-events

# Data modules
PRODUCT_PROPERTY_OVERRIDES += \
    ro.use_data_netmgrd=true \
    ro.vendor.use_data_netmgrd=true \
    persist.data.netmgrd.qos.enable=true \
    persist.data.mode=concurrent

# Default pd_enable value
PRODUCT_PROPERTY_OVERRIDES += \
    persist.sys.pd_enable=0

# DRM
PRODUCT_PROPERTY_OVERRIDES += \
    drm.service.enabled=true

# Fast charge
PRODUCT_PROPERTY_OVERRIDES += \
    persist.hvdcp.allow_opti=1 \
    ro.cutoff_voltage_mv=3050

# FRP
PRODUCT_PROPERTY_OVERRIDES += \
    ro.frp.pst=/dev/block/bootdevice/by-name/frp

# Graphics
PRODUCT_PROPERTY_OVERRIDES += \
    debug.egl.hw=1 \
    debug.sf.hw=1 \
    debug.sf.latch_unsignaled=1 \
    debug.gralloc.gfx_ubwc_disable=0 \
    debug.sf.enable_hwc_vds=1 \
    dev.pm.dyn_samplingrate=1 \
    persist.demo.hdmirotationlock=false \
    persist.hwc.enable_vds=1 \
    ro.opengles.version=196610 \
    sdm.debug.disable_rotator_split=1 \
    debug.sf.recomputecrop=0 \
    vendor.display.disable_rotator_downscale=1 \
    ro.sf.lcd_density=640 \
    vendor.display.perf_hint_window=50 \
    vendor.gralloc.enable_fb_ubwc=1 \
    vendor.display.disable_skip_validate=1

# IMS
PRODUCT_PROPERTY_OVERRIDES += \
    persist.dbg.volte_avail_ovr=1 \
    persist.dbg.vt_avail_ovr=1 \
    persist.data.iwlan.enable=true \
    persist.dbg.ims_volte_enable=1 \
    persist.dbg.wfc_avail_ovr=1 \
    service.qti.ims.enabled=1 \
    persist.radio.videopause.mode=1 \
    persist.volte_enabled_by_hw=1

# Media
PRODUCT_PROPERTY_OVERRIDES += \
    media.stagefright.enable-player=true \
    media.stagefright.enable-http=true \
    media.stagefright.enable-aac=true \
    media.stagefright.enable-qcp=true \
    media.stagefright.enable-scan=true \
    mmp.enable.3g2=true \
    media.aac_51_output_enabled=true \
    mm.enable.smoothstreaming=true \
    media.settings.xml=/vendor/etc/media_profiles_V1_0.xml \
    mm.enable.qcom_parser=1048575 \
    persist.mm.enable.prefetch=true \
    vendor.vidc.enc.disable.pq=true \
    vendor.video.disable.ubwc=1 \
    vidc.enc.dcvs.extra-buff-count=2 \
    vidc.debug.perf.mode=2

# Memory optimizations
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.qti.sys.fw.bservice_enable=true

# NFC
PRODUCT_PROPERTY_OVERRIDES += \
    ro.nfc.port=I2C \
    persist.nfc.smartcard.config=SIM1,eSE1

# Perf
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vendor.extension_library=libqti-perfd-client.so \
    ro.vendor.qti.sys.fw.bg_apps_limit=60

# Priv-app permissions whitelist
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=enforce

# Radio
PRODUCT_PROPERTY_OVERRIDES += \
    DEVICE_PROVISIONED=1 \
    persist.data.qmi.adb_logmask=0 \
    rild.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
    rild.vendor.libpath=/system/vendor/lib64/libril-qc-qmi-1.so \
    ro.baseband.arch=msm \
    ro.telephony.call_ring.multiple=false \
    persist.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.apm_sim_not_pwdn=1 \
    persist.vendor.radio.apm_mdm_not_pwdn=1 \
    persist.vendor.radio.cs_srv_type=1 \
    persist.vendor.radio.snapshot_timer=0 \
    persist.vendor.radio.data_ltd_sys_ind=1 \
    persist.vendor.radio.sap_silent_pin=1 \
    persist.vendor.radio.fill_eons=1 \
    persist.vendor.ims.dropset_feature=0 \
    persist.data.profile_update=true \
    persist.radio.NETWORK_SWITCH=1

# RmNet Data
PRODUCT_PROPERTY_OVERRIDES += \
    persist.rmnet.data.enable=true \
    persist.data.wda.enable=true \
    persist.data.df.dl_mode=5 \
    persist.data.df.ul_mode=5 \
    persist.data.df.agg.dl_pkt=10 \
    persist.data.df.agg.dl_size=4096 \
    persist.data.df.mux_count=8 \
    persist.data.df.iwlan_mux=9 \
    persist.data.df.dev_name=rmnet_usb0

# Sensors
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qti.sensors.dev_ori=false \
    ro.qti.sensors.pmd=false \
    ro.qti.sensors.sta_detect=false \
    ro.qti.sensors.mot_detect=false

# SSC/SLPI sensor daemon
PRODUCT_PROPERTY_OVERRIDES += \
    ro.qualcomm.ssc=true

# System prop for enabling/disabling Android XLAT
PRODUCT_PROPERTY_OVERRIDES += \
    persist.net.doxlat=false

# TimeService
PRODUCT_PROPERTY_OVERRIDES += \
    persist.timed.enable=true

# WFD
PRODUCT_PROPERTY_OVERRIDES += \
    persist.debug.wfd.enable=1

# Wifi
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.direct.interface=p2p-dev-wlan0

# Misc
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.min.fling_velocity=160 \
    ro.max.fling_velocity=20000

# OTA
PRODUCT_PROPERTY_OVERRIDES += \
    lineage.updater.uri=https://raw.githubusercontent.com/Fagyi/OTA/lineage-16.0/pme.json
