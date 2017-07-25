#ifndef IMAGEDISPLAY_H
#define IMAGEDISPLAY_H

#include <QWidget>
#include <QImage>
#include <QPainter>
#include <QPoint>
#include <QDebug>

class ImageDisplay : public QWidget
{
    Q_OBJECT
public:
    explicit ImageDisplay(QWidget *parent = nullptr);
    void setImage(QImage* image);
    int x;
    int y;
    int zoom;

private:
    QImage* image;

protected:
    void paintEvent(QPaintEvent* event);

signals:

public slots:
};

#endif // IMAGEDISPLAY_H
