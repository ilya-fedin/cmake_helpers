# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_tde2e INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_tde2e ALIAS external_tde2e)

find_package(tde2e REQUIRED)
target_link_libraries(external_tde2e INTERFACE tde2e::tde2e)
