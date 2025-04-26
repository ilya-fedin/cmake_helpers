# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_kcoreaddons INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_kcoreaddons ALIAS external_kcoreaddons)

find_package(KF${QT_VERSION_MAJOR}CoreAddons REQUIRED)
target_link_libraries(external_kcoreaddons INTERFACE KF${QT_VERSION_MAJOR}::CoreAddons)
