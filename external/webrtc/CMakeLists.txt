# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_webrtc INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_webrtc ALIAS external_webrtc)

find_package(tg_owt REQUIRED)
target_link_libraries(external_webrtc INTERFACE tg_owt::tg_owt)
