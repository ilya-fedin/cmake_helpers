# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_qr_code_generator INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_qr_code_generator ALIAS external_qr_code_generator)

find_package(unofficial-nayuki-qr-code-generator QUIET)
if (unofficial-nayuki-qr-code-generator_FOUND)
    target_link_libraries(external_qr_code_generator INTERFACE unofficial::nayuki-qr-code-generator::nayuki-qr-code-generator)
    return()
endif()

find_library(DESKTOP_APP_QRCODE_LIBRARIES NAMES qrcodegencpp REQUIRED)
find_path(DESKTOP_APP_QRCODE_INCLUDE_DIRS NAMES qrcodegen.hpp QrCode.hpp PATH_SUFFIXES qrcodegencpp qrcodegen)
target_include_directories(external_qr_code_generator SYSTEM INTERFACE ${DESKTOP_APP_QRCODE_INCLUDE_DIRS})
target_link_libraries(external_qr_code_generator INTERFACE ${DESKTOP_APP_QRCODE_LIBRARIES})
