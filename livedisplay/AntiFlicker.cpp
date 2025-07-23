/*
 * SPDX-FileCopyrightText: 2014-2019 The Android Open Source Project
 * SPDX-FileCopyrightText: 2025 The LineageOS Project
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.lineage.livedisplay@2.1-service-salaa"

#include <android-base/file.h>
#include <android-base/strings.h>

#include "AntiFlicker.h"

using ::android::base::ReadFileToString;
using ::android::base::Trim;
using ::android::base::WriteStringToFile;

namespace {

constexpr const char* kDcDimmingPath = "/sys/kernel/oplus_display/dimlayer_bl_en";

}  // anonymous namespace

namespace vendor {
namespace lineage {
namespace livedisplay {
namespace V2_1 {
namespace implementation {

Return<bool> AntiFlicker::isEnabled() {
    std::string tmp;
    int32_t contents = 0;

    if (ReadFileToString(kDcDimmingPath, &tmp)) {
        contents = std::stoi(Trim(tmp));
    }

    return contents > 0;
}

Return<bool> AntiFlicker::setEnabled(bool enabled) {
    return WriteStringToFile(std::to_string(enabled), kDcDimmingPath, true);
}

}  // namespace implementation
}  // namespace V2_1
}  // namespace livedisplay
}  // namespace lineage
}  // namespace vendor
