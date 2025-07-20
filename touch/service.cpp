/*
 * Copyright (C) 2024 The LineageOS Project
 *
 * SPDX-License-Identifier: Apache-2.0
 */

#define LOG_TAG "vendor.lineage.touch-service.salaa"

#include "HighTouchPollingRate.h"
#include "TouchscreenGesture.h"

#include <android-base/logging.h>
#include <android/binder_manager.h>
#include <android/binder_process.h>

using aidl::vendor::lineage::touch::HighTouchPollingRate;
using aidl::vendor::lineage::touch::TouchscreenGesture;

int main() {
    ABinderProcess_setThreadPoolMaxThreadCount(0);

    std::shared_ptr<HighTouchPollingRate> htpr = ndk::SharedRefBase::make<HighTouchPollingRate>();
    std::shared_ptr<TouchscreenGesture> tg = ndk::SharedRefBase::make<TouchscreenGesture>();

    if (htpr) {
        const std::string instance = std::string(HighTouchPollingRate::descriptor) + "/default";
        binder_status_t status = AServiceManager_addService(htpr->asBinder().get(), instance.c_str());
        CHECK_EQ(status, STATUS_OK) << "Failed to add HighTouchPollingRate service: " << instance;
    } else {
        LOG(ERROR) << "Failed to create HighTouchPollingRate instance.";
        return EXIT_FAILURE;
    }

    if (tg) {
        const std::string tg_instance = std::string(TouchscreenGesture::descriptor) + "/default";
        binder_status_t status = AServiceManager_addService(tg->asBinder().get(), tg_instance.c_str());
        
        if (status != STATUS_OK) {
            LOG(ERROR) << "Failed to add TouchscreenGesture service: " << tg_instance << " with status " << status;
            return EXIT_FAILURE;
        } else {
            LOG(INFO) << "TouchscreenGesture service " << tg_instance << " added successfully.";
        }
    } else {
        LOG(ERROR) << "Failed to create TouchscreenGesture instance.";
        return EXIT_FAILURE;
    }

    ABinderProcess_joinThreadPool();

    LOG(ERROR) << "Should not reach this point in the program.";
    return EXIT_FAILURE;
}
