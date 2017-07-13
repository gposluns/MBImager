#include "okworker.h"
#include "time.h"

okWorker::okWorker(QObject *parent) : QObject(parent)
{
    //qDebug() <<'okWorker Crash';
    if (false == okFrontPanelDLL_LoadLib(nullptr)){
        emit okLoadFailed();
    }
    patternSet = false;
   // fails = 0;
}

void okWorker::loadPattern(QString path){
    if (!ok.IsFrontPanelEnabled()){
        qDebug() << "FPGA not configured";
        return;
    }

    QFile file(path);
    file.open(QIODevice::ReadOnly);
    char metadata[26];
    file.read(metadata, 26);

    unsigned int offset = *(unsigned int*)(metadata + 10);
    int width = *(int*)(metadata + 18);
    int height = *(int*)(metadata + 22);
    //qDebug() << width << height << offset;

    char* image = (char*)malloc(width*height/8);
    file.seek(offset);
    file.read(image, width*height/8);
    if (patternSet) free(pattern);
    patternSet = true;
    patternLength = width*height/8;
    pattern = (unsigned char*)malloc(patternLength);
    int byte = 0;
    unsigned char one_byte = 0;

    for(int i = 0; i < height; i++){
        for (int j = 0; j < channel_width; j++){
            for(int k = 0; k < num_channel; k++){
                int bit = i*width + j + k*channel_width;
                if ((image[bit/8] & (1 << (7 - (bit % 8)))) == 0){
                    one_byte += (1 << (7 - (k % 8)));
                }
                if (k % 8 == 7){
                    pattern[byte++] = one_byte;
                    one_byte = 0;
                }
            }
        }
    }

  /* for(int i = 0; i < width*height/8; i+= 18){
        qDebug() << pattern[i] <<  pattern[i+1] << pattern[i+2] << pattern[i + 3] << pattern[i+4] <<  pattern[i+5] << pattern[i+6] << pattern[i + 7] << pattern[i+8] <<  pattern[i+9] << pattern[i+10] << pattern[i + 11] << pattern[i+12] <<  pattern[i+13] << pattern[i+14] << pattern[i + 15] << pattern[i+16] << pattern[i + 17];
    }*/



    //whatever uploads the pattern

}

void okWorker::showImages(int exp, int numMasks, int maskChngs, int subcPer, QString bitFileName){
    //QThread::sleep(1);
    //qDebug() << 1;
    running = true;
    //qDebug() << 2;
    if (bitFileName.isEmpty()){
        //qDebug() << "no bitfile selected";
        return;
    }
    //qDebug() << 3;
    //try{
    ok.OpenBySerial("");
    //}
    //catch(std::exception& e){
        //qDebug() << e.what();
   // }

    //qDebug() << 3.5;
    ok.ConfigureFPGA (bitFileName.toStdString());
   // qDebug() << 4;
    ok.SetWireInValue(0x10, 0xff, 0x01);
   // qDebug() << 5;
    ok.SetWireInValue(EXP_WIRE, exp);
   // qDebug() << 6;
    ok.SetWireInValue(NUM_MASKS_WIRE, numMasks);
   // qDebug() << 7;
    ok.SetWireInValue(MASK_CHANGES_WIRE, maskChngs);
   // qDebug() << 8;
    ok.SetWireInValue(SUBS_PER_WIRE, subcPer);
   // qDebug() << 9;
    ok.SetWireInValue(PATT_IN_WIRE, 0xfff003ff);
   // qDebug() << 10;
   // qDebug() << exp << numMasks << maskChngs << subcPer;
   // qDebug() << 11;
    ok.UpdateWireIns();
    QThread::msleep(100);
    ok.SetWireInValue(0x10,0x00,0x01);
    ok.UpdateWireIns();
    if (patternSet){
        ok.ActivateTriggerIn(0x53, 0);
        ok.WriteToPipeIn(0x80, patternLength, pattern);
    }
   // qDebug() << 12;
    unsigned char datainFull[262144];
    unsigned char im[im_row][im_col];
    unsigned char *im1;
    unsigned char *im2;

    int stuck = 0;
    while (running){
        QThread::msleep (1);
        ok.UpdateTriggerOuts();
        //main camera loop
       // qDebug() << "running ok loop, time=" << clock() << "clks/sec=" << CLOCKS_PER_SEC;

        if (ok.IsTriggered(0x6a, 0x01)){
            ok.ReadFromPipeOut(0xa0, 262144, datainFull);
            stuck = 0;
            im1 = (unsigned char*)malloc (im_row*184);
            im2 = (unsigned char*)malloc (im_row*184);
            qDebug() << 1;
            //if (ok.IsTriggered(0x6a, 0x02)){
                //qDebug() << "also 2";
              //  fails++;
            //}
        }
        else if (ok.IsTriggered(0x6a, 0x02)){
            ok.ReadFromPipeOut(0xa0, 2*frame_length, datainFull);
            stuck = 0;
           // qDebug() << 2;
            im1 = (unsigned char*)malloc (im_row*184);
            im2 = (unsigned char*)malloc (im_row*184);
        }
        else if (ok.IsTriggered(0x6a, 0x04)){
            ok.ReadFromPipeOut(0xa0, frame_length, datainFull);
            stuck = 0;
           // qDebug() << 4;
            im1 = (unsigned char*)malloc (im_row*184);
            im2 = (unsigned char*)malloc (im_row*184);
        }
        else{
            stuck++;
           // fails--;
            if(stuck > 1000){
                qDebug() << "stuck, restting";
                ok.SetWireInValue(0x10, 0xff, 0x01);
                ok.UpdateWireIns();
                QThread::msleep(10);
                ok.SetWireInValue(0x10, 0x00, 0x01);
                ok.UpdateWireIns();
                QThread::msleep(10);
                stuck = 0;
            }
            continue;
        }

       // qDebug() << "ok ran, time=" << clock();
        for (int i = 0; i < im_row; i++){
            for (int j = 0; j < N_adc; j++){
                for (int k = 0; k < N_adcCh; k++){
                    for (int l = 0; l < N_mux; l++){
                        im[(im_row - 1 - i)][im_col - 1 - (j*N_adcCh*N_mux + (2 - k)*N_mux + 45 - l)] = datainFull[i*im_col + l*N_adc*N_adcCh + k*N_adc + j];
                    }
                }
            }
        }
       // qDebug() << "big loops ran, time=" << clock();
        for (int i = 0; i < im_row; i++){
            for (int j = 0; j < 184; j ++){
                im1[i*184 + j] = im[i][138 + 2*j];
                im2[i*184 + j] = im[i][139 + 2*j];
            }
        }
        //qDebug() << "small loops ran, time=" << clock();

        if (im1[184*160 - 1] == 255){
            continue;
        }

        //qDebug() << "prequeue:" << im1[184*160 - 1];

        if (queue1.size() < 15){
            std::lock_guard<std::mutex> lock (list_mutex);
            queue1.push_back(im1);
            queue2.push_back(im2);
        }
    }
}

void okWorker::stop(){
    running = false;
}
