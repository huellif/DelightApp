import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Connection popup");icon:"images/note_info.svg";message:qsTr("If you use your phone mostly in offline mode, then you had better disable this popup. It is also noted to conflict with DLNA play.\n\nWARNING: your phone will reboot after changing this.");acceptButtonText:"OK";rejectButtonText:qsTr("Cancel");onAccepted:{Helper.kill(0x101F6D12);Helper.resolver("ConnectionPopup_off.txt");}Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}