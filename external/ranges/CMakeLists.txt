# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_ranges INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_ranges ALIAS external_ranges)

find_package(range-v3 REQUIRED)
target_link_libraries(external_ranges INTERFACE range-v3::range-v3)
