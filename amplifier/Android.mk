LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SHARED_LIBRARIES := \
       liblog \
       libutils \
       libcutils \
       libtinyalsa \
       libtinycompress

LOCAL_HEADER_LIBRARIES += libhardware_headers

LOCAL_C_INCLUDES := \
       external/tinyalsa/include \
       external/tinycompress/include \
       hardware/libhardware/include \
       system/media/audio_route/include \
       $(call project-path-for,qcom-audio)/hal \
       $(call project-path-for,qcom-audio)/hal/audio_extn

LOCAL_SRC_FILES := \
       audio_amplifier.c \
       tfa.c

LOCAL_ADDITIONAL_DEPENDENCIES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr
LOCAL_C_INCLUDES += $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/usr/include

LOCAL_MODULE := audio_amplifier.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_MODULE_TAGS := optional
LOCAL_VENDOR_MODULE := true

include $(BUILD_SHARED_LIBRARY)
