# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_ffmpeg INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_ffmpeg ALIAS external_ffmpeg)

find_package(FFMPEG QUIET)
if (FFMPEG_FOUND)
    target_include_directories(external_ffmpeg SYSTEM INTERFACE ${FFMPEG_INCLUDE_DIRS})
    target_link_libraries(external_ffmpeg INTERFACE ${FFMPEG_LIBRARIES})
    return()
endif()

find_package(PkgConfig REQUIRED)
pkg_check_modules(DESKTOP_APP_FFMPEG REQUIRED IMPORTED_TARGET
    libavcodec
    libavfilter
    libavformat
    libavutil
    libswresample
    libswscale
)
target_link_libraries(external_ffmpeg INTERFACE PkgConfig::DESKTOP_APP_FFMPEG)
