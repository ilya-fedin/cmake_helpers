# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_crashpad INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_crashpad ALIAS external_crashpad)

find_package(crashpad REQUIRED)
target_link_libraries(external_crashpad INTERFACE crashpad::crashpad)
