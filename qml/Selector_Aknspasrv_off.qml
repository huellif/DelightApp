import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Aknspasrv");icon:"images/note_info.svg";message:qsTr("Disabling Aknspasrv (default setting on Delight) gives you an improved battery life, more free RAM and CPU time and the topbar always works fine in QtQuick based apps.\n\nKnown issue: the FP2 gallery will show an short blackout the first time showing a picture after launching it.\nDo you want to disable it?\n\nWARNING: Your phone will reboot after changing this.");acceptButtonText:qsTr("OK");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.kill(0x2003DFF5);Helper.resolver("Aknspasrv_off.txt");}Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}