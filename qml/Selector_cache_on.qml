import QtQuick 1.1;import com.nokia.symbian 1.1;QueryDialog{titleText:qsTr("Application caching");icon:"images/note_info.svg";message:qsTr("You can't close: clock, calendar, logs, contacts and messaging as in original firmware. This means this apps are launching instantly, but they will consume more battery, CPU time and free RAM.\n\nApplying this requires a reboot.");acceptButtonText:qsTr("OK");rejectButtonText:qsTr("Cancel");onAccepted:{Helper.resolver("cache_off.txt");Helper.cp(":/other/102858f2.cre","C:/private/10202be9/102858f2.cre");}Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}