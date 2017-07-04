#include "imagedisplay.h"

ImageDisplay::ImageDisplay(QWidget *parent) : QWidget(parent)
{
    image = nullptr;
}

void ImageDisplay::setImage(QImage *image){
    this->image = image;
    repaint();
}

void ImageDisplay::paintEvent(QPaintEvent *event){
    if (!image){
        return;
    }
    QPainter painter(this);
    //painter.begin(this);
    //painter.drawImage(QPointF(0, 0), *image);
    painter.drawImage(QPointF(-x*2*sqrt(zoom), -y*2*sqrt(zoom)), *image);
    //qDebug() << x << y << zoom;
   // painter.end();
    //qDebug() << this;
}
