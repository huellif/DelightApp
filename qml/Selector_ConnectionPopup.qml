import QtQuick 1.1;import com.nokia.symbian 1.1;ContextMenu{MenuLayout{MenuItem{text:qsTr("Disable internet connection popup");onClicked:create("Selector_ConnectionPopup_off.qml");}MenuItem{text:qsTr("Enable popup (legacy of Symbian^3)");onClicked:create("Selector_ConnectionPopup_on.qml");}}Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}