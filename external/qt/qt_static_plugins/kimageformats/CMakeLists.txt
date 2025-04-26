# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_qt_static_plugins_kimageformats STATIC)
add_library(desktop-app::external_qt_static_plugins_kimageformats ALIAS external_qt_static_plugins_kimageformats)
init_target(external_qt_static_plugins_kimageformats "(external)")

set(kimageformats_loc ${third_party_loc}/kimageformats)
set(kimageformats_src ${kimageformats_loc}/src/imageformats)

set_target_properties(external_qt_static_plugins_kimageformats PROPERTIES AUTOMOC ON)

nice_target_sources(external_qt_static_plugins_kimageformats ${kimageformats_src}
PRIVATE
    $<$<OR:$<TARGET_EXISTS:avif>,$<TARGET_EXISTS:PkgConfig::DESKTOP_APP_AVIF>>:avif.cpp>
    $<$<TARGET_EXISTS:heif>:heif.cpp>
    $<$<OR:$<TARGET_EXISTS:libjxl::libjxl>,$<TARGET_EXISTS:PkgConfig::DESKTOP_APP_JXL>>:jxl.cpp>
    qoi.cpp
    scanlineconverter.cpp
)

target_compile_definitions(external_qt_static_plugins_kimageformats
PRIVATE
    QT_STATICPLUGIN
)

find_package(libavif QUIET)
find_package(libheif QUIET)
find_package(libjxl QUIET)
find_package(PkgConfig)
if (PkgConfig_FOUND)
    if (NOT libavif_FOUND)
        pkg_check_modules(DESKTOP_APP_AVIF IMPORTED_TARGET libavif)
    endif()
    if (NOT libjxl_FOUND)
        pkg_check_modules(DESKTOP_APP_JXL IMPORTED_TARGET libjxl libjxl_threads)
    endif()
endif()

target_link_libraries(external_qt_static_plugins_kimageformats
PRIVATE
    desktop-app::external_qt
    $<TARGET_NAME_IF_EXISTS:avif>
    $<TARGET_NAME_IF_EXISTS:PkgConfig::DESKTOP_APP_AVIF>
    $<TARGET_NAME_IF_EXISTS:heif>
    $<TARGET_NAME_IF_EXISTS:libjxl::libjxl>
    $<TARGET_NAME_IF_EXISTS:PkgConfig::DESKTOP_APP_JXL>
)

add_library(external_qt_static_plugins_kimageformats_init OBJECT)
add_library(desktop-app::external_qt_static_plugins_kimageformats_init ALIAS external_qt_static_plugins_kimageformats_init)
init_target(external_qt_static_plugins_kimageformats_init "(external)")

nice_target_sources(external_qt_static_plugins_kimageformats_init ${CMAKE_CURRENT_SOURCE_DIR}
PRIVATE
    init.cpp
)

target_link_libraries(external_qt_static_plugins_kimageformats_init
PRIVATE
    desktop-app::external_qt
)

if (NOT libavif_FOUND AND NOT DESKTOP_APP_AVIF_FOUND)
    target_compile_definitions(external_qt_static_plugins_kimageformats_init PRIVATE QT_STATIC_PLUGINS_DISABLE_AVIF)
endif()

if (NOT libheif_FOUND)
    target_compile_definitions(external_qt_static_plugins_kimageformats_init PRIVATE QT_STATIC_PLUGINS_DISABLE_HEIF)
endif()

if (NOT libjxl_FOUND AND NOT DESKTOP_APP_JXL_FOUND)
    target_compile_definitions(external_qt_static_plugins_kimageformats_init PRIVATE QT_STATIC_PLUGINS_DISABLE_JXL)
endif()

target_link_libraries(external_qt_static_plugins_kimageformats
INTERFACE
    external_qt_static_plugins_kimageformats_init
    $<TARGET_OBJECTS:external_qt_static_plugins_kimageformats_init>
)
