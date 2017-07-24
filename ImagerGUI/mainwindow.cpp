#include "mainwindow.h"
#include "ui_mainwindow.h"
#include <exception>

double dark [NUM_EXPOSURES][COEFFS_PER_EXPOSURE];
double light [NUM_EXPOSURES][COEFFS_PER_EXPOSURE];

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    qDebug() << "mainWindow Crash";
    try{
    ui->setupUi(this);
    worker = new okWorker();
    //okThread = new QThread();
    videoRec = false;
    //worker->moveToThread(okThread);
    //okThread->start();

    timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), this, SLOT(updateFrame()));
    timer->start(1);

    imagesToSave = 0;

    ui->ImgWidget1->x = 0;
    ui->ImgWidget2->x = 0;
    ui->ImgWidget1->y = 0;
    ui->ImgWidget2->y = 0;
    ui->ImgWidget1->zoom = 1;
    ui->ImgWidget2->zoom = 1;

    //connect(okThread, SIGNAL(finished()), worker, SLOT(deleteLater()));
    connect(this, SIGNAL(pattLoadClicked(QString)), worker, SLOT(loadPattern(QString)));
    connect(this, SIGNAL(stop()), worker, SLOT(stop()));
    //connect(this, SIGNAL(display(int, int, int, int, QString)), worker, SLOT(showImages(int,int,int,int, QString)));

   // histogram.attach(ui->histogram1);
    //cv::Mat img = cv::imread("testing.bmp", CV_LOAD_IMAGE_GRAYSCALE);
    //cv::MatND hist;
   // int histSize[1] = {256};
    //int channels[1] = {0};
   // float hranges[2] = {0.0,255.0};
   // const float* ranges[1] = {hranges};
    //cv::calcHist(&img, 1, channels, cv::Mat(), hist, 1, histSize, ranges);

    //Val lightVal;
    //Val darkVal;
    //LoadValFromFile("expWhite.pkl", lightVal);
    //LoadValFromFile("expDark.pkl", darkVal);

    QFile lightFile("whiteData.exp");
    //qDebug() << lightFile.exists() << lightFile.open(QIODevice::ReadOnly);
    while(!lightFile.atEnd()){
       QByteArray exp = lightFile.read(4);
       char* exposure = exp.data();
       int expo = *(int*)exposure;
       //qDebug() << expo << (int)exposure[3] << (int)exposure[2] << (int)exposure[1] << (int)exposure[0];
       QByteArray data = lightFile.read(COEFFS_PER_EXPOSURE * 8);
       char* coeffs = data.data();
       for (int i = 0; i < COEFFS_PER_EXPOSURE; i++){
           light [expo/1490][i] = *(double*)(coeffs + i*8);
       }
    }
    lightFile.close();

    QFile darkFile("darkData.exp");
    darkFile.open(QIODevice::ReadOnly);
    while(!darkFile.atEnd()){
       QByteArray exp = darkFile.read(4);
       char* exposure = exp.data();
       int expo = *(int*)exposure;
       QByteArray data = darkFile.read(COEFFS_PER_EXPOSURE * 8);
       char* coeffs = data.data();
       for (int i = 0; i < COEFFS_PER_EXPOSURE; i++){
           dark [expo/1490][i] = *(double*)(coeffs + i*8);
       }
    }
    darkFile.close();


    }
  catch (std::exception& e){
        qDebug() << e.what();
    }
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
    qDebug() << bitFileName;
    worker->ok.OpenBySerial("");
    worker->ok.ConfigureFPGA(bitFileName.toStdString());
    if (!worker->ok.IsFrontPanelEnabled()){
        qDebug() << "upload failed";
    }
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

double evalPoly (int n, double x, double* coeffs){
    double degacc = 1;
    double acc = 0;
    for (int i = 0; i < n; i++){
        acc += degacc*coeffs[n];
        degacc *= x;
    }
    return acc;
}

void MainWindow::on_DispImage_toggled(bool checked)
{
    try{
    if (!checked){
        //emit stop();
        worker->stop();
    }
    else{

        int exposure = ui->expBox->value();
        int masks = ui->maskBox->value();
        int maskchngs = ui->maskChngBox->value();
        int subc = ui->subcBox->value();
        double percent = 0;

        if (subc*maskchngs > masks) maskchngs = masks/subc;
        if (maskchngs == 0) percent = 100;
        else if (maskchngs % 2 == 0) percent = 100*(1 - maskchngs*subc/masks/2);
        else percent = 100*(maskchngs + 1)*subc/masks/2;

        int totExp = masks*(28.8 + exposure);

        int key = totExp/1490;
        if (key > 24) key = 24;


        mean1 = 0;
        mean2 = 0;
        meandark1 = 0;
        meandark2 = 0;

        for (int i = 0; i < EXP_ROWS; i++){
            for (int j = 0; j < EXP_COLS; j++){
                lightimg1[i][j] = evalPoly(6, percent, &(light[key][6 * (i*EXP_ROWS + j)]));
                darkimg1[i][j] = evalPoly(6, percent, &(dark[key][6 * (i*EXP_ROWS + j)]));
                lightimg2[i][j] = evalPoly(6, percent, &(light[key][COEFFS_PER_EXPOSURE/2 + 6*(i*EXP_ROWS + j)]));
                darkimg2[i][j] = evalPoly(6, percent, &(dark[key][COEFFS_PER_EXPOSURE/2 + 6*(i*EXP_ROWS + j)]));
                mean1 += lightimg1[i][j] - darkimg1[i][j];
                mean2 += lightimg2[i][j] - darkimg2[i][j];
                meandark1 += darkimg1[i][j];
                meandark2 += darkimg2[i][j];
            }
        }

        mean1 /= 79 * 60;
        mean2 /= 79 * 60;
        meandark1 /= 79 * 60;
        meandark2 /= 79 * 60;

        workerThread = new std::thread(&MainWindow::callShowImages, this);


       //emit display(ui->expBox->value(), ui->maskBox->value(), ui->maskChngBox->value(), ui->subcBox->value(), bitFileName);
    }
    }
    catch (std::exception& e){
        qDebug() << e.what();
    }
}

void MainWindow::callShowImages(){
    try{
    worker->showImages(ui->expBox->value(), ui->maskBox->value(), ui->maskChngBox->value(), ui->subcBox->value(), bitFileName);
    }
    catch (std::exception& e){
        qDebug() << e.what();
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
    //emit stop();
    timer->stop();
    if (videoRec){
        video1->release();
    }
    //okThread->quit();
}

void unload_list(std::list<unsigned char*> *list, QImage* image, okWorker *worker){
    std::lock_guard<std::mutex> lock (worker->list_mutex);
    QImage temp(list->front(), 184, im_row, QImage::Format_Grayscale8);
    //qDebug() << "inqueue:" << list->front()[184*160 - 1] << temp.bits()[184*160 - 1];
    *image = temp.copy(0, 0, 184, 160);
    free(list->front());
    list->pop_front();
}

void MainWindow::updateFrame(){
    //qDebug() << "about to check queue";
   // while (worker->listLock){ QThread::usleep(1); qDebug() << "gui waiting on list lock";}


    if (worker->queue1.empty()){
        //qDebug() << "empty queue";
        return;
    }
    //qDebug() << "non-empty queue";

    QDir dir(QString("MBImagerGUI/Images exp%1 masks%2 chngs%3 subc%4").arg(ui->expBox->value()).arg(ui->maskBox->value()).arg(ui->maskChngBox->value()).arg(ui->subcBox->value()));
    if (imagesToSave > 0 && !dir.exists()){
       // qDebug() << "making directory" << dir.absolutePath();
        dir.mkpath(dir.path());
    }
    QDateTime date = QDateTime::currentDateTime();

    QImage temp1;
    QImage temp2;
    unload_list(&(worker->queue1), &temp1, worker);
    unload_list(&(worker->queue2), &temp2, worker);
    //qDebug() << "postqueue" << temp1.bits()[184*160 - 1];

    if (ui->ApplyImg->isChecked()){
        for (int i = 1; i < 80; i++){
            for (int j = 2; j < 62; j++){
                temp1.setPixel(i, j, meandark1 + (temp1.pixel(i, j) - darkimg1[i - 1][j - 2])*mean1/(lightimg1[i - 1][j - 2] - darkimg1[i - 1][j - 2]));
                temp2.setPixel(i, j, meandark2 + (temp2.pixel(i, j) - darkimg2[i - 1][j - 2])*mean2/(lightimg2[i - 1][j - 2] - darkimg2[i - 1][j - 2]));
            }
        }
    }

    //qDebug() << "made new images";
    if (ui->DispType->currentText()=="ALL"){
        im1 = temp1.scaled(184*2*sqrt(ui->ImgWidget1->zoom), 160*2*sqrt(ui->ImgWidget1->zoom));
        im2 = temp2.scaled(184*2*sqrt(ui->ImgWidget2->zoom), 160*2*sqrt(ui->ImgWidget2->zoom));
        if (imagesToSave > 0){
            imagesToSave--;
            QString path = dir.path() + "/bucket1 " + date.toString("yyyy-M-d-h-m-s-z") + ".png";
            temp1.save(path);
            path = dir.path() + "/bucket2 " + date.toString("yyyy-M-d-h-m-s-z") + ".png";
            temp2.save(path);
        }
        if (videoRec){
            cv::Mat mat1(temp1.height(), temp1.width(), CV_8UC1, temp1.scanLine(0));
            video1->write(mat1);
        }

    }
    else if (ui->DispType->currentText() == "CEP"){
        im1 = temp1.copy(2, 0, 60, 80).scaled(60*2*sqrt(ui->ImgWidget1->zoom), 80*2*sqrt(ui->ImgWidget1->zoom));
        im2 = temp2.copy(2, 0, 60, 80).scaled(60*2*sqrt(ui->ImgWidget2->zoom), 80*2*sqrt(ui->ImgWidget2->zoom));

        if (imagesToSave > 0){
            imagesToSave--;
            QString path = dir.path() + "/bucket1 " + date.toString("yyyy-M-d-h-m-s-z") + ".png";
            temp1.copy(2, 0, 60, 80).save(path);
            path = dir.path() + "/bucket2 " + date.toString("yyyy-M-d-h-m-s-z") + ".png";
            temp2.copy(2, 0, 60, 80).save(path);
        }
        if (videoRec){
            cv::Mat mat1(temp1.height(), temp1.width(), CV_8UC1, temp1.scanLine(0));
            video1->write(mat1);

        }

    }
    else{ //TOF
        im1 = temp1.copy(62, 0, 120, 160).scaled(120*2*sqrt(ui->ImgWidget1->zoom), 160*2*sqrt(ui->ImgWidget1->zoom));
        im2 = temp2.copy(62, 0, 120, 160).scaled(120*2*sqrt(ui->ImgWidget2->zoom), 160*2*sqrt(ui->ImgWidget2->zoom));

        if (imagesToSave > 0){
            imagesToSave--;
            QString path = dir.path() + "/bucket1 " + date.toString("yyyy-M-d-h-m-s-z") + ".png";
            temp1.copy(62, 0, 120, 160).save(path);
            path = dir.path() + "/bucket2 " + date.toString("yyyy-M-d-h-m-s-z") + ".png";
            temp2.copy(62, 0, 120, 160).save(path);
        }
        if (videoRec){
            cv::Mat mat1(temp1.copy(62, 0, 120, 160).height(), temp1.copy(62, 0, 120, 160).width(), CV_8UC1, temp1.copy(62, 0, 120, 160).scanLine(0));
            video1->write(mat1);
        }
    if (imagesToSave ==0){
        ui->SaveImages->setEnabled(true);
    }
    }




    //qDebug() << "postprocessing:" << im1.bits()[184*160*4 - 1];
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

void MainWindow::on_SaveImages_clicked()
{
    imagesToSave = ui->numImageBox->value();
    ui->SaveImages->setEnabled(false);
}

void MainWindow::on_RecVideo_toggled(bool checked)
{
    cv::Size size;
    if (checked){
        /*if (!ui->DispImage->isChecked()){
            ui->RecVideo->setChecked(false);
            return;
        }*/
        if (ui->DispType->currentText() == "ALL"){
            size.height = 160;
            size.width = 184;
        }
        else if (ui->DispType->currentText() == "CEP"){
            size.height = 160;
            size.width = 184;
        }
        else{
            size.height = 160;
            size.width = 120;
        }

        QDir dir(QString("MBImagerGUI/Saved Videos"));
        if (!dir.exists()){
            dir.mkpath(dir.path());
        }
        QDateTime date = QDateTime::currentDateTime();
        QString vidpath =dir.path()+ "/bucket1 " + date.toString("yyyy-M-d-h-m-s-z") + ".avi" ;

        video1 = new cv::VideoWriter(vidpath.toStdString(), 541215044 , 60, size);
        videoRec = true;

    }
    else if (videoRec){
        videoRec = false;
        video1->release();

    }
}

void MainWindow::on_Reset_clicked()
{
    ui->xBox->setValue(0);
    ui->yBox->setValue(0);
    ui->Zoom->setValue(1);
}

void MainWindow::on_DispType_currentIndexChanged(int index)
{
    ui->RecVideo->setChecked(false);
}

