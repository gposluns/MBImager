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

#include (C:\qwt-6.1.3\features\qwt.prf)

#CONFIG += qwt


unix|win32: LIBS += -L$$PWD/./ -lokFrontPanel

INCLUDEPATH += $$PWD/.
#INCLUDEPATH += C:\opencv\build\include
#INCLUDEPATH += C:\Users\MBImager\Documents\picklingtools\PicklingTools170Release.tar\PicklingTools170Release\C++
#INCLUDEPATH += C:\Users\MBImager\Documents\picklingtools\PicklingTools170Release.tar\PicklingTools170Release\C++\opencontainers_1_8_5\include
#INCLUDEPATH += C:\Qt\Tools\mingw530_32\lib\gcc\i686-w64-mingw32\5.3.0


#LIBS += -LC:/opencv-build/lib -lopencv_core320
#LIBS += -LC:/opencv-build/lib -lopencv_highgui320
#LIBS += -LC:/opencv-build/lib -lopencv_imgcodecs320
#LIBS += -LC:/opencv-build/lib -lopencv_imgproc320
#LIBS += -LC:/opencv-build/lib -lopencv_features2d320
#LIBS += -LC:/opencv-build/lib -lopencv_calib3d320
#LIBS += -LC:/opencv-build/lib -lopencv_videoio320
#LIBS += -LC:/opencv-build/lib -lopencv_video320
#LIBS += -LC:/opencv-build/lib -lopencv_calib3d320
#LIBS += -LC:/opencv-build/lib -lopencv_flann320
#LIBS += -LC:/opencv-build/lib -lopencv_ml320
#LIBS += -LC:/opencv-build/lib -lopencv_objdetect320
#LIBS += -LC:/opencv-build/lib -lopencv_photo320
#LIBS += -LC:/opencv-build/lib -lopencv_shape320
#LIBS += -LC:/opencv-build/lib -lopencv_stitching320
#LIBS += -LC:/opencv-build/lib -lopencv_superres320
#LIBS += -LC:/opencv-build/lib -lopencv_ts320
#LIBS += -LC:/opencv-build/lib -lopencv_videostab320




DEPENDPATH += $$PWD/.
