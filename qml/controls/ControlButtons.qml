import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    id: btnCtrl

    width: 20
    height: 20

    // Customizable Properties -->
    property url btn1IconSource: "../../images/svg_images/close.svg"
    property color btnColorDefault: "#263238"
    property color btnColorMouseOver: "#37474F"
    property color btnColorPressed: "#455A64"

    QtObject{
        id: internal

        //Mouse over and Mouse click change color

        property var  dynamicColor: if(btnCtrl.down){
                                        btnCtrl.down ? btnColorPressed : btnColorDefault
                                    }else{
                                        btnCtrl.hovered ? btnColorMouseOver : btnColorDefault
                                    }
    }

    background: Rectangle{
        id: btnBG
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btn1IconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 20
            width: 20
            fillMode: Image.PreserveAspectFit
            visible: true
        }

    }

}

