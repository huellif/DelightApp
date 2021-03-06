import QtQuick 1.1;
import com.nokia.symbian 1.1;
Page {
    tools: ToolBarLayout {
        ToolButtonWithTip {
            iconSource: "toolbar-back";onClicked: pageStack.pop();toolTipText: qsTr("Back");
        }
    }
    Text {
        id: current;
        horizontalAlignment: Text.AlignHCenter;
        text: loadCurrentFile();
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.topMargin: 5;
        font.italic: true;
        font.pixelSize: platformStyle.fontSizeMedium;
        color: "LightSeaGreen";
        elide: Text.ElideRight;
        wrapMode: Text.WordWrap;
        textFormat: Text.PlainText
        maximumLineCount: 5
    }

    TextField {
        id: textfield
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.topMargin: 15;
        anchors.top: current.bottom;
        text: "http://"
    }
    Button{
        id: b2;
        text:qsTr("Apply new server");
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.top: textfield.bottom;
        anchors.topMargin: 15;
        onClicked: {
            Helper.setContest(textfield.text);
            current.text="Current server :\n"+Helper.getContest();
        }
    }

    Button {
        id: b1;
        text :qsTr("Reset Contest server");
        anchors.right: parent.right;
        anchors.left: parent.left;
        anchors.top: b2.bottom;
        anchors.topMargin: 15;
        onClicked:if(Helper.reset("0x10282EC7","0x1")) {
          Helper.success();
          current.text=qsTr("Current server:\n")+Helper.getContest();
        }
    }

    function loadCurrentFile() {
        current.text=qsTr("Current server:\n")+Helper.getContest();
    }
}
