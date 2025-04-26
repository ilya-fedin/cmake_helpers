# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

include(CMakeDependentOption)

set(DESKTOP_APP_SPECIAL_TARGET "" CACHE STRING "Use special platform target, like 'macstore' for Mac App Store.")

function(report_bad_special_target)
    if (NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "")
        message(FATAL_ERROR "Bad special target '${DESKTOP_APP_SPECIAL_TARGET}'")
    endif()
endfunction()

if (DEFINED ENV{VCPKG_ROOT})
    set(CMAKE_TOOLCHAIN_FILE $ENV{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake CACHE FILEPATH "The CMake toolchain file")
endif()

set(VCPKG 0)
if (CMAKE_TOOLCHAIN_FILE MATCHES "/vcpkg.cmake$")
    set(VCPKG 1)
endif()

if (VCPKG)
    if (DEFINED ENV{VSCMD_ARG_HOST_ARCH})
        set(VCPKG_HOST_TRIPLET "$ENV{VSCMD_ARG_HOST_ARCH}-windows" CACHE STRING "Vcpkg host triplet (ex. x86-windows)")
    endif()

    if (DEFINED ENV{VSCMD_ARG_TGT_ARCH})
        set(VCPKG_TARGET_TRIPLET "$ENV{VSCMD_ARG_TGT_ARCH}-windows" CACHE STRING "Vcpkg target triplet (ex. x86-windows)")
    endif()

    set(CMAKE_PROJECT_TOP_LEVEL_INCLUDES ${CMAKE_CURRENT_LIST_DIR}/external/cmake-conan/conan_provider.cmake CACHE FILEPATH "")
    set(CMAKE_BUILD_TYPE "Release" CACHE STRING "Choose the type of build")
    set(PKG_CONFIG_ARGN "--static" CACHE STRING "Arguments to supply to pkg-config")

    if (APPLE)
        set(CMAKE_OSX_DEPLOYMENT_TARGET 10.13 CACHE STRING "Minimum macOS deployment version")
    endif()
endif()

if (WIN32)
    if (NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "uwp"
        AND NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "uwp64"
        AND NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "win"
        AND NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "win64"
        AND NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "winarm"
        AND NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "uwparm")
        report_bad_special_target()
    endif()
elseif (APPLE)
    if (NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "macstore"
        AND NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "mac")
        report_bad_special_target()
    endif()
else()
    set(LINUX 1)
    if (NOT DESKTOP_APP_SPECIAL_TARGET STREQUAL "linux")
        report_bad_special_target()
    endif()
endif()
