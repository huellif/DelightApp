import QtQuick 1.1;import com.nokia.symbian 1.1;Menu{MenuLayout{MenuItem{text:qsTr("Max << Crazy | Doctor");platformSubItemIndicator:true;onClicked:create("Menu_crazy.qml");}MenuItem{text:qsTr("Delight Legacy Team");platformSubItemIndicator:true;onClicked:create("Menu_huellif.qml");}MenuItem{text:qsTr("Credits");onClicked:pageStack.push("qrc:/qml/HTML.qml",{ur:"Credits"});}MenuItem{text:qsTr("About");onClicked:create("AboutDialog.qml");}}Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}