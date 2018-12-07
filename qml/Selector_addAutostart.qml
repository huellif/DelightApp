import QtQuick 1.1;import com.nokia.symbian 1.1;
CommonDialog{
    privateCloseIcon:true;titleText:qsTr("Add new process")
    buttons:Item{width:parent.width;height:privateStyle.toolBarHeightLandscape+platformStyle.paddingSmall*2;
        Row{anchors.centerIn:parent;spacing:platformStyle.paddingMedium;
            ToolButton{
                text:qsTr("Add");
                id:button;
                enabled:(field.text!="" && field.text.substring(field.text.length-4) == ".exe")
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
                height:field.height+text.height+rw.height+col.spacing*2+col.anchors.topMargin+col.anchors.bottomMargin;width:parent.width;
                Column{id:col;spacing:platformStyle.paddingMedium;anchors{leftMargin:platformStyle.borderSizeMedium;rightMargin:platformStyle.borderSizeMedium;topMargin:platformStyle.borderSizeMedium;fill:parent;}
                    Label{id:text;anchors.left:parent.left;anchors.right:parent.right;horizontalAlignment:Text.AlignHCenter;text:qsTr("Add a new process to autostart:");wrapMode:Text.WordWrap;}
                    TextField{
                        id:field;
                        Keys.onEnterPressed:{if(button.enabled)c();}
                        anchors.left:parent.left;anchors.right:parent.right;
                        onTextChanged:if(field.text.length>64)field.text=field.text.trim().substring(0,64).trim();
                        onActiveFocusChanged:b();
                    }
                    Row{
                        id:rw
                        anchors.left:parent.left;
                        anchors.right:parent.right;
                        Label{id:text2;anchors.verticalCenter:sw.verticalCenter;horizontalAlignment:Text.AlignHCenter;text:qsTr("Launch in foreground");wrapMode:Text.WordWrap;}
                        Switch{
                            id:sw;
                            checked:true
                            anchors.right:rw.right
                        }
                    }
                }
                onWidthChanged:b();
    }
    onStatusChanged:if(status===DialogStatus.Closing)destroy();
    Component.onCompleted:open();
    function c(){
        field.text=field.text.trim();
        if(Helper.addAutostart(field.text, sw.checked)) {
            close();
        }
    }
    function b(){
        var a=screen.width==640?true:false;if(a&&field.activeFocus)text.visible=false;else text.visible=true;
    }
}
