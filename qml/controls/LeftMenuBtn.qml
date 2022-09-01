import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    id: btnLeftMenu

    width: 200
    height: 40

    // Customizable Properties -->
    property url btn1IconSource: "../../images/svg_images/home.svg"
    property color btnColorDefault: "#37474f"
    property color btnColorMouseOver: "#546E7A"
    property color btnColorPressed: "#607D8B"
    property int iconWidth: 18
    property int iconHeight: 18
    property string menuText: "Left Menu"
    property color highlightColorLeft: "#90A4AE"
    property bool isActive: true

    QtObject{
        id: internal

        //Mouse over and Mouse click change color

        property var  dynamicColor: if(btnLeftMenu.down){
                                        btnLeftMenu.down ? btnColorPressed : btnColorDefault
                                    }else{
                                        btnLeftMenu.hovered ? btnColorMouseOver : btnColorDefault
                                    }
    }

    background: Rectangle{
        id: btnBG
        color: internal.dynamicColor
        anchors.fill: parent

        // Highlight for the menu that is active -->
        Rectangle{
            id: btnHighlightLeft
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }
            color: highlightColorLeft
            width: 3
            visible: isActive
        }

        Image {
            id: iconBtn
            source: btn1IconSource
            anchors.leftMargin: 26
            sourceSize.height: iconHeight
            sourceSize.width: iconWidth
            height: 20
            width: 20
            fillMode: Image.PreserveAspectFit
            visible: true
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            antialiasing: true
        }

        Text{
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            text: menuText
            anchors.left: parent.left
            font.pointSize: 10
            anchors.leftMargin: 75
        }


    }

}


/*##^##
Designer {
    D{i:0;formeditorZoom:1.1}
}
##^##*/
