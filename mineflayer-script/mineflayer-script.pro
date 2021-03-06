# -------------------------------------------------
# Project created by QtCreator 2011-01-23T00:47:29
# -------------------------------------------------
QT += core \
    script \
    scripttools \
    gui
TARGET = mineflayer
TEMPLATE = app
SOURCES += src/main.cpp \
    src/ScriptRunner.cpp \
    src/StdinReader.cpp \
    src/Util.cpp
HEADERS += ../mineflayer-core/src/mineflayer-core.h \
    src/ScriptRunner.h \
    src/StdinReader.h \
    src/Util.h \
    src/MetaTypes.h
INCLUDEPATH += ..
win32 {
    CONFIG( debug, debug|release ) {
        # debug
        LIBS += -L../mineflayer-core/debug
    } else {
        LIBS += -L../mineflayer-core/release
        # release
    }
} else {
    LIBS += -L../mineflayer-core
}
LIBS += -lmineflayer-core
RESOURCES += mineflayer-script.qrc
DEFINES += MINEFLAYER_GUI_ON
mac:CONFIG -= app_bundle
win32:CONFIG += console


unix {
    target.path = /bin
    INSTALLS += target
}


# if you want to run in headless mode, uncomment the next line or put it uncommented in config.pro
# CONFIG += headless
exists(config.pro) {
    include(config.pro)
}
headless {
    DEFINES -= MINEFLAYER_GUI_ON
    QT -= gui scripttools
}
