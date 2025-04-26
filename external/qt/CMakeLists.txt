# This file is part of Desktop App Toolkit,
# a set of libraries for developing nice desktop applications.
#
# For license and copyright information please follow this link:
# https://github.com/desktop-app/legal/blob/master/LEGAL

add_library(external_qt INTERFACE IMPORTED GLOBAL)
add_library(desktop-app::external_qt ALIAS external_qt)

add_subdirectory(qt_static_plugins)

target_link_libraries(external_qt
INTERFACE
    Qt::Core
    Qt::CorePrivate
    Qt::Gui
    Qt::GuiPrivate
    Qt::Widgets
    Qt::WidgetsPrivate
    Qt::Network
    Qt::Svg
)

if (TARGET Qt::OpenGL)
    target_link_libraries(external_qt INTERFACE Qt::OpenGL)
endif()

if (TARGET Qt::OpenGLWidgets)
    target_link_libraries(external_qt INTERFACE Qt::OpenGLWidgets)
endif()

if (TARGET Qt::DBus)
    target_link_libraries(external_qt INTERFACE Qt::DBus)
endif()

if (TARGET Qt::Quick)
    target_link_libraries(external_qt INTERFACE Qt::Quick)
endif()

if (TARGET Qt::QuickWidgets)
    target_link_libraries(external_qt INTERFACE Qt::QuickWidgets)
endif()

if (TARGET Qt::WaylandCompositor)
    target_link_libraries(external_qt INTERFACE Qt::WaylandCompositor)
endif()
