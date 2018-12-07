import QtQuick 1.1;import com.nokia.symbian 1.1
Menu{
MenuLayout{
MenuItem{text:qsTr("Backup active autostart items");onClicked:Helper.createAutostartBackup()}
MenuItem{text:qsTr("Restore a backup");onClicked:Helper.restoreAutostartBackup()}
MenuItem{text:qsTr("Cancel")}}
Component.onCompleted:open()
onStatusChanged:if(status===DialogStatus.Closing)destroy()}
