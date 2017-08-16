/****************************************************************************
** Meta object code from reading C++ file 'okworker.h'
**
** Created by: The Qt Meta Object Compiler version 67 (Qt 5.9.0)
**
** WARNING! All changes made in this file will be lost!
*****************************************************************************/

#include "../../ImagerGUI/okworker.h"
#include <QtCore/qbytearray.h>
#include <QtCore/qmetatype.h>
#if !defined(Q_MOC_OUTPUT_REVISION)
#error "The header file 'okworker.h' doesn't include <QObject>."
#elif Q_MOC_OUTPUT_REVISION != 67
#error "This file was generated using the moc from 5.9.0. It"
#error "cannot be used with the include files from this version of Qt."
#error "(The moc has changed too much.)"
#endif

QT_BEGIN_MOC_NAMESPACE
QT_WARNING_PUSH
QT_WARNING_DISABLE_DEPRECATED
struct qt_meta_stringdata_okWorker_t {
    QByteArrayData data[14];
    char stringdata0[116];
};
#define QT_MOC_LITERAL(idx, ofs, len) \
    Q_STATIC_BYTE_ARRAY_DATA_HEADER_INITIALIZER_WITH_OFFSET(len, \
    qptrdiff(offsetof(qt_meta_stringdata_okWorker_t, stringdata0) + ofs \
        - idx * sizeof(QByteArrayData)) \
    )
static const qt_meta_stringdata_okWorker_t qt_meta_stringdata_okWorker = {
    {
QT_MOC_LITERAL(0, 0, 8), // "okWorker"
QT_MOC_LITERAL(1, 9, 12), // "okLoadFailed"
QT_MOC_LITERAL(2, 22, 0), // ""
QT_MOC_LITERAL(3, 23, 11), // "debugSignal"
QT_MOC_LITERAL(4, 35, 4), // "data"
QT_MOC_LITERAL(5, 40, 10), // "showImages"
QT_MOC_LITERAL(6, 51, 3), // "exp"
QT_MOC_LITERAL(7, 55, 8), // "numMasks"
QT_MOC_LITERAL(8, 64, 9), // "maskChngs"
QT_MOC_LITERAL(9, 74, 7), // "subcPer"
QT_MOC_LITERAL(10, 82, 11), // "bitFileName"
QT_MOC_LITERAL(11, 94, 4), // "stop"
QT_MOC_LITERAL(12, 99, 11), // "loadPattern"
QT_MOC_LITERAL(13, 111, 4) // "path"

    },
    "okWorker\0okLoadFailed\0\0debugSignal\0"
    "data\0showImages\0exp\0numMasks\0maskChngs\0"
    "subcPer\0bitFileName\0stop\0loadPattern\0"
    "path"
};
#undef QT_MOC_LITERAL

static const uint qt_meta_data_okWorker[] = {

 // content:
       7,       // revision
       0,       // classname
       0,    0, // classinfo
       5,   14, // methods
       0,    0, // properties
       0,    0, // enums/sets
       0,    0, // constructors
       0,       // flags
       2,       // signalCount

 // signals: name, argc, parameters, tag, flags
       1,    0,   39,    2, 0x06 /* Public */,
       3,    1,   40,    2, 0x06 /* Public */,

 // slots: name, argc, parameters, tag, flags
       5,    5,   43,    2, 0x0a /* Public */,
      11,    0,   54,    2, 0x0a /* Public */,
      12,    1,   55,    2, 0x0a /* Public */,

 // signals: parameters
    QMetaType::Void,
    QMetaType::Void, QMetaType::VoidStar,    4,

 // slots: parameters
    QMetaType::Void, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::Int, QMetaType::QString,    6,    7,    8,    9,   10,
    QMetaType::Void,
    QMetaType::Void, QMetaType::QString,   13,

       0        // eod
};

void okWorker::qt_static_metacall(QObject *_o, QMetaObject::Call _c, int _id, void **_a)
{
    if (_c == QMetaObject::InvokeMetaMethod) {
        okWorker *_t = static_cast<okWorker *>(_o);
        Q_UNUSED(_t)
        switch (_id) {
        case 0: _t->okLoadFailed(); break;
        case 1: _t->debugSignal((*reinterpret_cast< void*(*)>(_a[1]))); break;
        case 2: _t->showImages((*reinterpret_cast< int(*)>(_a[1])),(*reinterpret_cast< int(*)>(_a[2])),(*reinterpret_cast< int(*)>(_a[3])),(*reinterpret_cast< int(*)>(_a[4])),(*reinterpret_cast< QString(*)>(_a[5]))); break;
        case 3: _t->stop(); break;
        case 4: _t->loadPattern((*reinterpret_cast< QString(*)>(_a[1]))); break;
        default: ;
        }
    } else if (_c == QMetaObject::IndexOfMethod) {
        int *result = reinterpret_cast<int *>(_a[0]);
        void **func = reinterpret_cast<void **>(_a[1]);
        {
            typedef void (okWorker::*_t)();
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&okWorker::okLoadFailed)) {
                *result = 0;
                return;
            }
        }
        {
            typedef void (okWorker::*_t)(void * );
            if (*reinterpret_cast<_t *>(func) == static_cast<_t>(&okWorker::debugSignal)) {
                *result = 1;
                return;
            }
        }
    }
}

const QMetaObject okWorker::staticMetaObject = {
    { &QObject::staticMetaObject, qt_meta_stringdata_okWorker.data,
      qt_meta_data_okWorker,  qt_static_metacall, nullptr, nullptr}
};


const QMetaObject *okWorker::metaObject() const
{
    return QObject::d_ptr->metaObject ? QObject::d_ptr->dynamicMetaObject() : &staticMetaObject;
}

void *okWorker::qt_metacast(const char *_clname)
{
    if (!_clname) return nullptr;
    if (!strcmp(_clname, qt_meta_stringdata_okWorker.stringdata0))
        return static_cast<void*>(const_cast< okWorker*>(this));
    return QObject::qt_metacast(_clname);
}

int okWorker::qt_metacall(QMetaObject::Call _c, int _id, void **_a)
{
    _id = QObject::qt_metacall(_c, _id, _a);
    if (_id < 0)
        return _id;
    if (_c == QMetaObject::InvokeMetaMethod) {
        if (_id < 5)
            qt_static_metacall(this, _c, _id, _a);
        _id -= 5;
    } else if (_c == QMetaObject::RegisterMethodArgumentMetaType) {
        if (_id < 5)
            *reinterpret_cast<int*>(_a[0]) = -1;
        _id -= 5;
    }
    return _id;
}

// SIGNAL 0
void okWorker::okLoadFailed()
{
    QMetaObject::activate(this, &staticMetaObject, 0, nullptr);
}

// SIGNAL 1
void okWorker::debugSignal(void * _t1)
{
    void *_a[] = { nullptr, const_cast<void*>(reinterpret_cast<const void*>(&_t1)) };
    QMetaObject::activate(this, &staticMetaObject, 1, _a);
}
QT_WARNING_POP
QT_END_MOC_NAMESPACE
