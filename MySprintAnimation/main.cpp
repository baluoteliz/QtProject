#include <QCoreApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QmlCpp.h>
#include <QQuickView>

int main(int argc, char *argv[])
{
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QCoreApplication a(argc, argv);

#if 0
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/mysprint.qml")));
#else
    QQuickView view;
    view.setResizeMode(QQuickView::SizeRootObjectToView);
    view.setSource(QUrl("qrc:/mysprint.qml"));
    view.show();

#endif

    return a.exec();
}
