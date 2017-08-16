#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>
#include <QPushButton>
#include <QSpinBox>
#include <QGraphicsView>
#include "okworker.h"
#include <QThread>
#include <QCloseEvent>
#include <QString>
#include "imagedisplay.h"
#include <QFileDialog>
#include <QTimer>
#include "stdlib.h"
#include <QImage>
#include <QDebug>
#include <thread>
#include <mutex>
#include <QDir>
#include <QDateTime>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs/imgcodecs.hpp>
#include <opencv2/videoio.hpp>
//#include <qwt_plot_histogram.h>
#include <QByteArray>
#include <QFile>
#include <QDirIterator>

#define COEFFS_PER_EXPOSURE 56880
#define NUM_EXPOSURES 24
#define EXP_ROWS 79
#define EXP_COLS 60

namespace Ui {
class MainWindow;
}

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    explicit MainWindow(QWidget *parent = 0);
    ~MainWindow();

private:
    Ui::MainWindow *ui;
    okWorker *worker;
    QThread *okThread;
    QString bitFileName;
    QTimer* timer;
    QImage im1;
    QImage im2;
    QDirIterator *pattDir;
    std::thread *workerThread;
    int imagesToSave;
    int calibCounter;
    QString pattName;
    cv::VideoWriter *video1;
    //QwtPlotHistogram histogram;
    unsigned char darkimg1 [EXP_ROWS][EXP_COLS];
    unsigned char lightimg1 [EXP_ROWS][EXP_COLS];
    unsigned char darkimg2 [EXP_ROWS][EXP_COLS];
    unsigned char lightimg2 [EXP_ROWS][EXP_COLS];
    int mean1;
    int mean2;
    int meandark1;
    int meandark2;
    bool videoRec;
    int exposure;
    int subc;
    int maskchngs;
    int masks;

protected:
    void closeEvent(QCloseEvent* close);
    void callShowImages();

signals:
    void closing();
    void display(int exposure, int numMasks, int maskChngs, int subc, QString bitFile);
    void stop();
    void pattLoadClicked(QString path);

private slots:
    void on_BitLoad_clicked();
    void on_PattLoad_clicked();
    void on_DispImage_toggled(bool checked);
    void on_xBox_valueChanged(int arg1);
    void on_yBox_valueChanged(int arg1);
    void on_YSlider_valueChanged(int value);
    void on_XSlider_valueChanged(int value);
    void updateFrame();
    void on_Zoom_valueChanged(int value);
    void on_SaveImages_clicked();
    void on_RecVideo_toggled(bool checked);
    void on_Reset_clicked();
    void on_DispType_currentIndexChanged(int index);
    void on_SaveImages_toggled(bool checked);
    void on_calib_clicked();
};

#endif // MAINWINDOW_H
