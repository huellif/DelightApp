import QtQuick 1.1;import com.nokia.symbian 1.1;
CommonDialog{
    privateCloseIcon:true;
    titleText:qsTr("MiniCMD command line");
    buttons:Row{anchors.centerIn:parent;
            ToolButton{
                text:qsTr("Run");
                id:button;
                enabled:field.text.trim().length;
                onClicked:{
                    var a = field.text.trim().split("\n");
                    field.text = "";
                    for	(var index = 0; index < a.length; index++) {
                        field.text += a[index].trim()+'\n';
                    }
                    field.text = field.text.trim();
                    Helper.execute(field.text);
                    field.selectAll();
                }
            }
            ToolButton{
                text:field.text.length > 0 ? qsTr("Clear") : qsTr("Back");
                onClicked: field.text.length>0 ? field.text="" : close();
            }
    }
    content:Item{
        anchors.fill:parent
        TextArea{
            id:field
            anchors.fill:parent
            textFormat:Text.PlainText
        }
    }
    onStatusChanged:if(status==DialogStatus.Closing)destroy();
    Component.onCompleted:{
        open();
        field.forceActiveFocus();
        field.openSoftwareInputPanel();
    }
}
