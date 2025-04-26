# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_xxhash INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_xxhash ALIAS external_xxhash)

find_package(xxHash QUIET)
if (xxHash_FOUND)
    target_link_libraries(external_xxhash INTERFACE xxHash::xxhash)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_XXHASH REQUIRED IMPORTED_TARGET libxxhash)
target_link_libraries(external_xxhash INTERFACE PkgConfig::DESKTOP_APP_XXHASH)
