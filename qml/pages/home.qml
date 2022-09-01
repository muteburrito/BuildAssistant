import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    id: homePage
    Rectangle{
        id: home
        color: "#263238"
        anchors.fill: parent

        Label {
            id: label
            color: "#fbfbfb"
            text: qsTr("RC Build Assistant")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 0
            font.styleName: "Semibold"
            font.pointSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
        }

        CurvedTextBox{
            x: 425
            y: 308

        }

        ComboBox {
            id: comboBoxPlatform
            x: 425
            y: 162
            width: 109
            height: 26
            layer.format: ShaderEffectSource.RGBA
            currentIndex: 0
            model: ["All", "PC", "PS4", "XBoxOne", "Switch", "Stadia", "Android", "Ios"]
        }

        Label {
            id: platformLabel
            x: 254
            y: 161
            color: "#fbfbfb"
            text: qsTr("Platform")
            font.pointSize: 15
        }

    }

    ComboBox {
        id: comboBoxTarget
        x: 425
        y: 204
        width: 109
        height: 26
        layer.format: ShaderEffectSource.RGBA
        currentIndex: 0
        model: ["All", "Debug", "Profile", "Retail"]
    }

    Label {
        id: targetLabel
        x: 254
        y: 203
        color: "#fbfbfb"
        text: qsTr("Target")
        font.pointSize: 15
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:480;width:640}D{i:1}
}
##^##*/
