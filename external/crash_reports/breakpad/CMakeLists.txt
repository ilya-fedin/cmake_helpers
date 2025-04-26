# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_breakpad INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_breakpad ALIAS external_breakpad)

find_package(unofficial-breakpad QUIET)
if (unofficial-breakpad_FOUND)
    target_link_libraries(external_breakpad INTERFACE unofficial::breakpad::libbreakpad_client)
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_BREAKPAD REQUIRED IMPORTED_TARGET breakpad-client)
target_link_libraries(external_breakpad INTERFACE PkgConfig::DESKTOP_APP_BREAKPAD)
