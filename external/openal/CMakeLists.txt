# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_openal INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_openal ALIAS external_openal)

find_package(OpenAL REQUIRED CONFIG)
target_link_libraries(external_openal INTERFACE OpenAL::OpenAL)
