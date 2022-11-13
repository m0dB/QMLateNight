#include <QGuiApplication>
#include <QPainter>
#include <QQmlApplicationEngine>
#include <QQuickImageProvider>
#include <QQuickStyle>
#include <QResource>
#include <QSvgRenderer>
#include <QFontDatabase>
#include <QScreen>
#include <QQmlComponent>
#include <QQmlContext>
#include "librarytablemodel.h"
#include <QDebug>

// image provider that allows to search/replace colors in the svg file before rendering it
class SvgModifierImageProvider : public QQuickImageProvider {
  public:
    SvgModifierImageProvider()
            : QQuickImageProvider(QQuickImageProvider::Pixmap) {
    }

    QPixmap requestPixmap(const QString& rid, QSize* size, const QSize& requestedSize) override {
        const QStringList list = rid.split("?");
        const QString resourceId(list.length() > 0 ? list[0] : QString());
        const QStringList mods(list.length() > 1 ? list[1].split("+") : QStringList());
        QResource resource(resourceId);
        QByteArray data = resource.uncompressedData();

        for (const auto mod : mods) {
            QStringList ab = mod.split("/");
            if (ab.length() == 2) {
                data.replace(ab[0].toLatin1(), ab[1].toLatin1());
            }
        }

        QSvgRenderer renderer(data);
        
        // TODO is this the right way?
        const auto devicePixelRatio = QGuiApplication::primaryScreen()->devicePixelRatio();

        int width = renderer.defaultSize().width() * devicePixelRatio;
        int height = renderer.defaultSize().height() * devicePixelRatio;

        if (size)
            *size = QSize(width, height);
        QPixmap pixmap(requestedSize.width() * devicePixelRatio > 0 ? requestedSize.width() * devicePixelRatio : width,
                requestedSize.height() * devicePixelRatio > 0 ? requestedSize.height() * devicePixelRatio : height);

        pixmap.fill(QColor("transparent"));
        QPainter painter(&pixmap);
        renderer.render(&painter, pixmap.rect());

        pixmap.setDevicePixelRatio(devicePixelRatio);

        return pixmap;
    }
};

int main(int argc, char* argv[]) {
    QGuiApplication app(argc, argv);

    QFontDatabase::addApplicationFont(":/example.mixxx.org/imports/Application/assets/fonts/OpenSans-Bold.ttf");
    QFontDatabase::addApplicationFont(":/example.mixxx.org/imports/Application/assets/fonts/OpenSans-Regular.ttf");
    QFontDatabase::addApplicationFont(":/example.mixxx.org/imports/Application/assets/fonts/OpenSans-Semibold.ttf");

    QQmlApplicationEngine engine;
    QQmlComponent colorsComponent(&engine, QUrl("qrc:/example.mixxx.org/imports/Application/ColorSchemeDefault.qml"));
    //QQmlComponent colorsComponent(&engine, QUrl("qrc:/example.mixxx.org/imports/Application/ColorSchemeBright.qml"));

    qmlRegisterSingletonInstance("skin.mixxx.org", 1, 0, "ColorScheme", colorsComponent.create());

    QSqlDatabase db = QSqlDatabase::addDatabase("QSQLITE");
    db.setDatabaseName("/Users/maarten/mixxxdb.sqlite");
    db.open();
    LibraryTableModel libraryTableModel(Q_NULLPTR, db); 
    qDebug() << libraryTableModel.rowCount();
    qDebug() << libraryTableModel.columnCount();
    qDebug() << libraryTableModel.roleNames();
    engine.rootContext()->setContextProperty("libraryTableModel", &libraryTableModel);
    engine.addImportPath(":/example.mixxx.org/imports");
    engine.addImageProvider(QString("svgmodifier"), new SvgModifierImageProvider);
    
    QQuickStyle::setStyle("LateNight");

    engine.load(QUrl("qrc:/example.mixxx.org/imports/Application/main.qml"));

    return app.exec();
}

