qt_add_library(qmlapp STATIC)

set_target_properties(qmlapp PROPERTIES AUTOMOC ON)
target_link_libraries(qmlapp PRIVATE Qt6::Quick)

qt_add_qml_module(qmlapp
    URI Application
    VERSION 1.0
    RESOURCE_PREFIX /example.mixxx.org/imports
    QML_FILES
        CueButton.qml
        Deck.qml
        EqDial.qml
        EqFxSection.qml
        EqKillButton.qml
        FxButton.qml
        FxButtonRow.qml
        FxDial.qml
        GainLevel.qml
        HeadphoneMix.qml
        IntroOutroButton.qml
        LoopButton.qml
        LoopToggleButton.qml
        MainMix.qml
        Mixer.qml
        PflButton.qml
        PitchRate.qml
        PitchRateButton.qml
        SmallFxButton.qml
        ToggleButton.qml
        XFaderOrientationSwitch.qml
        main.qml
    RESOURCES 
        assets/fonts/OpenSans-Bold.ttf
        assets/fonts/OpenSans-Regular.ttf
        assets/fonts/OpenSans-Semibold.ttf
)



