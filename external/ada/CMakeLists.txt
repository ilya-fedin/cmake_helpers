# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_ada INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_ada ALIAS external_ada)

find_package(ada REQUIRED)
target_link_libraries(external_ada INTERFACE ada::ada)
