#include "Delight.h"

#include <bautils.h>
#include <AknGlobalNote.h>
#include <AknGlobalMsgQuery.h>
#include <akniconconfig.h>
#include <apgcli.h>
#include <coemain.h>
#include <apgtask.h>
#include <akndiscreetpopup.h>
#include <dscstore.h>
#include <dscitem.h>
#include <akngloballistquery.h>
#include <badesca.h>
#include <coreapplicationuisdomainpskeys.h>
#include <e32property.h>
#include <aknquerydialog.h>
#include <HAL.h>
#include <hal_data.h>
#include <startupreason.h>
#include <startupdomainpskeys.h>

#include <QFileDialog>
#include <QFile>
#include <QTextStream>
#include <QFile>
#include <QDateTime>
#include <QStringList.h>
#include <QList>

#include <QCryptographicHash>

#include "QCenRep.h"

#include <QDebug>

const QString Delight::DelightTXT = "C:\\data\\delight.txt";

//const char *Delight::DelightTXT = "C:\\data\\delight.txt";

void createAppFolder() noexcept {
    QString backupFolder = "E:\\system\\Apps\\huellifSoft\\AutostartManager\\";
    QDir dir(backupFolder);
    if (!dir.exists()){
      dir.mkpath(backupFolder);
    }
}

TBool Delight::del() noexcept {
    TBool ok = ETrue;
    _LIT(path, "C:\\data\\Delight.txt");
    RFs fsSession;
    CleanupClosePushL(fsSession);
    if(fsSession.Connect() != KErrNone)
        return EFalse;
    if (BaflUtils::FileExists(fsSession, path)){
        fsSession.SetAtt(path, KEntryAttNormal, KEntryAttReadOnly | KEntryAttSystem | KEntryAttHidden);
        fsSession.Delete(path);
    }
    if (BaflUtils::FileExists(fsSession, _L("E:\\data\\Delight.txt"))){
        CAknGlobalMsgQuery * pDlg = CAknGlobalMsgQuery::NewL();
        CleanupStack::PushL(pDlg);
        TRequestStatus iStatus;
        pDlg->ShowMsgQueryL(iStatus ,
                            TPtrC16 (reinterpret_cast<const TText*>(QObject::tr("There is a program in Delight's reboot scheduler. You have to reboot your device before you will be able to run other functions.\nDo you want to reboot now?").constData())),
                            0x8cc0024,
                            TPtrC16 (reinterpret_cast<const TText*>(QObject::tr("Error!").constData())),
                            KNullDesC,
                            0,
                            -1,
                            CAknQueryDialog::ENoTone);
        User::WaitForRequest(iStatus);
        CleanupStack::PopAndDestroy(pDlg);
        if (iStatus.Int() == EAknSoftkeyYes) {
            run(4);
        }
        ok = EFalse;
    }
    CleanupStack::PopAndDestroy(&fsSession);
    return ok;
}

void Delight::execute(const QString &myMiniCMDString) noexcept {
    QFile file(DelightTXT);
    if(!file.open(QIODevice::WriteOnly | QIODevice::Text))
        return;
    QTextStream out(&file);
    out.setCodec("UTF-16");
    out << "delete " << DelightTXT << '\n' << myMiniCMDString;
    file.close();
    run(0);
}

QString Delight::getStartupReason() noexcept {
    TInt value;
    TInt errorCode = RProperty::Get( KPSUidStartup, KPSStartupReason, value );

    if (errorCode != KErrNone) {
        return "Error: " + errorCode;
    }

    switch (value) {
        case ENormalStartup:
            return "ENormalStartup";

        case ELanguageSwitchReset:
            return "ELanguageSwitchReset";

        case ENormalRFSReset:
            return "ENormalRFSReset";

        case EDeepRFSReset:
            return "EDeepRFSReset";

        case EFirmwareUpdate:
            return "EFirmwareUpdate";

        case EUnknownReset:
            return "EUnknownReset";

        case EOperatorSettingReset:
            return "EOperatorSettingReset";

        case ENetworkModeChangeReset:
            return "ENetworkModeChangeReset";

        case ESIMStatusChangeReset:
            return "ESIMStatusChangeReset";

        case EDataRestoreReset:
            return "EDataRestoreReset";

        case EFieldTestReset:
            return "EFieldTestReset";

        default:
            return "Unknown startup reason " + value;
    }
}

void Delight::CRep4All() noexcept {
    showError(QObject::tr("You have to enable CRepository4all in ROMPatcher."));
}

void Delight::error() noexcept {
    CAknGlobalNote* note = CAknGlobalNote::NewLC();
    TRequestStatus iStatus;
    note->ShowNoteL(iStatus,
                    EAknGlobalConfirmationNote,
                    TPtrC16 (reinterpret_cast<const TText*>(QObject::tr("Error!").constData()))
                    );
    User::WaitForRequest(iStatus);
    CleanupStack::PopAndDestroy(note);
}

void Delight::resolver(const QString &f) noexcept {
    if (del()) {
        if(QFile::copy(":/cmd/" + f, DelightTXT)){
            run(0);
        }
    }
}

void Delight::run(const int &i) noexcept {
    RProcess proc;
    if(proc.Create([&i]() -> TPtrC16 {
               switch (i)
               {
               case 0:
                   return _L("Z:\\sys\\bin\\Delight.exe");
               case 1:
                   return _L("Z:\\sys\\bin\\MiniCMD2.exe");
               case 2:
                   return _L("Z:\\sys\\bin\\BackCMD.exe");
               case 3:
                   return _L("Z:\\sys\\bin\\RestCMD.exe");
               default://4
                   return _L("Z:\\sys\\bin\\Restart.exe");
               }
           }(), KNullDesC) == KErrNone) {
        proc.Resume();
        proc.Close();
    }
}

QString Delight::getFMTX() noexcept {
    RFs fsSession;
    CleanupClosePushL(fsSession);
    if(fsSession.Connect() != KErrNone)
        return QString("missingFMTX!");
    if (!BaflUtils::FileExists(fsSession, _L("Z:\\sys\\bin\\fmtxapp.exe"))){
        CleanupStack::PopAndDestroy(&fsSession);
        return QString("missingFMTX!");
    }
    CleanupStack::PopAndDestroy(&fsSession);
    QString val;
    QCenRep::ReadValStr(TUid::Uid(0x20008EA6), 0x10, &val);
    return val;
}

void Delight::setFMTX(const QString &f) noexcept {
    if (QCenRep::ChangeValStr(TUid::Uid(0x20008EA6), 0x10, f) == -46) {
        CRep4All();
        return;
    }
    CAknGlobalMsgQuery * pDlg = CAknGlobalMsgQuery::NewL();
    CleanupStack::PushL(pDlg);
    TRequestStatus iStatus;
    pDlg->ShowMsgQueryL(iStatus,
                        TPtrC16(reinterpret_cast<const TText*>(QString(QObject::tr("The new FM transmitter RDS text is ") + "\"" + f + "\". " + QObject::tr("You have to reboot your device to apply it.\nDo you want to reboot now?")).constData())),
                        0x8cc0024,
                        TPtrC16(reinterpret_cast<const TText*>(QObject::tr("Success!").constData())),
                        KNullDesC,
                        0,
                        -1,
                        CAknQueryDialog::ENoTone);
    User::WaitForRequest(iStatus);
    CleanupStack::PopAndDestroy(pDlg);
    if (iStatus.Int() == EAknSoftkeyYes) {
        run(4);
    }
}

void Delight::setInt(const QString &iString, const int &j) noexcept {
    QCenRep::ChangeValInt(TUid::Uid(0x20021192), iString.toUInt(0,16), j);
}

void Delight::setInt(const QString &iStr, const QString &iString, const int &j) noexcept {
    QCenRep::ChangeValInt(TUid::Uid(iStr.toUInt(0,16)), iString.toUInt(0,16), j);
}

int Delight::getInt(const QString &iString) noexcept {
    return QCenRep::ReadValInt(TUid::Uid(0x20021192), iString.toInt(0, 16));
}

int Delight::getInt(const QString &qUID, const QString &qKey) noexcept {
    return QCenRep::ReadValInt(TUid::Uid(qUID.toInt(0, 16)), qKey.toInt(0, 16));
}

bool Delight::reset(const QString &sRepo) noexcept {
    if(QCenRep::reset(sRepo) == -46){
        CRep4All();
        return false;
    }
    return true;
}

bool Delight::reset(const QString &sRepo, const QString &qKey) noexcept {
    if(QCenRep::reset(sRepo, qKey) == -46){
        CRep4All();
        return false;
    }
    return true;
}

void Delight::success() noexcept {
    CAknGlobalNote* note = CAknGlobalNote::NewLC();
    TRequestStatus iStatus;
    note->ShowNoteL(iStatus,
                    EAknGlobalConfirmationNote,
                    TPtrC16 (reinterpret_cast<const TText*>(QObject::tr("Success!").constData()))
                    );
    User::WaitForRequest(iStatus);
    CleanupStack::PopAndDestroy(note);
}

void Delight::keyboard() noexcept {
    if(del()) {
        const QString result = QFileDialog::getOpenFileName(0, "Choose your qmltouchinput.dll file", "", "qmltouchinput.dll").replace("/","\\");
        if (!result.isEmpty()) {
            execute(QString("note \"Wait...\"\nrun peninputserver.exe\nkill peninputserver.exe\nkill 0x10281855\natt -r -h -s C:\\sys\\bin\\qmltouchinput.dll\ndelete C:\\sys\\bin\\qmltouchinput.dll\ncopy -o -r \""+ result + "\" C:\\sys\\bin\\qmltouchinput.dll\nnote \"Rebooting...\"\nrun Restart.exe"));
        }
    }
}

void Delight::cp(const QString &source, const QString &target) noexcept {
    if(QFile::exists(target)) {
        QFile::remove(target);
    }
    QFile::copy(source, target);
}

void Delight::anim(const QString &file, const QString &suffix) noexcept {
    if(del()) {
        const QString fname("C:\\data\\animations\\"+file+suffix);
        if(QFile::exists(fname)) {
            CAknGlobalMsgQuery * pDlg = CAknGlobalMsgQuery::NewL();
            CleanupStack::PushL(pDlg);
            TRequestStatus iStatus;
            pDlg->ShowMsgQueryL(iStatus ,
                                TPtrC16 (reinterpret_cast<const TText*>(QString(QObject::tr("Do you want to open the current ")+file+suffix+"?").constData())),
                                0x8cc0024,
                                TPtrC16 (reinterpret_cast<const TText*>(QObject::tr("Preview").constData())),
                                KNullDesC,
                                0,
                                -1,
                                CAknQueryDialog::ENoTone);
            User::WaitForRequest(iStatus);
            CleanupStack::PopAndDestroy(pDlg);
            if (iStatus.Int() == EAknSoftkeyYes) {
                caption(fname);
            }
        }
        const QString result = QFileDialog::getOpenFileName(0, "Choose your "+file+suffix, "", "*"+suffix).replace("/","\\");
        if (!result.isEmpty()) {
            execute(QString("copy -o -r \"" + result + " " + fname + "\"\nnote \"Done!\""));
        }
    }
}

void Delight::kill(const int &UID) noexcept {
    //const QString qprocess = QString("*["%QString::number(UID, 16)%"]*");
    TFullName res;
    TFindProcess find(TPtrC16(reinterpret_cast<const TText*>(/*qprocess*/QString("*["%QString::number(UID, 16)%"]*").constData())));
    while(find.Next(res) == KErrNone) {
        RProcess ph;
        if(ph.Open(find) != KErrNone) {
            return;
        }
        ph.Kill(0);
        ph.Close();
    }
}

QString Delight::getiso() noexcept {
    QString val;
    QCenRep::ReadValStr(TUid::Uid(0x2000fda8), 0x1, &val);
    return val;
}

void Delight::setiso() noexcept {
    const QString result = QFileDialog::getOpenFileName(0, "Select an .iso file", "", "*.iso").replace("/","\\");
    if(result.isEmpty()) {
        return;
    }
    if(QCenRep::ChangeValStr(TUid::Uid(0x2000fda8), 0x1, result) == -46) {
        CRep4All();
        return;
    }
    success();
}

QString Delight::getContest() noexcept {
    QString val;
    QCenRep::ReadValStr(TUid::Uid(0x10282EC7), 0x1, &val);
    return val;
}

void Delight::setContest(const QString &value) noexcept {
    if(QCenRep::ChangeValStr(TUid::Uid(0x10282EC7), 0x1, value) == -46) {
        CRep4All();
        return;
    }
    success();
}

QString Delight::getChangeUserAgent() noexcept {
    QString val;
    QCenRep::ReadValStr(TUid::Uid(0x101F8731), 0x1, &val);
    return val;
}

void Delight::setChangeUserAgent(const QString &value) noexcept {
    if(QCenRep::ChangeValStr(TUid::Uid(0x101F8731), 0x1, value) == -46) {
        CRep4All();
        return;
    }
    success();
}

bool Delight::isFP2() noexcept {
    static bool fp2 = QFile::exists("Z:\\system\\install\\Series60v5.5.sis");
    return fp2;
}

void Delight::setCamCounter(const int &value) noexcept {
    kill(0x101f857A);
//    if(isFP2()) {
//        QCenRep::ChangeValInt(TUid::Uid(0x20027017), 0x3, value);
//    }
//    else {
//        QCenRep::ChangeValInt(TUid::Uid(0x101FFA86), 0x9, value);
//    }

    bool fp2 = isFP2();
    QCenRep::ChangeValInt(TUid::Uid(fp2 ? 0x20027017 : 0x101FFA86), fp2 ? 0x3: 0x9, value);
    success();
}

int Delight::getCamCounter() noexcept {
//    if(isFP2())
//        return QCenRep::ReadValInt(TUid::Uid(0x20027017), 0x3);
//    return QCenRep::ReadValInt(TUid::Uid(0x101FFA86), 0x9);

    bool fp2 = isFP2();
    return QCenRep::ReadValInt(TUid::Uid(fp2 ? 0x20027017 : 0x101FFA86), fp2 ? 0x3: 0x9);
}

QVariant Delight::getAutostart() noexcept {
    QStringList local;

    TRAPD(i,
        RDscStore iDsc;
        iDsc.OpenL();

        CleanupClosePushL(iDsc);

        iDsc.EnumOpenLC();

    //    QFile file("C:\\DelightApp_Log.txt");
    //    file.open(QIODevice::WriteOnly | QIODevice::Text);
    //    QTextStream out(&file);
    //    out.setCodec("UTF-8");


        while(true) {

            CDscItem* dscItem = iDsc.EnumReadNextL();
            if (!dscItem)
                break;

            //out << "ID: " << dscItem->DscId().iUid << " " << QString::fromUtf16(dscItem->FileName().Ptr(), dscItem->FileName().Length()) << " start in background: " << dscItem->StartInBackground() << "\n";

            local.append(QString::fromUtf16(dscItem->FileName().Ptr(), dscItem->FileName().Length()));

            delete dscItem;
        }

        //file.close();

        CleanupStack::PopAndDestroy();
        CleanupStack::PopAndDestroy();
    );
    Q_UNUSED(i);
//    if(i == -14) {
//        return getAutostart();
//    } else {
//        return QVariant::fromValue(local);
//    }
    return QVariant::fromValue(local);
}

QVariant Delight::getInactiveAutostart(const QVariant &active) noexcept {
    QFile myFile("E:\\system\\Apps\\huellifSoft\\AutostartManager\\disabled.txt");
    QStringList inactiveItems;
    if(myFile.open(QIODevice::ReadOnly)) {
        QString result = QString::fromAscii(myFile.readAll());
        myFile.close();
        inactiveItems = result.split("||");
        inactiveItems.removeLast();

        if(!result.isEmpty()) {
            QStringList activeItems = active.toStringList();//getAutostart().toStringList();

            QString newResult = result;
            if(!activeItems.isEmpty()) {
                foreach (const QString &a, inactiveItems) {
                    if(activeItems.contains(a, Qt::CaseInsensitive)) {
                        newResult.remove(QString(a+"||"), Qt::CaseInsensitive);
                    }
                }

                if(newResult.toUpper() != result.toUpper() && myFile.open(QIODevice::WriteOnly | QIODevice::Text)) {
                    myFile.resize(0);
                    myFile.seek(0);
                    QTextStream out(&myFile);
                    out << newResult;
                    myFile.close();
                    inactiveItems = newResult.split("||");
                    inactiveItems.removeLast();
                }
            }
        }
    }
    return QVariant::fromValue(inactiveItems);
}

void Delight::disableAutostart(const QString &value) noexcept {
    createAppFolder();
    QFile file("E:\\system\\Apps\\huellifSoft\\AutostartManager\\disabled.txt");
    if(!file.open(QIODevice::WriteOnly | QIODevice::Text | QIODevice::Append))
        return;
    QTextStream out(&file);
    out << value << "||";
    file.close();
    removeAutostart(value);
}

void Delight::enableAutostart(const QString &value) noexcept {
    QFile file("E:\\system\\Apps\\huellifSoft\\AutostartManager\\disabled.txt");
    if(!file.open(QIODevice::ReadWrite | QIODevice::Text)) return;
    QByteArray fileData;
    fileData = file.readAll();
    QString text(fileData);
    text.remove(value+"||");
    file.resize(0);
    file.seek(0);
    file.write(text.toUtf8());
    file.close();
    addAutostart(value, true);
}

void Delight::removeAutostart(QString value) noexcept {
    value = value.trimmed().toUpper();
    RDscStore iDsc;
    iDsc.OpenL();
    CleanupClosePushL(iDsc);
    iDsc.EnumOpenLC();
    while (true) {
        CDscItem* dscItem = iDsc.EnumReadNextL();
        if (!dscItem) {
            break;
        }
        if(value == QString::fromUtf16(dscItem->FileName().Ptr(), dscItem->FileName().Length()).trimmed().toUpper()) {
            CleanupStack::PopAndDestroy();
            iDsc.DeleteItemL(*dscItem);
            delete dscItem;
            CleanupStack::PopAndDestroy(&iDsc);
            return;
        }
        delete dscItem;
    }
    CleanupStack::PopAndDestroy();
    CleanupStack::PopAndDestroy(&iDsc);
}

bool Delight::addAutostart(const QString &value, const bool &foreground) noexcept {
    /*TPtrC symString = TPtrC (static_cast<const TUint16*>(value.utf16()), value.length());
    RProcess a;
    if(a.Create(symString, KNullDesC) != KErrNone) {

        a.Close();
        return;
    }
    /a.Close();*/

    if(getAutostart().toStringList().contains(value,Qt::CaseInsensitive)) {
        showError(QString(value + QObject::tr(" is already in autostart!")));
        return false;
    }


    if(!QFile::exists(value)) {
        if(!QFile::exists("C:\\sys\\bin\\"+value)) {
            if(!QFile::exists("E:\\sys\\bin\\"+value)) {
                if(!QFile::exists("F:\\sys\\bin\\"+value)) {
                    if(!QFile::exists("Z:\\sys\\bin\\"+value)) {
                        showError(QString(value + QObject::tr(" does not exist!")));
                        return false;
                    }
                }
            }
        }
    }

    RDscStore iDsc;
    CleanupClosePushL(iDsc);
    iDsc.OpenL();
    CDscItem* item = CDscItem::NewLC(TPtrC (static_cast<const TUint16*>(value.utf16()), value.length()), KNullDesC);
    item->SetStartMethodL(EFireAndForget);
    item->SetStartupTypeL(EStartProcess);
    item->SetStartInBackground(!foreground);
    TRAP_IGNORE(iDsc.AddItemL(*item););
    CleanupStack::PopAndDestroy(item);
    CleanupStack::PopAndDestroy();
    return true;
}

void Delight::createAutostartBackup() noexcept {
    createAppFolder();
    if(QFile::copy("C:\\private\\100012a5\\DBS_2000836D_DBS_DSC.db", "E:\\system\\Apps\\huellifSoft\\AutostartManager\\" + QDateTime::currentDateTime().toString("dd.MM.yyyy_hh.mm.ss") + ".db")) {
        success();
    }
}

bool Delight::restoreAutostartBackup() noexcept {
    bool result = false;
    QString backupFolder = "E:\\system\\Apps\\huellifSoft\\AutostartManager\\";
    QDir dir(backupFolder);
    QFileInfoList fileList = dir.entryInfoList(QStringList() << "*.db", QDir::Files);
    if(fileList.isEmpty()) {
        return false;
    }
    CDesCArray* array = new(ELeave) CDesCArrayFlat(3);
    CleanupStack::PushL(array);

    array->AppendL(TPtrC16 (reinterpret_cast<const TText*>(QObject::tr("Delete all backups").constData())));

//    for(int i = 0; i < fileList.size(); i++) {
//        array->AppendL(TPtrC16 (reinterpret_cast<const TText*>(fileList.at(i).completeBaseName().replace("_"," ").constData())));
//    }

    foreach(const QFileInfo &local, fileList) {
        array->AppendL(TPtrC16 (reinterpret_cast<const TText*>(local.completeBaseName().replace("_"," ").constData())));
    }

    CAknGlobalListQuery* query = CAknGlobalListQuery::NewLC();
    TRequestStatus status = KRequestPending;
    query->SetHeadingL(_L("Choose your backup"));
    query->ShowListQueryL(array, status);
    User::WaitForRequest(status);
    TInt ret = status.Int();

    if(ret == 0) {
        foreach(const QString &dirItem, QDir(backupFolder).entryList(QStringList() << "*.db", QDir::Files)) {
            dir.remove(dirItem);
        }
        success();
    }
    else if(ret > 0) {
        const char * dbFile = "C:\\private\\100012a5\\DBS_2000836D_DBS_DSC.db";
        QFile::remove(dbFile);
        if(!QFile::exists(dbFile) && QFile::copy(fileList.at(ret-1).canonicalFilePath(), dbFile)) {
            success();
            result = true;
        }
        else {
            error();
        }
    }
    CleanupStack::PopAndDestroy(2, array);
    return result;
}

void Delight::removeDisabledAutostart(const QString &value) noexcept {
    QFile myFile("E:\\system\\Apps\\huellifSoft\\AutostartManager\\disabled.txt");
    if(myFile.open(QIODevice::ReadWrite | QIODevice::Text)) {
        QString a = QString::fromAscii(myFile.readAll()).replace(QString(value+"||"),QString(), Qt::CaseInsensitive);
        myFile.resize(0);
        myFile.seek(0);
        QTextStream out(&myFile);
        out << a;
        myFile.close();
    }
}

void Delight::disableChatIcon() noexcept {
    TInt i = 0;
    RProperty::Get(KPSUidCoreApplicationUIs, KCoreAppUIsUipInd, i);
    if(i != ECoreAppUIsDoNotShow) {
        RProperty::Set( KPSUidCoreApplicationUIs, KCoreAppUIsUipInd, ECoreAppUIsDoNotShow);
        success();
    }
    else {
        showError(QObject::tr("Chat icon is not enabled, it makes no sense to disable/reset it."));
    }
}

bool Delight::calcNewHash(const QString &value) noexcept {
    if(!QFile::exists(value)) {
        showError("Cannot find " + value + ", make sure it exists and Open4All is enabled.");
        return false;
    }
    QCryptographicHash crypto(QCryptographicHash::Sha1);
    QFile file(value);
    file.open(QFile::ReadOnly);
    while(!file.atEnd()){
      crypto.addData(file.read(8192));
    }
    file.close();

    QFile file2("D:\\"+QFileInfo(value).fileName());
    file2.remove();
    if(!file2.open(QIODevice::WriteOnly)) {
        return false;
    }
    file2.write(crypto.result());
    file2.close();

    execute("mv -r -o "+file2.fileName().replace('/', '\\')+" C:\\sys\\hash\\"+QFileInfo(value).fileName()+"\nnote \"Success!\"");
    return true;
}

bool Delight::is808() noexcept {
    TInt uid = 0;
    HAL::Get(HAL::EMachineUid, uid);
    return uid == 0x2003AB64;
}

void Delight::showError(const QString &value) noexcept {
    CAknGlobalNote* note = CAknGlobalNote::NewLC();
    TRequestStatus iStatus;
    note->SetTone(1000);
    note->ShowNoteL(iStatus,
                    EAknGlobalErrorNote,
                    TPtrC16 (reinterpret_cast<const TText*>(QString(value).constData()))
                    );
    User::WaitForRequest(iStatus);
    CleanupStack::PopAndDestroy(note);
}

void Delight::caption(const QString &file) noexcept {
    RApaLsSession apaLsSession;
    CleanupClosePushL(apaLsSession);
    if(apaLsSession.Connect() == KErrNone) {
        TThreadId threadId;
        apaLsSession.StartDocument(TPtrC16 (reinterpret_cast<const TText*>(file.constData())), threadId);
        CleanupStack::PopAndDestroy(&apaLsSession);
    }
}

void Delight::manual() noexcept {
    if(del()) {
        const QString result = QFileDialog::getOpenFileName(0, "Select a .txt file", "", "*.txt *.bat *.del *.xno *.cmd").replace("/","\\");
        if (!result.isEmpty()) {
            execute(QString("cmd \"" + result + '"'));
        }
    }
}

void Delight::cache() noexcept {
    AknIconConfig::EnableAknIconSrvCache(EFalse);
    AknIconConfig::EnableAknIconSrvCache(ETrue);
}

void Delight::b(const QString &a) noexcept {
    TRAP_IGNORE(CAknDiscreetPopup::ShowGlobalPopupL((_L("Wait...")), (_L("Loading...")),KAknsIIDNone, KNullDesC, 0, 0, 0x00000001, 0, NULL));
    TPtrC16 tUrl(reinterpret_cast<const TUint16*>(a.utf16()));
    RApaLsSession appArcSession;
    if(appArcSession.Connect() == KErrNone) {
        CleanupClosePushL<RApaLsSession>(appArcSession);
        TUid handlerUID;
        appArcSession.AppForDataType(TDataType(_L8("application/x-web-browse")), handlerUID);
        if (handlerUID.iUid == 0 || handlerUID.iUid == -1) handlerUID = TUid::Uid(0x10008D39);
        _LIT(KBrowserPrefix, "4 " );
        HBufC* buf16 = HBufC::NewLC(tUrl.Length() + KBrowserPrefix.iTypeLength);
        buf16->Des().Copy(KBrowserPrefix);
        buf16->Des().Append(tUrl);
        TApaTask task = TApaTaskList(CCoeEnv::Static()->WsSession()).FindApp(handlerUID);
        if (task.Exists()) {
            task.BringToForeground();
            HBufC8* param8 = HBufC8::NewLC(buf16->Length());
            param8->Des().Append(buf16->Des());
            task.SendMessage(TUid::Uid(0), *param8);
            CleanupStack::PopAndDestroy(param8);
        }
        else {
            TThreadId id;
            appArcSession.StartDocument(*buf16, handlerUID, id);
        }
        CleanupStack::PopAndDestroy(buf16);
        CleanupStack::PopAndDestroy(&appArcSession);
    }
}
