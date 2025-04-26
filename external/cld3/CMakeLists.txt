# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_cld3 INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_cld3 ALIAS external_cld3)

find_package(unofficial-cld3 QUIET)
if (unofficial-cld3_FOUND)
    get_target_property(CLD3_INCLUDE_DIRS unofficial::cld3::cld3 INTERFACE_INCLUDE_DIRECTORIES)
    target_include_directories(external_cld3 INTERFACE ${CLD3_INCLUDE_DIRS}/cld3)
    target_link_libraries(external_cld3 INTERFACE unofficial::cld3::cld3)
    return()
endif()

find_package(protobuf REQUIRED CONFIG)
find_library(DESKTOP_APP_CLD3_LIBRARIES NAMES cld3 REQUIRED)
find_path(DESKTOP_APP_CLD3_INCLUDE_DIRS NAMES nnet_language_identifier.h PATH_SUFFIXES cld3 REQUIRED)
list(APPEND DESKTOP_APP_CLD3_LIBRARIES protobuf::libprotobuf-lite)
target_include_directories(external_cld3 SYSTEM INTERFACE ${DESKTOP_APP_CLD3_INCLUDE_DIRS})
target_link_libraries(external_cld3 INTERFACE ${DESKTOP_APP_CLD3_LIBRARIES})
