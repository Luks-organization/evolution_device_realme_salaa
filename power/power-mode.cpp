/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#include <aidl/android/hardware/power/BnPower.h>
#include <android-base/file.h>
#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <sys/ioctl.h>

using ::aidl::android::hardware::power::Mode;

constexpr const char* TAP_TO_WAKE_NODE = "/proc/touchpanel/double_tap_enable";

#ifdef LIBPERFMGR_EXT
namespace aidl::google::hardware::power::impl::pixel {
#else
namespace aidl::android::hardware::power::impl {
#endif

bool isDeviceSpecificModeSupported(Mode type, bool* _aidl_return) {
    switch (type) {
        case Mode::DOUBLE_TAP_TO_WAKE:
            *_aidl_return = true;
            return true;
        default:
            return false;
    }
}

bool setDeviceSpecificMode(Mode type, bool enabled) {
    switch (type) {
        case Mode::DOUBLE_TAP_TO_WAKE: {
            const std::string value = enabled ? "1" : "0";
            if (!::android::base::WriteStringToFile(value, TAP_TO_WAKE_NODE)) {
                LOG(ERROR) << "Failed to write to " << TAP_TO_WAKE_NODE;
                return false;
            }
            return true;
        }
        default:
            return false;
    }
}

}  // namespace
