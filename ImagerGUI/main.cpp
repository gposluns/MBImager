#include "mainwindow.h"
#include <QApplication>

int main(int argc, char *argv[])
{
    qDebug() <<"main Crash";
    try{

    QApplication a(argc, argv);
    MainWindow w;
    w.show();

    return a.exec();
    }
    catch (std::exception& e){
        qDebug() << e.what();
        return 1;
    }
}
