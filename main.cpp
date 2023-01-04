#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QObject>
#include <QQmlContext>
#include <QFontDatabase>
#include <QSettings>
#include <QTranslator>
#include <QQuickView>
#include <QQmlEngine>
#include <QAbstractItemModel>
#include "counter.h"
/*



    Person person = Person{};



    //qRegisterMetaType<QVector<unsigned int>>();
    qmlRegisterType<ContactList>("ContactList", 1, 0, "ContactList");
    qmlRegisterType<Person>("Person", 1, 0, "Person");
    engine.rootContext()->setContextProperty(QStringLiteral("contact"), &contact );
    engine.rootContext()->setContextProperty(QStringLiteral("person"), &person );

*/

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);
    QQmlApplicationEngine engine;
    Counter main_counter;
    qmlRegisterType<Counter>("Counter", 1, 0, "Counter");
    engine.rootContext()->setContextProperty(QStringLiteral("main_counter"), &main_counter );
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);



    return app.exec();
}
