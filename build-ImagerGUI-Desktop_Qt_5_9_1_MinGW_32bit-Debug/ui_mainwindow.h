/********************************************************************************
** Form generated from reading UI file 'mainwindow.ui'
**
** Created by: Qt User Interface Compiler version 5.9.1
**
** WARNING! All changes made in this file will be lost when recompiling UI file!
********************************************************************************/

#ifndef UI_MAINWINDOW_H
#define UI_MAINWINDOW_H

#include <QtCore/QVariant>
#include <QtWidgets/QAction>
#include <QtWidgets/QApplication>
#include <QtWidgets/QButtonGroup>
#include <QtWidgets/QComboBox>
#include <QtWidgets/QGroupBox>
#include <QtWidgets/QHeaderView>
#include <QtWidgets/QLabel>
#include <QtWidgets/QMainWindow>
#include <QtWidgets/QPushButton>
#include <QtWidgets/QSlider>
#include <QtWidgets/QSpinBox>
#include <QtWidgets/QWidget>
#include "imagedisplay.h"

QT_BEGIN_NAMESPACE

class Ui_MainWindow
{
public:
    QWidget *centralwidget;
    QGroupBox *groupBox;
    ImageDisplay *ImgWidget1;
    QPushButton *DispImage;
    QGroupBox *groupBox2;
    ImageDisplay *ImgWidget2;
    QSlider *Zoom;
    QLabel *label;
    QSlider *XSlider;
    QSlider *YSlider;
    QPushButton *BitLoad;
    QComboBox *DispType;
    QLabel *maskslabel;
    QLabel *maskschangeslabel;
    QLabel *exposurelabel;
    QLabel *maskschangeslabel_2;
    QPushButton *SaveImages;
    QLabel *label_3;
    QPushButton *RecVideo;
    QPushButton *PattLoad;
    QPushButton *Reset;
    QPushButton *ApplyImg;
    QPushButton *EqualizeImg;
    QSpinBox *expBox;
    QSpinBox *maskBox;
    QSpinBox *maskChngBox;
    QSpinBox *subcBox;
    QSpinBox *numImageBox;
    QSpinBox *yBox;
    QSpinBox *xBox;
    QPushButton *calib;

    void setupUi(QMainWindow *MainWindow)
    {
        if (MainWindow->objectName().isEmpty())
            MainWindow->setObjectName(QStringLiteral("MainWindow"));
        MainWindow->resize(1171, 589);
        MainWindow->setStyleSheet(QStringLiteral(""));
        centralwidget = new QWidget(MainWindow);
        centralwidget->setObjectName(QStringLiteral("centralwidget"));
        groupBox = new QGroupBox(centralwidget);
        groupBox->setObjectName(QStringLiteral("groupBox"));
        groupBox->setGeometry(QRect(300, 30, 388, 351));
        QSizePolicy sizePolicy(QSizePolicy::Preferred, QSizePolicy::Preferred);
        sizePolicy.setHorizontalStretch(0);
        sizePolicy.setVerticalStretch(0);
        sizePolicy.setHeightForWidth(groupBox->sizePolicy().hasHeightForWidth());
        groupBox->setSizePolicy(sizePolicy);
        ImgWidget1 = new ImageDisplay(groupBox);
        ImgWidget1->setObjectName(QStringLiteral("ImgWidget1"));
        ImgWidget1->setGeometry(QRect(10, 20, 368, 320));
        DispImage = new QPushButton(centralwidget);
        DispImage->setObjectName(QStringLiteral("DispImage"));
        DispImage->setGeometry(QRect(110, 170, 161, 51));
        DispImage->setCheckable(true);
        groupBox2 = new QGroupBox(centralwidget);
        groupBox2->setObjectName(QStringLiteral("groupBox2"));
        groupBox2->setGeometry(QRect(750, 30, 388, 351));
        sizePolicy.setHeightForWidth(groupBox2->sizePolicy().hasHeightForWidth());
        groupBox2->setSizePolicy(sizePolicy);
        ImgWidget2 = new ImageDisplay(groupBox2);
        ImgWidget2->setObjectName(QStringLiteral("ImgWidget2"));
        ImgWidget2->setGeometry(QRect(10, 20, 368, 320));
        Zoom = new QSlider(centralwidget);
        Zoom->setObjectName(QStringLiteral("Zoom"));
        Zoom->setGeometry(QRect(340, 450, 341, 22));
        Zoom->setMinimum(1);
        Zoom->setMaximum(20);
        Zoom->setSingleStep(1);
        Zoom->setOrientation(Qt::Horizontal);
        label = new QLabel(centralwidget);
        label->setObjectName(QStringLiteral("label"));
        label->setGeometry(QRect(300, 450, 31, 16));
        XSlider = new QSlider(centralwidget);
        XSlider->setObjectName(QStringLiteral("XSlider"));
        XSlider->setGeometry(QRect(340, 400, 341, 22));
        XSlider->setMaximum(184);
        XSlider->setOrientation(Qt::Horizontal);
        YSlider = new QSlider(centralwidget);
        YSlider->setObjectName(QStringLiteral("YSlider"));
        YSlider->setGeometry(QRect(710, 70, 22, 301));
        YSlider->setLayoutDirection(Qt::LeftToRight);
        YSlider->setMaximum(160);
        YSlider->setOrientation(Qt::Vertical);
        YSlider->setInvertedAppearance(true);
        BitLoad = new QPushButton(centralwidget);
        BitLoad->setObjectName(QStringLiteral("BitLoad"));
        BitLoad->setGeometry(QRect(30, 30, 241, 51));
        DispType = new QComboBox(centralwidget);
        DispType->setObjectName(QStringLiteral("DispType"));
        DispType->setGeometry(QRect(30, 180, 61, 31));
        QFont font;
        font.setPointSize(8);
        DispType->setFont(font);
        maskslabel = new QLabel(centralwidget);
        maskslabel->setObjectName(QStringLiteral("maskslabel"));
        maskslabel->setGeometry(QRect(30, 290, 181, 31));
        maskslabel->setFont(font);
        maskschangeslabel = new QLabel(centralwidget);
        maskschangeslabel->setObjectName(QStringLiteral("maskschangeslabel"));
        maskschangeslabel->setGeometry(QRect(30, 340, 181, 31));
        maskschangeslabel->setFont(font);
        exposurelabel = new QLabel(centralwidget);
        exposurelabel->setObjectName(QStringLiteral("exposurelabel"));
        exposurelabel->setGeometry(QRect(30, 240, 191, 31));
        exposurelabel->setFont(font);
        maskschangeslabel_2 = new QLabel(centralwidget);
        maskschangeslabel_2->setObjectName(QStringLiteral("maskschangeslabel_2"));
        maskschangeslabel_2->setGeometry(QRect(30, 390, 191, 31));
        maskschangeslabel_2->setFont(font);
        SaveImages = new QPushButton(centralwidget);
        SaveImages->setObjectName(QStringLiteral("SaveImages"));
        SaveImages->setGeometry(QRect(170, 440, 101, 51));
        SaveImages->setFont(font);
        label_3 = new QLabel(centralwidget);
        label_3->setObjectName(QStringLiteral("label_3"));
        label_3->setGeometry(QRect(30, 430, 101, 61));
        label_3->setWordWrap(true);
        RecVideo = new QPushButton(centralwidget);
        RecVideo->setObjectName(QStringLiteral("RecVideo"));
        RecVideo->setGeometry(QRect(30, 510, 241, 51));
        RecVideo->setFont(font);
        RecVideo->setCheckable(true);
        PattLoad = new QPushButton(centralwidget);
        PattLoad->setObjectName(QStringLiteral("PattLoad"));
        PattLoad->setGeometry(QRect(30, 100, 241, 51));
        Reset = new QPushButton(centralwidget);
        Reset->setObjectName(QStringLiteral("Reset"));
        Reset->setGeometry(QRect(300, 510, 181, 51));
        ApplyImg = new QPushButton(centralwidget);
        ApplyImg->setObjectName(QStringLiteral("ApplyImg"));
        ApplyImg->setGeometry(QRect(750, 400, 181, 51));
        ApplyImg->setCheckable(true);
        EqualizeImg = new QPushButton(centralwidget);
        EqualizeImg->setObjectName(QStringLiteral("EqualizeImg"));
        EqualizeImg->setGeometry(QRect(960, 400, 181, 51));
        EqualizeImg->setCheckable(true);
        expBox = new QSpinBox(centralwidget);
        expBox->setObjectName(QStringLiteral("expBox"));
        expBox->setGeometry(QRect(211, 241, 61, 31));
        expBox->setMaximum(1000000);
        expBox->setSingleStep(1000);
        expBox->setValue(1);
        maskBox = new QSpinBox(centralwidget);
        maskBox->setObjectName(QStringLiteral("maskBox"));
        maskBox->setGeometry(QRect(210, 290, 61, 31));
        maskBox->setMaximum(10000);
        maskBox->setValue(600);
        maskChngBox = new QSpinBox(centralwidget);
        maskChngBox->setObjectName(QStringLiteral("maskChngBox"));
        maskChngBox->setGeometry(QRect(210, 340, 61, 31));
        maskChngBox->setMaximum(10000);
        subcBox = new QSpinBox(centralwidget);
        subcBox->setObjectName(QStringLiteral("subcBox"));
        subcBox->setGeometry(QRect(210, 390, 61, 31));
        subcBox->setMaximum(10000);
        numImageBox = new QSpinBox(centralwidget);
        numImageBox->setObjectName(QStringLiteral("numImageBox"));
        numImageBox->setGeometry(QRect(100, 450, 51, 31));
        numImageBox->setMaximum(1000);
        numImageBox->setValue(1);
        yBox = new QSpinBox(centralwidget);
        yBox->setObjectName(QStringLiteral("yBox"));
        yBox->setGeometry(QRect(700, 30, 42, 22));
        yBox->setMaximum(160);
        xBox = new QSpinBox(centralwidget);
        xBox->setObjectName(QStringLiteral("xBox"));
        xBox->setGeometry(QRect(290, 400, 42, 22));
        xBox->setMaximum(184);
        calib = new QPushButton(centralwidget);
        calib->setObjectName(QStringLiteral("calib"));
        calib->setGeometry(QRect(510, 510, 181, 51));
        MainWindow->setCentralWidget(centralwidget);
        QWidget::setTabOrder(BitLoad, PattLoad);
        QWidget::setTabOrder(PattLoad, DispType);
        QWidget::setTabOrder(DispType, DispImage);
        QWidget::setTabOrder(DispImage, SaveImages);
        QWidget::setTabOrder(SaveImages, RecVideo);
        QWidget::setTabOrder(RecVideo, Reset);
        QWidget::setTabOrder(Reset, ApplyImg);
        QWidget::setTabOrder(ApplyImg, EqualizeImg);
        QWidget::setTabOrder(EqualizeImg, XSlider);
        QWidget::setTabOrder(XSlider, Zoom);
        QWidget::setTabOrder(Zoom, YSlider);

        retranslateUi(MainWindow);

        QMetaObject::connectSlotsByName(MainWindow);
    } // setupUi

    void retranslateUi(QMainWindow *MainWindow)
    {
        MainWindow->setWindowTitle(QApplication::translate("MainWindow", "MBI_GUI", Q_NULLPTR));
        groupBox->setTitle(QApplication::translate("MainWindow", "Bucket 1", Q_NULLPTR));
        DispImage->setText(QApplication::translate("MainWindow", "Display Image", Q_NULLPTR));
        groupBox2->setTitle(QApplication::translate("MainWindow", "Bucket 2", Q_NULLPTR));
        label->setText(QApplication::translate("MainWindow", "Zoom", Q_NULLPTR));
        BitLoad->setText(QApplication::translate("MainWindow", "Load Bit File", Q_NULLPTR));
        DispType->clear();
        DispType->insertItems(0, QStringList()
         << QApplication::translate("MainWindow", "ALL", Q_NULLPTR)
         << QApplication::translate("MainWindow", "CEP", Q_NULLPTR)
         << QApplication::translate("MainWindow", "CEP-TOF", Q_NULLPTR)
        );
        maskslabel->setText(QApplication::translate("MainWindow", "Masks", Q_NULLPTR));
        maskschangeslabel->setText(QApplication::translate("MainWindow", "Mask Changes", Q_NULLPTR));
        exposurelabel->setText(QApplication::translate("MainWindow", "Exposure Time [us]", Q_NULLPTR));
        maskschangeslabel_2->setText(QApplication::translate("MainWindow", "Subscenes per Change", Q_NULLPTR));
        SaveImages->setText(QApplication::translate("MainWindow", "Save Images", Q_NULLPTR));
        label_3->setText(QApplication::translate("MainWindow", "Number of \n"
"Images", Q_NULLPTR));
        RecVideo->setText(QApplication::translate("MainWindow", "Record Video", Q_NULLPTR));
        PattLoad->setText(QApplication::translate("MainWindow", "Load Pattern File", Q_NULLPTR));
        Reset->setText(QApplication::translate("MainWindow", "Reset View", Q_NULLPTR));
        ApplyImg->setText(QApplication::translate("MainWindow", "Apply Image Correction", Q_NULLPTR));
        EqualizeImg->setText(QApplication::translate("MainWindow", "Equalize Image", Q_NULLPTR));
        calib->setText(QApplication::translate("MainWindow", "Save Calibration Images", Q_NULLPTR));
    } // retranslateUi

};

namespace Ui {
    class MainWindow: public Ui_MainWindow {};
} // namespace Ui

QT_END_NAMESPACE

#endif // UI_MAINWINDOW_H
