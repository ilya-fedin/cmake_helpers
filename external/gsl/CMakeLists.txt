# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_gsl INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_gsl ALIAS external_gsl)

find_package(Microsoft.GSL 4.1.0 REQUIRED)
target_link_libraries(external_gsl INTERFACE Microsoft.GSL::GSL)
