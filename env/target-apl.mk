# Cycc/Cympile - Shared Build Scripts for Make
# Copyright (C) 2013-2020  Jay Freeman (saurik)

# Zero Clause BSD license {{{
#
# Permission to use, copy, modify, and/or distribute this software for any purpose with or without fee is hereby granted.
#
# THE SOFTWARE IS PROVIDED "AS IS" AND THE AUTHOR DISCLAIMS ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL THE AUTHOR BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE, DATA OR PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER TORTIOUS ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS SOFTWARE.
# }}}


pre := lib
dll := dylib
lib := a
exe := 

meson := darwin

lflags += -Wl,-ObjC
lflags += -Wl,-dead_strip
lflags += -Wl,-no_dead_strip_inits_and_terms

# libtool
qflags += -DPIC
qflags += -fPIC

signature := /_CodeSignature/CodeResources

toolchain := $(shell xcode-select -p)/Toolchains/XcodeDefault.xctoolchain

isysroot :=  $(shell xcrun --sdk $(sdk) --show-sdk-path)
more += -isysroot $(isysroot)
ifneq ($(sdk),macosx)
more += -idirafter $(shell xcrun --sdk macosx --show-sdk-path)/usr/include
endif

define _
more/$(1) := -arch $(1)
endef
$(each)

ifeq ($(filter crossndk,$(debug)),)
include $(pwd)/kit-default.mk
else

define _
more/$(1) += -target $(host/$(1))18.5.0
endef
$(each)

# XXX: needed for ___isPlatformVersionAtLeast
resource := $(shell clang -print-resource-dir)
lflags += $(resource)/lib/darwin/libclang_rt.$(runtime).a

# XXX: this is obsolete but feels right
#more += -B$(dir $(clang))
more += -fno-strict-return
include $(pwd)/kit-android.mk
cxx += -stdlib=libc++

xflags += -nostdinc++
xflags += -isystem $(toolchain)/usr/include/c++/v1

# the r22 NDK prefers its own copy of ld
wflags += -fuse-ld=/usr/bin/ld

endif

objc := clang $(more)

define _
strip/$(1) := strip
windres/$(1) := false
endef
$(each)

lflags += -lresolv
lflags += -framework Security
