#ifndef DELIGHT_H
#define DELIGHT_H

#include <QString>
#include <QObject>
#include <QVariant>

class Delight : public QObject
{
    Q_OBJECT

public:

    Q_INVOKABLE static void resolver(const QString &f) noexcept;

    Q_INVOKABLE static void caption(const QString &file) noexcept;

    Q_INVOKABLE static void manual() noexcept;

    Q_INVOKABLE static void cache() noexcept;

    Q_INVOKABLE static void b(const QString &a) noexcept;

    Q_INVOKABLE static void run(const int &i) noexcept;

    Q_INVOKABLE static QString getFMTX() noexcept;

    Q_INVOKABLE static void setFMTX(const QString &f) noexcept;

    Q_INVOKABLE static void setInt(const QString &iString, const int &j) noexcept;

    Q_INVOKABLE static void setInt(const QString &iStr, const QString &iString, const int &j) noexcept;

    Q_INVOKABLE static int getInt(const QString &iString) noexcept;

    Q_INVOKABLE static int getInt(const QString &qUID, const QString &qKey) noexcept;

    Q_INVOKABLE static bool reset(const QString &sRepo) noexcept;

    Q_INVOKABLE static bool reset(const QString &sRepo, const QString &qKey) noexcept;

    Q_INVOKABLE static void success() noexcept;

    Q_INVOKABLE static void keyboard() noexcept;

    Q_INVOKABLE static void cp(const QString &source, const QString &target) noexcept;

    Q_INVOKABLE static void anim(const QString &file, const QString &suffix) noexcept;

    Q_INVOKABLE static void kill(const int &UID) noexcept;

    Q_INVOKABLE static QString getiso() noexcept;

    Q_INVOKABLE static void setiso() noexcept;

    Q_INVOKABLE static bool isFP2() noexcept;

    Q_INVOKABLE static void setCamCounter(const int &value) noexcept;

    Q_INVOKABLE static int getCamCounter() noexcept;

    Q_INVOKABLE static QVariant getAutostart() noexcept;

    Q_INVOKABLE static QVariant getInactiveAutostart(const QVariant &active) noexcept;

    Q_INVOKABLE static void disableAutostart(const QString &value) noexcept;

    Q_INVOKABLE static void enableAutostart(const QString &value) noexcept;

    Q_INVOKABLE static void removeAutostart(QString value) noexcept;

    Q_INVOKABLE static bool addAutostart(const QString &value, const bool &foreground/* = true*/) noexcept;

    Q_INVOKABLE static void createAutostartBackup() noexcept;

    Q_INVOKABLE static bool restoreAutostartBackup() noexcept;

    Q_INVOKABLE static void removeDisabledAutostart(const QString &value) noexcept;

    Q_INVOKABLE static void disableChatIcon() noexcept;

    Q_INVOKABLE static bool calcNewHash(const QString &value) noexcept;

    Q_INVOKABLE static bool is808() noexcept;

    Q_INVOKABLE static void execute(const QString &myMiniCMDString) noexcept;

    Q_INVOKABLE static QVariant getMusicLibrary() noexcept;

    Q_INVOKABLE static bool addMusicLibrary() noexcept;

    Q_INVOKABLE static bool removeMusicLibrary(const QString &value) noexcept;

    Q_INVOKABLE static QString getStartupReason() noexcept;

    Q_INVOKABLE static QString getContest() noexcept;

    Q_INVOKABLE static void setContest(const QString &value) noexcept;

private:

    static const QString DelightTXT;

    //static const char* DelightTXT;

    static void showError(const QString &value) noexcept;

    static TBool del() noexcept;

    static void CRep4All() noexcept;

    static void error() noexcept;

};

#endif // DELIGHT_H
