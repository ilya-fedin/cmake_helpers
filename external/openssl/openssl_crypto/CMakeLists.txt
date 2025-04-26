# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_openssl_crypto INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_openssl_crypto ALIAS external_openssl_crypto)

target_link_libraries(external_openssl_crypto
INTERFACE
    desktop-app::external_openssl_common
)

find_package(OpenSSL REQUIRED)
target_link_libraries(external_openssl_crypto INTERFACE OpenSSL::Crypto)
