/*
 * Copyright (C) 2016 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <string>
#include <utils/Errors.h>
#include <utils/RefBase.h>
#include "gui/DisplayEventReceiver.h"
#include <gui/IDisplayEventConnection.h>
#include <gui/ISurfaceComposer.h>
#include <private/gui/ComposerService.h>
#include <gui/SurfaceComposerClient.h>
#include <private/gui/BitTube.h>

// GraphicBuffer(uint32_t inWidth, uint32_t inHeight, PixelFormat inFormat,
//               uint32_t inUsage, std::string requestorName = "<Unknown>");
extern "C" void _ZN7android13GraphicBufferC1EjjijNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE(
    uint32_t inWidth, uint32_t inHeight, int inFormat, uint32_t inUsage,
    std::string requestorName);

extern "C" void _ZN7android13GraphicBufferC1Ejjij(
    uint32_t inWidth, uint32_t inHeight, int inFormat, uint32_t inUsage) {
  std::string requestorName = "<Unknown>";
  _ZN7android13GraphicBufferC1EjjijNSt3__112basic_stringIcNS1_11char_traitsIcEENS1_9allocatorIcEEEE(
      inWidth, inHeight, inFormat, inUsage, requestorName);
}

extern "C" void* _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjijPNS_14SurfaceControlEjj(
    android::String8 const & s, uint32_t w, uint32_t h, android::PixelFormat fmt, uint32_t flags,
    void *parent, uint32_t windowType, uint32_t ownerUid);

// sp<SurfaceControl> android::SurfaceComposerClient::createSurface(android::String8 const&, unsigned int, unsigned int, int, unsigned int)

extern "C" void* _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8Ejjij(android::String8 const& s,
    uint32_t w, uint32_t h, android::PixelFormat fmt, uint32_t flags) {
    return _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjijPNS_14SurfaceControlEjj(s, w, h, fmt, flags, NULL, 0, 0);
}

extern "C" {
    /* status_t SurfaceControl::setLayer */
    android::status_t _ZN7android14SurfaceControl8setLayerEi( uint32_t layer);

    android::status_t _ZN7android14SurfaceControl8setLayerEj( int32_t layer) {
        return _ZN7android14SurfaceControl8setLayerEi( (uint32_t)layer);
    }
}

extern "C" void _ZN7android10CameraFace19getFaceDetectResultEPhS1_PifiiS2_S2_() {}

namespace android {

DisplayEventReceiver::DisplayEventReceiver() {
    status_t err;
    sp<ISurfaceComposer> sf(ComposerService::getComposerService());
    if (sf != NULL) {
        mEventConnection = sf->createDisplayEventConnection(ISurfaceComposer::eVsyncSourceApp);
        if (mEventConnection != NULL) {
            mDataChannel = std::make_unique<gui::BitTube>();
            err = mEventConnection->stealReceiveChannel(mDataChannel.get());
        }
    }
}

}; // namespace android
