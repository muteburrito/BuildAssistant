import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    id: btnHamburger

    implicitWidth: 30
    implicitHeight: 30

    // Customizable Properties -->
    property url btn1IconSource: "../../images/svg_images/hamburger.svg"
    property color btnColorDefault: "#37474f"
    property color btnColorMouseOver: "#546E7A"
    property color btnColorPressed: "#607D8B"

    QtObject{
        id: internal

        //Mouse over and Mouse click change color

        property var  dynamicColor: if(btnHamburger.down){
                                        btnHamburger.down ? btnColorPressed : btnColorDefault
                                    }else{
                                        btnHamburger.hovered ? btnColorMouseOver : btnColorDefault
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
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
            visible: true
        }

    }

}
/*##^##
Designer {
    D{i:0;height:30;width:30}
}
##^##*/
