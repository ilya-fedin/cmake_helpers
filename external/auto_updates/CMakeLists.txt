# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_auto_updates INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_auto_updates ALIAS external_auto_updates)

if (NOT DESKTOP_APP_DISABLE_AUTOUPDATE)
    add_subdirectory(xz)
    target_link_libraries(external_auto_updates
    INTERFACE
        desktop-app::external_xz
    )
endif()
