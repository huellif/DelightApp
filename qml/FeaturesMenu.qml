import QtQuick 1.1;import com.nokia.symbian 1.1;ContextMenu{MenuLayout{MenuItem{text:"Delight App";onClicked:pageStack.push("qrc:/qml/HTML.qml",{ur:"DA"});}MenuItem{text:"Delight Belle FP2";onClicked:pageStack.push("qrc:/qml/HTML.qml",{ur:"FP2"});}MenuItem{text:"Delight Belle Refresh";onClicked:pageStack.push("qrc:/qml/HTML.qml",{ur:"FP1"});}}Component.onCompleted:open();onStatusChanged:if(status===DialogStatus.Closing)destroy();}