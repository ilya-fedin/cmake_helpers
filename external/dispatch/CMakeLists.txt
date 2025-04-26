# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_dispatch INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_dispatch ALIAS external_dispatch)

find_library(DESKTOP_APP_DISPATCH_LIBRARY dispatch REQUIRED)
find_library(DESKTOP_APP_BLOCKSRUNTIME_LIBRARY BlocksRuntime REQUIRED)
find_path(DESKTOP_APP_DISPATCH_INCLUDE_DIR dispatch/dispatch.h REQUIRED)

target_include_directories(external_dispatch SYSTEM INTERFACE ${DESKTOP_APP_DISPATCH_INCLUDE_DIR})
target_link_libraries(external_dispatch INTERFACE ${DESKTOP_APP_DISPATCH_LIBRARY} ${DESKTOP_APP_BLOCKSRUNTIME_LIBRARY})
