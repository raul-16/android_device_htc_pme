/*
 * Copyright (C) 2019 The LineageOS Project
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

#include <gui/BufferQueue.h>
#include <gui/SurfaceComposerClient.h>
#include <gui/ISurfaceComposer.h>
#include <utils/Errors.h>
#include <utils/String8.h>
#include <utils/StrongPointer.h>

#include <private/gui/ComposerService.h>

#include <string>

using android::sp;
using android::status_t;
using android::IBinder;
using android::IGraphicBufferConsumer;
using android::IGraphicBufferProducer;
using android::PixelFormat;
using android::SurfaceControl;
using android::SurfaceComposerClient;

android::SurfaceComposerClient::Transaction *t = nullptr;
void* sc = nullptr;

extern "C" void _ZN7android21SurfaceComposerClient13createSurfaceERKNS_7String8EjjijPNS_14SurfaceControlEjj() { }
extern "C" void _ZZN7android14surfaceflinger20createSurfaceFlingerEvEN7Factory16createHWComposerERKNSt3__112basic_stringIcNS2_11char_traitsIcEENS2_9allocatorIcEEEE() { }
extern "C" void _ZN7android10frameworks13sensorservice4V1_08toStringENS2_6ResultE() { }
extern "C" void _ZN7android14SurfaceControl8setLayerEi() { }
extern "C" void _ZN7android14SurfaceControl4hideEv() { }

extern "C" void _ZN7android21SurfaceComposerClient21openGlobalTransactionEv() {
  t = new(android::SurfaceComposerClient::Transaction);
}

extern "C" void _ZN7android21SurfaceComposerClient22closeGlobalTransactionEb(){
  t->apply();
  delete t;
  t = nullptr;
}

extern "C" status_t _ZN7android14SurfaceControl11setPositionEff(float x, float y){
  t->setPosition((SurfaceControl*)sc, x, y);
  return android::NO_ERROR;
}

extern "C" status_t _ZN7android14SurfaceControl7setSizeEjj(uint32_t w, uint32_t h){
  t->setSize((SurfaceControl*)sc, w, h);
  return android::NO_ERROR;
}
