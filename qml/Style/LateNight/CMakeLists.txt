qt_add_library(latenightstyle STATIC)

set_target_properties(latenightstyle PROPERTIES AUTOMOC ON)
target_link_libraries(latenightstyle PRIVATE Qt6::Quick)

qt_add_qml_module(latenightstyle
    URI LateNight
    VERSION 1.0
    RESOURCE_PREFIX /example.mixxx.org/imports
    QML_FILES
        Label.qml
        Button.qml
        Dial.qml
        Frame.qml
        Slider.qml
        SpinBox.qml
    RESOURCES
        assets/dial/background.svg
        assets/dial/foreground.svg
        assets/dial/handle.svg
        assets/dial/track.svg
        assets/icons/pfl.svg
        assets/sliders/level/background.svg
        assets/sliders/level/handle.svg
        assets/sliders/pitchrate/background.svg
        assets/sliders/pitchrate/handle.svg
        assets/sliders/xfader/background.svg
        assets/sliders/xfader/handle.svg
        assets/spinbox/indicator_down.svg
        assets/spinbox/indicator_up.svg
        assets/xfader_orientation/handle.svg
)


