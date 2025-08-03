#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: The Android Open Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.file import File

from extract_utils.fixups_blob import (
    BlobFixupCtx,
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_remove,
    lib_fixups,
    lib_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)
from extract_utils.tools import (
    llvm_objdump_path,
)
from extract_utils.utils import (
    run_cmd,
)

namespace_imports = [
	'device/realme/salaa',
	'hardware/mediatek',
	'hardware/mediatek/libmtkperf_client',
	'hardware/oplus',
]

def lib_fixup_odm_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'odm' else None

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    **lib_fixups,
    (
        'android.hardware.graphics.allocator@2.0',
        'android.hardware.graphics.allocator@3.0',
        'android.hardware.graphics.allocator@4.0',
        'android.hardware.keymaster-V3-ndk_platform',
        'vendor.oplus.hardware.performance@1.0',
        'vendor.oplus.hardware.biometrics.fingerprint@2.1',
    ): lib_fixup_odm_suffix,
    (
        'vendor.mediatek.hardware.lbs@1.0',
        'vendor.mediatek.hardware.videotelephony@1.0',
        'vendor.oplus.hardware.commondcs@1.0',
        'libremosaiclib',
        'libremosaic_wrapper',
        'libhwm-oplus',
    ): lib_fixup_vendor_suffix,
}

module = ExtractUtilsModule(
    'salaa',
    'realme',
    lib_fixups=lib_fixups,
    namespace_imports=namespace_imports,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device(module)
    utils.run()
