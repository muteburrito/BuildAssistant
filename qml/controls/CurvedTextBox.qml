import QtQuick 2.15
import QtQuick.Controls 2.15

TextField{
    // Default Values
    id: textField
    implicitWidth: 150
    implicitHeight: 30
    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }
    color: "#263238"
    horizontalAlignment: Text.AlignHCenter
    font.styleName: "Semibold"
    font.pointSize: 12
    font.weight: Font.Normal

    selectByMouse: true
    selectedTextColor: "#B0BEC5"
    selectionColor: "#263238"
    placeholderTextColor: "#263238"

    // Customizable Properties -->
    property color colorDefault: "#607D8B"
    property color coloronFocus: "#90A4AE"
    property color coloronMouseOver: "#B0BEC5"


    QtObject{
        id:internal

        property var dynamicColor: if(textField.focus){
                                       textField.hovered ? coloronFocus : colorDefault
                                   }else{
                                       textField.hovered ? coloronMouseOver : colorDefault
                                   }
    }

}
