# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_minizip INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_minizip ALIAS external_minizip)

find_package(unofficial-minizip QUIET)
if (unofficial-minizip_FOUND)
    target_link_libraries(external_minizip INTERFACE unofficial::minizip::minizip)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_MINIZIP REQUIRED IMPORTED_TARGET minizip<2.0.0)
target_link_libraries(external_minizip INTERFACE PkgConfig::DESKTOP_APP_MINIZIP)
