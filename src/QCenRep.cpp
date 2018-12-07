#include "QCenRep.h"

#include <centralrepository.h>


TInt QCenRep::reset(const QString &repo) noexcept
{
    TInt err;
    CRepository* iRepository = NULL;
    static const TUid repository = TUid::Uid(repo.toUInt(0,16));
    TRAP(err, iRepository = CRepository::NewL(repository));
    if(!err)
    {
        err = iRepository->Reset();
    }
    delete iRepository;
    return err;
}

TInt QCenRep::reset(const QString &repo, const QString &key) noexcept
{
    TInt err;
    CRepository* iRepository = NULL;
    static const TUid repository = TUid::Uid(repo.toUInt(0,16));
    TRAP(err, iRepository = CRepository::NewL(repository));
    if(!err)
    {
        err = iRepository->Reset(key.toUInt(0,16));
    }
    delete iRepository;
    return err;
}

TInt QCenRep::ChangeValStr(const TUid &KUidRepository, const TUint32 &key, const QString &newkeyvalue) noexcept
{
    TInt err;
    TBuf<254> tbuf(newkeyvalue.utf16());
    CRepository* iRepository = NULL;
    TRAP(err, iRepository = CRepository::NewL(KUidRepository));
    if(!err)
    {
        err = iRepository->Set(key, tbuf);
    }
    delete iRepository;
    return err;
}

TInt QCenRep::ReadValStr(const TUid &KUidRepository, const TUint32 &key, QString* retval) noexcept
{
    TInt err = 0;
    TBuf<254> val;
    CRepository* iRepository = NULL;
    TRAP(err, iRepository = CRepository::NewL(KUidRepository));
    if(!err)
    {
        err = iRepository->Get(key, val);
    }
    delete iRepository;
    retval->insert(0, (QChar*) val.Ptr(),val.Length());
    return err;
}

TInt QCenRep::ChangeValInt(const TUid &KUidRepository, const TUint32 &key, const TInt &newkeyvalue) noexcept
{
    TInt err;
    CRepository* iRepository = NULL;
    TRAP(err, iRepository = CRepository::NewL(KUidRepository));
    if(!err)
    {
        err = iRepository->Set(key, newkeyvalue);
    }
    delete iRepository;
    return err;
}

TInt QCenRep::ReadValInt(const TUid &KUidRepository, const TUint32 &key) noexcept
{
    TInt err;
    TInt val;
    CRepository* iRepository = NULL;
    TRAP(err, iRepository = CRepository::NewL(KUidRepository));
    if(!err)
    {
        err = iRepository->Get(key, val);
    }
    delete iRepository;
    return val;
}
