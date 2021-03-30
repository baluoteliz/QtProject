#include <QGuiApplication>
#include <QApplication>
#include <QQmlApplicationEngine>
#include <QFile>
#include <QTextStream>
#include <QDebug>
#include <QQuickView>
#include <QAbstractListModel>
#include <QQmlContext>
#include "CommonListModel.h"

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);

#if 0
    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/quicktest1.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);
    return app.exec();
#else
    QApplication app(argc,argv);

    QQuickView* view = new QQuickView;
    view->setSource(QUrl("qrc:/myJsConsole.qml"));
    view->setResizeMode(QQuickView::SizeRootObjectToView);
    view->show();
    CommonListModel* listModel = new CommonListModel(view);
    view->rootContext()->setContextProperty("testListmodel",listModel);
    view->setWidth(600);
    view->setHeight(400);
    return app.exec();

    //test 11
    //test22
#endif
}
