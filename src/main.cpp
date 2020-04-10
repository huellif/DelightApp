#include <QtGui/QApplication>
#include <QtDeclarative/QDeclarativeView>
#include <QtDeclarative/QDeclarativeEngine>
#include <QDeclarativeContext>

#include <QtGui/QSplashScreen>
#include <QtGui/QPixmap>

#include "MyFileWatcher.h"
#include <QDir>

#include <QtCore/QTranslator>
#include <QtCore/QLocale>
#include <QtCore/QFile>

#include "delight.h"

#include <QDebug>
#include <QCenRep.h>

LOCAL_C TAny createAppFolder() noexcept {
    QString backupFolder = "E:\\system\\Apps\\huellifSoft\\AutostartManager\\";
    QDir dir(backupFolder);
    if (!dir.exists()){
      dir.mkpath(backupFolder);
      QFile file(backupFolder+"disabled.txt");
      if(!file.exists() && file.open(QIODevice::ReadWrite));
    }
}

int main(int argc, char *argv[]) noexcept {
    QApplication app(argc, argv);
    QSplashScreen *splash = new QSplashScreen(QPixmap(":/splash.jpg"));
    splash->show();

    const QString lang = QLocale::system().name().left(2);

    Delight helper;

    if (lang == QLatin1String("en")) {
        splash->showMessage("Loading ...", Qt::AlignHCenter | Qt::AlignBottom, Qt::white);
    } else {
        if (QFile::exists("Z:/resource/qt/translations/DelightApp_" + lang + ".qm")) {
            QTranslator translator;
            translator.load("DelightApp_" + lang, "Z:/resource/qt/translations");
            app.installTranslator(&translator);
            splash->showMessage(QSplashScreen::tr("Loading ..."), Qt::AlignHCenter | Qt::AlignBottom, Qt::white);
        } else {
            splash->showMessage("Error\nthere's no translation for" + lang, Qt::AlignHCenter | Qt::AlignBottom, Qt::white);
        }
    }

    QDeclarativeView viewer(QUrl("qrc:/qml/main.qml"));

    createAppFolder();

    MyFileWatcher watcher;
    watcher.addPath("E:\\system\\Apps\\huellifSoft\\AutostartManager\\disabled.txt");
    watcher.addPath("C:\\private\\100012a5\\DBS_2000836D_DBS_DSC.db");

    viewer.rootContext()->setContextProperty("watcher", &watcher);
    viewer.rootContext()->setContextProperty("Helper", &helper);
    viewer.setAttribute(Qt::WA_OpaquePaintEvent);
    viewer.setAttribute(Qt::WA_NoSystemBackground);
    viewer.viewport()->setAttribute(Qt::WA_OpaquePaintEvent);
    viewer.viewport()->setAttribute(Qt::WA_NoSystemBackground);
    viewer.setContextMenuPolicy(Qt::NoContextMenu);
    viewer.showFullScreen();

    delete splash;

    return app.exec();
}
