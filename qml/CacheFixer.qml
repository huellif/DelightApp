import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Cache Cleaner");icon:"images/note_info.svg";message:qsTr("Problem of Slowness/Lags?\n\nProceed to clear system cache and AknIconSrv cache etc.?");acceptButtonText:qsTr("Clean");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.resolver("Cache.txt");Helper.cache();}onStatusChanged:if(status===DialogStatus.Closing)destroy();Component.onCompleted:open();}