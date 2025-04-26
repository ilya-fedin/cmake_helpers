# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_rnnoise INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_rnnoise ALIAS external_rnnoise)

find_package(rnnoise QUIET)
if (rnnoise_FOUND)
    target_link_libraries(external_rnnoise INTERFACE rnnoise::rnnoise)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_RNNOISE REQUIRED IMPORTED_TARGET rnnoise)
target_link_libraries(external_rnnoise INTERFACE PkgConfig::DESKTOP_APP_RNNOISE)
