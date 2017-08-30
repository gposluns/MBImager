#ifndef OKWORKER_H
#define OKWORKER_H

#include <QObject>
#include <QGraphicsView>
#include "okFrontPanelDLL.h"
#include <QDebug>
#include <QString>
#include <QFile>
#include "stdlib.h"
#include <QThread>
#include <mutex>

#define EXP_WIRE 0x11
#define NUM_MASKS_WIRE 0x12
#define MASK_CHANGES_WIRE 0x13
#define SUBS_PER_WIRE 0x14
#define PATT_IN_WIRE 0x15

#define N_adc 4
#define N_adcCh 3
#define N_mux 46
#define im_row 160
#define im_col N_adc*N_adcCh*N_mux

#define num_channel 16
#define channel_width 18

#define frame_length 88320

class okWorker : public QObject
{
    Q_OBJECT
public:
    explicit okWorker(QObject *parent = nullptr);
    okCFrontPanel ok;
    std::list<unsigned char*> queue1;
    std::list<unsigned char*> queue2;
    int fails;
    std::mutex list_mutex;
    void enableExposure();
private:
    bool running;
    unsigned char* pattern;
    int patternLength;
    bool patternSet;
signals:
    void okLoadFailed();
    void debugSignal(void* data);

public slots:
    void showImages(int exp, int numMasks, int maskChngs, int subcPer, QString bitFileName);
    void stop();
    void loadPattern(QString path);
};

#endif // OKWORKER_H
