# Copyright (C) 2017  Joshua Choo

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.

LOCAL_PATH := $(call my-dir)

# HAL module implemenation stored in
# hw/<POWERS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)

LOCAL_MODULE_RELATIVE_PATH := hw
LOCAL_SHARED_LIBRARIES := liblog libcutils libdl
LOCAL_SRC_FILES := power.c metadata-parser.c utils.c list.c hint-data.c power-common.c

# Include target-specific files.
ifeq ($(call is-board-platform-in-list, msm8996), true)
LOCAL_SRC_FILES += power-8996.c
endif

ifeq ($(TARGET_USES_INTERACTION_BOOST),true)
    LOCAL_CFLAGS += -DINTERACTION_BOOST
endif

#ifneq ($(TARGET_USES_AOSP),true)
#    LOCAL_CFLAGS += -DEXTRA_POWERHAL_HINTS
#endif

# Double tap to wake
ifneq ($(TARGET_TAP_TO_WAKE_NODE),)
LOCAL_CFLAGS += -DTAP_TO_WAKE_NODE=\"$(TARGET_TAP_TO_WAKE_NODE)\"
endif

# High Brightness Mode
ifneq ($(TARGET_HIGH_BRIGHTNESS_MODE_NODE),)
ifneq ($(POWER_FEATURE_HIGH_BRIGHTNESS_MODE),)
LOCAL_CFLAGS += -DHIGH_BRIGHTNESS_MODE_NODE=\"$(TARGET_HIGH_BRIGHTNESS_MODE_NODE)\"
LOCAL_CFLAGS += -DPOWER_FEATURE_HIGH_BRIGHTNESS_MODE=$(POWER_FEATURE_HIGH_BRIGHTNESS_MODE)
endif
endif

LOCAL_MODULE := power.$(TARGET_BOARD_PLATFORM)
LOCAL_MODULE_TAGS := optional
include $(BUILD_SHARED_LIBRARY)
