#ifndef QCenRep_H
#define QCenRep_H

#include <QString>

class QCenRep
{

public:

    static TInt reset(const QString &repo) noexcept;
    static TInt reset(const QString &repo, const QString &key) noexcept;
    static TInt ChangeValStr(const TUid &KUidRepository, const TUint32 &key, const QString &newkeyvalue) noexcept;
    static TInt ReadValStr(const TUid &KUidRepository, const TUint32 &key, QString* retval) noexcept;
    static TInt ChangeValInt(const TUid &KUidRepository, const TUint32 &key, const TInt &newkeyvalue) noexcept;
    static TInt ReadValInt(const TUid &KUidRepository, const TUint32 &key) noexcept;
};

#endif // QCenRep_H
