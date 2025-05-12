#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2025 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.fixups_lib import (
    lib_fixup_vendorcompat,
    lib_fixups_user_type,
    libs_proto_3_9_1,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'vendor/samsung/universal8535-common',
    'device/samsung/universal8535-common'
]

def lib_fixup_vendor_suffix(lib: str, partition: str, *args, **kwargs):
    return f'{lib}_{partition}' if partition == 'vendor' else None

lib_fixups: lib_fixups_user_type = {
    libs_proto_3_9_1: lib_fixup_vendorcompat,
    (
        'libsecril-client',
    ) : lib_fixup_vendor_suffix,
} # fmt: skip

blob_fixups: blob_fixups_user_type = {
   (
       'vendor/lib/libexynosgraphicbuffer.so',
       'vendor/lib64/libexynosgraphicbuffer.so',
   ): blob_fixup()
        .replace_needed('libui.so', 'libui_shim.so'),
   (
       'vendor/lib64/libaboxpcmdump.so',
       'vendor/lib/libaboxpcmdump.so',
       'vendor/lib64/libaudioparamupdate.so',
       'vendor/lib/libaudioparamupdate.so',
   ): blob_fixup()
        .replace_needed('libaudioroute.so', 'libaudioroute_vendor.so'),
    'vendor/lib64/libsensorlistener.so': blob_fixup()
        .add_needed('libshim_sensorndkbridge.so'),
    'vendor/lib64/hw/camera.s5e8535.so': blob_fixup()
        .add_needed('libui_shim.so'),
   (
       'vendor/lib/libaudioproxy2.so',
       'vendor/lib64/libaudioproxy2.so',
   ): blob_fixup()
        .replace_needed('libaudioroute.so', 'libaudioroute_vendor.so')
        .replace_needed('libtinyalsa.so', 'libtinyalsa_vendor.so'),
   (
       'vendor/lib64/hw/audio.primary.s5e8535.so',
       'vendor/lib/hw/audio.primary.s5e8535.so',
   ): blob_fixup()
        .replace_needed('libaudioroute.so', 'libaudioroute_vendor.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'a14x',
    'samsung',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
    lib_fixups=lib_fixups,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'universal8535-common', module.vendor
    )
    utils.run()
