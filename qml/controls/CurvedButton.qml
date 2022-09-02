import QtQuick 2.15
import QtQuick.Controls 2.15

Button{
    // Default Values
    id: custombtn
    implicitWidth: 60
    implicitHeight: 35
    icon.color: "#ffffff"
    background: Rectangle{
        color: internal.dynamicColor
        radius: 4
    }

    // Customizable Properties -->
    property color colorDefault: "#607D8B"
    property color colorMouseOver: "#90A4AE"
    property color colorPressed: "#B0BEC5"
    property string btnText: "Button"
    Text{
        anchors.centerIn: parent
        text: btnText
        color: "#263238"
    }

    QtObject{
        id:internal

        property var dynamicColor: if(custombtn.down){
                                       custombtn.down ? colorPressed : colorDefault
                                   }else{
                                       custombtn.hovered ? colorMouseOver : colorDefault
                                   }
    }

}
