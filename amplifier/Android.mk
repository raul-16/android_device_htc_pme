LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := \
    liblog \
    libutils \
    libcutils \
    audio.primary.$(TARGET_BOARD_PLATFORM)\
    libtinyalsa

LOCAL_C_INCLUDES := \
    external/expat/lib \
    external/tinyalsa/include \
    external/tinycompress/include \
    hardware/libhardware/include \
    $(call include-path-for, audio-route) \
    $(call include-path-for, audio-effects) \
    $(call project-path-for,qcom-audio)/hal \
    $(call project-path-for,qcom-audio)/hal/audio_extn \
    $(call project-path-for,qcom-audio)/hal/msm8974 \
    $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_SRC_FILES := \
    audio_amplifier.c \
    tfa.c

LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr

LOCAL_MODULE := audio_amplifier.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional

include $(BUILD_SHARED_LIBRARY)
