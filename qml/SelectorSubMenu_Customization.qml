import QtQuick 1.1;import com.nokia.symbian 1.1
ContextMenu{MenuLayout{MenuItem{text:qsTr("Set a new startup animation");onClicked:Helper.anim("startup",".gif")}
MenuItem{text:qsTr("Set a new startup sound");onClicked:Helper.anim("startup",".mp3")}
MenuItem{id:sg;text:qsTr("Set a new shutdown animation");onClicked:Helper.anim("shutdown",".gif")}
MenuItem{id:sm;text:qsTr("Set a new shutdown sound");onClicked:Helper.anim("shutdown",".mp3")}}
Component.onCompleted:{if(!Helper.isFP2()){sg.visible=false;sm.visible=false}open()}
onStatusChanged:if(status===DialogStatus.Closing)destroy();}
