# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

if (DEFINED QT_VERSION_MAJOR)
    find_package(QT NAMES Qt${QT_VERSION_MAJOR} COMPONENTS Core REQUIRED)
else()
    find_package(QT NAMES Qt6 COMPONENTS Core QUIET)
    if (NOT QT_FOUND)
        find_package(QT NAMES Qt5 COMPONENTS Core QUIET)
    endif()
    if (NOT QT_FOUND)
        message(FATAL_ERROR "Neither Qt6 nor Qt5 is found")
    endif()
endif()

find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Core Gui Widgets Network Svg REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} OPTIONAL_COMPONENTS Quick QuickWidgets QUIET)

if (QT_VERSION_MAJOR GREATER_EQUAL 6)
    find_package(Qt${QT_VERSION_MAJOR} COMPONENTS OpenGL OpenGLWidgets REQUIRED)
endif()

if (QT_VERSION VERSION_GREATER_EQUAL 6.10)
    find_package(Qt${QT_VERSION_MAJOR} COMPONENTS GuiPrivate WidgetsPrivate REQUIRED)
endif()

if (LINUX)
    find_package(Qt${QT_VERSION_MAJOR} OPTIONAL_COMPONENTS DBus WaylandCompositor QUIET)
endif()

set_property(GLOBAL PROPERTY AUTOGEN_SOURCE_GROUP "(gen)")
set_property(GLOBAL PROPERTY AUTOGEN_TARGETS_FOLDER "(gen)")
