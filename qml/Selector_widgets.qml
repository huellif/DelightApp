import QtQuick 1.1;import com.nokia.symbian 1.1
ContextMenu{
MenuLayout{
MenuItem{
text:qsTr("Classic Skins")
onClicked:create("Selector_widgets_classic.qml")}
MenuItem{
text:qsTr("FP2 Skins")
onClicked:create("Selector_widgets_FP2.qml")}
MenuItem{
text:qsTr("Delight Skins")
onClicked:create("Selector_widgets_delight.qml")}}
Component.onCompleted:open()
onStatusChanged:if(status === DialogStatus.Closing)destroy()}

