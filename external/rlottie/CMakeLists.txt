# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_rlottie INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_rlottie ALIAS external_rlottie)

find_package(rlottie QUIET)
if (rlottie_FOUND)
    target_link_libraries(external_rlottie INTERFACE rlottie::rlottie)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_RLOTTIE REQUIRED IMPORTED_TARGET rlottie)
target_link_libraries(external_rlottie INTERFACE PkgConfig::DESKTOP_APP_RLOTTIE)
