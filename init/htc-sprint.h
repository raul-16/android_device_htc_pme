/* props/sprint-1.80: Sprint WWE: SPCS_001 */
static bool is_variant_sprint(std::string bootcid) {
    if (bootcid == "SPCS_001") return true;
    return false;
}

static const char *htc_sprint_properties =
    "ro.cdma.home.operator.alpha=Sprint\n"
    "gsm.sim.operator.alpha=Chameleon\n"
    "gsm.operator.alpha=Chameleon\n"
    "ro.cdma.home.operator.numeric=310120\n"
    "gsm.sim.operator.numeric=000000\n"
    "gsm.operator.numeric=000000\n"
    "gsm.sim.operator.iso-country=us\n"
    "gsm.operator.iso-country=us\n"
    "ro.telephony.ipv6_capability=1\n"
    "ro.phone.min_match=8\n"
    "ro.ril.oem.ecclist=911\n"
    "ro.ril.enable.a53=1\n"
    "ro.ril.enable.gea3=1\n"
    "ro.ril.enable.sdr=0\n"
    "ro.ril.enable.pre_r8fd=1\n"
    "ro.ril.enable.r8fd=1\n"
    "ro.ril.set.mtusize=1422\n"
    "ro.ril.hsxpa=4\n"
    "ro.ril.hsdpa.category=14\n"
    "ro.ril.hsupa.category=6\n"
    "ro.ril.disable.cpc=1\n"
    "ro.ril.def.agps.mode=6\n"
    "persist.rild.nitz_plmn=\n"
    "persist.rild.nitz_long_ons_0=\n"
    "persist.rild.nitz_long_ons_1=\n"
    "persist.rild.nitz_long_ons_2=\n"
    "persist.rild.nitz_long_ons_3=\n"
    "persist.rild.nitz_short_ons_0=\n"
    "persist.rild.nitz_short_ons_1=\n"
    "persist.rild.nitz_short_ons_2=\n"
    "persist.rild.nitz_short_ons_3=\n"
    "ril.subscription.types=NV,RUIM\n"
    "telephony.lteOnCdmaDevice=1\n"
    "telephony.lteOnCdmaDevice=0\n"
    "persist.radio.fill_eons=1\n"
    "persist.igps.sensor=on\n"
    "persist.radio.custom_ecc=1\n"
    "persist.radio.apm_sim_not_pwdn=0\n"
    "persist.radio.apm_mdm_not_pwdn=1\n"
    "persist.radio.cs_srv_type=1\n"
    "ro.telephony.default_network=10\n"
    "rild.libpath.ganlite=/system/lib64/librilswitch.so\n"
    "rilswitch.vendorlibpath=/system/lib64/libhtc_rilhook.so\n"
    "rilswitch.cfilibpath=/system/lib64/libcfiril.so\n"
    "persist.radio.snapshot_timer=0\n"
    "telephony.lteOnCdmaDevice=1\n"
    "ro.gps.agps_provider=1\n"
    "vendor.rild.libpath=/system/vendor/lib64/libril-qc-qmi-1-cdma.so\n"
    "rild.vendor.libpath=/system/vendor/lib64/libril-qc-qmi-1-cdma.so\n"
;
