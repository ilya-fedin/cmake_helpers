# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_lz4 INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_lz4 ALIAS external_lz4)

find_package(lz4 QUIET)
if (lz4_FOUND)
    target_link_libraries(external_lz4 INTERFACE LZ4::lz4)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_LZ4 REQUIRED IMPORTED_TARGET liblz4)
target_link_libraries(external_lz4 INTERFACE PkgConfig::DESKTOP_APP_LZ4)
