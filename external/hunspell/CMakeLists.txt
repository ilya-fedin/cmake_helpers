# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_hunspell INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_hunspell ALIAS external_hunspell)

find_package(hunspell QUIET)
if (hunspell_FOUND)
    target_link_libraries(external_hunspell INTERFACE hunspell::hunspell)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_HUNSPELL REQUIRED IMPORTED_TARGET hunspell)
target_link_libraries(external_hunspell INTERFACE PkgConfig::DESKTOP_APP_HUNSPELL)
