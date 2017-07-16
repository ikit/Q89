#include <QGuiApplication>
#include <QQmlContext>
#include <QQmlApplicationEngine>
#include <QDir>
#include "tools.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    Tools tools;
    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("tools",&tools);
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();
}
