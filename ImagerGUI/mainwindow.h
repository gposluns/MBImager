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
    bool dontDelete;

protected:
    void closeEvent(QCloseEvent* close);

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
};

#endif // MAINWINDOW_H
