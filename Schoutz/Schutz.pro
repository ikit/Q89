TEMPLATE = app

QT += qml quick core

SOURCES += main.cpp \
    tools.cpp

RESOURCES += qml.qrc \
    Lvl-AbsG.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    tools.h

