#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    worker = new okWorker();
    okThread = new QThread();

    worker->moveToThread(okThread);
    okThread->start();

    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(updateFrame()));
    timer->start(1);

    ui->ImgWidget1->x = 0;
    ui->ImgWidget2->x = 0;
    ui->ImgWidget1->y = 0;
    ui->ImgWidget2->y = 0;
    ui->ImgWidget1->zoom = 1;
    ui->ImgWidget2->zoom = 1;

    connect(okThread, SIGNAL(finished()), worker, SLOT(deleteLater()));
    connect(this, SIGNAL(pattLoadClicked(QString)), worker, SLOT(loadPattern(QString)));
    connect(this, SIGNAL(stop()), worker, SLOT(stop()));
    connect(this, SIGNAL(display(int, int, int, int, QString)), worker, SLOT(showImages(int,int,int,int, QString)));
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_BitLoad_clicked()
{
    bitFileName = QFileDialog::getOpenFileName(nullptr, "select bitfile", nullptr, "*.bit");
    if (bitFileName.isEmpty()){
        qDebug() << "no bitfile chosen";
        return;
    }
    worker->ok.ConfigureFPGA(bitFileName.toStdString());
}

void MainWindow::on_PattLoad_clicked()
{
    QString file = QFileDialog::getOpenFileName(nullptr, "select pattern file", nullptr, "*.bmp");
    if (file.isEmpty()){
        qDebug() << "no pattern chosen";
        return;
    }
    emit pattLoadClicked(file);
}

void MainWindow::on_DispImage_toggled(bool checked)
{
    if (!checked){
        emit stop();
    }
    else{
       emit display(ui->expBox->value(), ui->maskBox->value(), ui->maskChngBox->value(), ui->subcBox->value(), bitFileName);
    }
}

void MainWindow::on_xBox_valueChanged(int arg1)
{
    if (arg1 == ui->ImgWidget1->x){
        return;
    }
    ui->ImgWidget1->x = arg1;
    ui->ImgWidget2->x = arg1;
    ui->XSlider->setValue(arg1);
}

void MainWindow::on_yBox_valueChanged(int arg1)
{
    if (arg1 == ui->ImgWidget1->y){
        return;
    }
    ui->ImgWidget1->y = arg1;
    ui->ImgWidget2->y = arg1;
    ui->YSlider->setValue(arg1);
}

void MainWindow::on_YSlider_valueChanged(int arg1)
{
    if (arg1 == ui->ImgWidget1->y){
        return;
    }
    ui->ImgWidget1->y = arg1;
    ui->ImgWidget2->y = arg1;
    ui->yBox->setValue(arg1);
}

void MainWindow::on_XSlider_valueChanged(int arg1)
{
    if (arg1 == ui->ImgWidget1->x){
        return;
    }
    ui->ImgWidget1->x = arg1;
    ui->ImgWidget2->x = arg1;
    ui->xBox->setValue(arg1);
}

void MainWindow::closeEvent(QCloseEvent* close){
    emit stop();
    timer->stop();
    okThread->quit();
}

void MainWindow::updateFrame(){
    if (worker->queue1.empty()){
        //dontDelete = true;
        return;
    }

    /*if (!dontDelete){
        delete im1;
        delete im2;
    }*/

    qDebug() << "deleted old images";

    QImage temp1(worker->queue1.front(), 184, im_row, QImage::Format_Grayscale8);
    QImage temp2(worker->queue2.front(), 184, im_row, QImage::Format_Grayscale8);
    //im1 = new QImage("testing.bmp");
    //im2 = new QImage("testing.bmp");
    //dontDelete = false;

        qDebug() << "made new images";

     im1 = temp1/*.scaled(184*2, 160*2, Qt::IgnoreAspectRatio, Qt::SmoothTransformation)*/;
     im2 = temp2/*.scaled(184*2, 160*2, Qt::IgnoreAspectRatio, Qt::SmoothTransformation)*/;

  qDebug() << "scaled images to size" << im1.height() << im1.width();

    free (worker->queue1.front());
    free (worker->queue2.front());

    qDebug() << "freed old arrays";

    worker->queue1.pop_front();
    worker->queue2.pop_front();

    qDebug() << "popped from lists";

    ui->ImgWidget1->setImage(&im1);
    ui->ImgWidget2->setImage(&im2);
}

void MainWindow::on_Zoom_valueChanged(int value)
{
    if (ui->ImgWidget1->zoom == value){
        return;
    }
    ui->ImgWidget1->zoom = value;
    ui->ImgWidget2->zoom = value;
}
