#ifndef QMLCPP_H
#define QMLCPP_H

#include <QObject>

class Qmlcpp : public QObject
{
    Q_OBJECT
public:
    explicit Qmlcpp(QObject *parent = nullptr);

signals:

};

#endif // QMLCPP_H
