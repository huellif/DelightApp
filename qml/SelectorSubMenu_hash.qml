import QtQuick 1.1;import com.nokia.symbian 1.1;
CommonDialog{
    privateCloseIcon:true;titleText:qsTr("Recalculate Hash")
    buttons:Item{width:parent.width;height:privateStyle.toolBarHeightLandscape+platformStyle.paddingSmall*2;
        Row{anchors.centerIn:parent;spacing:platformStyle.paddingMedium;
            ToolButton{
                text:qsTr("Add");
                id:button;
                enabled:field.acceptableInput
                onClicked:c();
            }
            ToolButton{
                text:field.text.trim()=="" ? qsTr("Back") : qsTr("Clear");
                onClicked:if(field.text.trim()=="") {
                              close();
                          }
                          else {
                              field.text = "";
                          }
            }
        }
    }
    content:Item{
                id:root;
                height:field.height+text.height+col.spacing*2+col.anchors.topMargin+col.anchors.bottomMargin;width:parent.width;
                Column{id:col;spacing:platformStyle.paddingMedium;anchors{leftMargin:platformStyle.borderSizeMedium;rightMargin:platformStyle.borderSizeMedium;topMargin:platformStyle.borderSizeMedium;fill:parent;}
                    Label{id:text;anchors.left:parent.left;anchors.right:parent.right;horizontalAlignment:Text.AlignHCenter;text:qsTr("Recalculate the hash of a .exe:\n\nEnter the full path, e.g. E:\\sys\\bin\\app.exe");wrapMode:Text.WordWrap;}
                TextField{
                    id:field;
                    validator: RegExpValidator{regExp:/(E|F)(:\\sys\\bin\\)(.)*(.exe)/i}
                    Keys.onEnterPressed:if(button.enabled)c();
                    anchors.left:parent.left;anchors.right:parent.right;
                    onTextChanged:if(field.text.length>64)field.text=field.text.trim().substring(0,64).trim();
                    onActiveFocusChanged:b();}
                }
                onWidthChanged:b();
    }
    onStatusChanged:if(status===DialogStatus.Closing)destroy();
    Component.onCompleted:{open();}
    function c(){
        if(Helper.calcNewHash(field.text.trim())) {
            close();
        }
    }
    function b(){
        var a=screen.width==640?true:false;if(a&&field.activeFocus)text.visible=false;else text.visible=true;
    }
}
