#ifndef MYFILEWATCHER_H
#define MYFILEWATCHER_H

#include <QFileSystemWatcher>

class MyFileWatcher : public QFileSystemWatcher
{
    Q_OBJECT

public:
    Q_INVOKABLE void addPathFromQtQuick() noexcept;
};

#endif // MYFILEWATCHER_H
