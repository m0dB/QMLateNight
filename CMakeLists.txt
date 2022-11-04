cmake_minimum_required(VERSION 3.16)

project(QMLateNight VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Gui Quick QuickControls2 Svg REQUIRED)

qt_add_executable(UiApp
    src/main.cpp
)

add_subdirectory(qml)

set_target_properties(UiApp PROPERTIES
    MACOSX_BUNDLE_GUI_IDENTIFIER example.mixxx.org
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(UiApp
    PRIVATE Qt6::Gui Qt6::Quick Qt6::QuickControls2 Qt6::Svg qmlappplugin latenightstyleplugin)

install(TARGETS UiApp
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
