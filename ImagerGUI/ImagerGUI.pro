#-------------------------------------------------
#
# Project created by QtCreator 2017-06-29T13:16:21
#
#-------------------------------------------------

QT       += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = ImagerGUI
TEMPLATE = app

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0


SOURCES += \
        main.cpp \
        mainwindow.cpp \
    okworker.cpp \
    imagedisplay.cpp


HEADERS += \
        mainwindow.h \
    okworker.h \
    okFrontPanelDLL.h \
    imagedisplay.h

FORMS += \
        mainwindow.ui


CONFIG += qwt


unix|win32: LIBS += -L$$PWD/./ -lokFrontPanel

INCLUDEPATH += $$PWD/.
INCLUDEPATH += C:/opencv/build/include


LIBS += -LC:\\opencv-build\\install\\x86\\mingw\\lib -lopencv_core320
-lopencv_highgui320
-lopencv_imgcodecs320
-lopencv_imgproc320
-lopencv_features2d320
-lopencv_calib3d320
-lopencv_videoio320
-lopencv_video320
-lopencv_flann320
-lopencv_ml320
-lopencv_objdetect320
-lopencv_photo320
-lopencv_shape320
-lopencv_stitching320
-lopencv_superres320
-lopencv_videostab320




DEPENDPATH += $$PWD/.
