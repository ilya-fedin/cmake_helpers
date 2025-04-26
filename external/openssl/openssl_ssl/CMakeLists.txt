# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_openssl_ssl INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_openssl_ssl ALIAS external_openssl_ssl)

target_link_libraries(external_openssl_ssl
INTERFACE
    desktop-app::external_openssl_common
)

find_package(OpenSSL REQUIRED)
target_link_libraries(external_openssl_ssl INTERFACE OpenSSL::SSL)
