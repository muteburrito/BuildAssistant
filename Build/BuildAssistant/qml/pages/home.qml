import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"

Item {
    id: homePage
    width: 840
    height: 520
    Rectangle{
        id: home
        color: "#263238"
        anchors.fill: parent

        Label {
            id: labelTitle
            color: "#fbfbfb"
            text: qsTr("RC Build Assistant")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 0
            font.styleName: "Semibold"
            font.pointSize: 20
        }

        CurvedTextBox{
            id: textboxCLNumber
            y: 307
            anchors.left: customCLLabel.right
            anchors.leftMargin: 45
            placeholderText: "Enter CL"
            font.pointSize: 9

        }

        CurvedTextBox{
            id: textboxShelvedCLNumber
            anchors.left: textboxCLNumber.right
            anchors.top: parent.top
            anchors.topMargin: 306
            anchors.leftMargin: 20
            placeholderText: "Enter Shelved CL"
            font.pointSize: 9
            visible: false

        }

        ComboBox {
            id: comboBoxPlatform
            y: 145
            width: 110
            height: 25
            anchors.left: platformLabel.right
            anchors.leftMargin: 50
            layer.format: ShaderEffectSource.RGBA
            currentIndex: 0
            model: ["All", "PC", "PS4", "XBoxOne", "Switch", "Stadia", "Android", "Ios"]
        }

        Label {
            id: platformLabel
            color: "#fbfbfb"
            text: qsTr("Platform")
            anchors.top: isPersonalLabel.bottom
            anchors.horizontalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            font.pointSize: 15
        }

        ComboBox {
            id: comboBoxBuildType
            y: 261
            width: 110
            height: 25
            anchors.left: buildTypeLabel.right
            anchors.leftMargin: 42
            layer.format: ShaderEffectSource.RGBA
            currentIndex: 0
            model: ["Both", "Server", "Client"]
        }

        Label {
            id: buildTypeLabel
            color: "#fbfbfb"
            text: qsTr("Build Type")
            anchors.top: targetLabel.bottom
            anchors.horizontalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            font.pointSize: 15
        }

        Switch {
            id: switchisPersonal
            anchors.left: isPersonalLabel.right
            anchors.top: parent.top
            anchors.leftMargin: 25
            anchors.topMargin: 87
            onToggled: {if(switchisPersonal.checked){
                    textboxShelvedCLNumber.visible = true
                }else{
                    textboxShelvedCLNumber.visible = false
                }
            }
        }

        Label {
            id: isPersonalLabel
            color: "#fbfbfb"
            text: qsTr("Personal Build")
            anchors.top: parent.top
            anchors.horizontalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 95
            font.pointSize: 15
        }

        ComboBox {
            id: comboBoxTarget
            y: 203
            width: 110
            height: 25
            anchors.left: targetLabel.right
            anchors.leftMargin: 61
            layer.format: ShaderEffectSource.RGBA
            currentIndex: 0
            model: ["All", "Debug", "Profile", "Retail"]
        }

        Label {
            id: targetLabel
            color: "#fbfbfb"
            text: qsTr("Target")
            anchors.top: platformLabel.bottom
            anchors.horizontalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            font.pointSize: 15
        }

        Label {
            id: customCLLabel
            color: "#fbfbfb"
            text: qsTr("Enter CL")
            anchors.top: buildTypeLabel.bottom
            anchors.horizontalCenterOffset: -50
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 30
            font.pointSize: 15
        }

        CurvedButton {
            id: curvedButtonBuild
            y: 377
            text: ""
            anchors.horizontalCenter: parent.horizontalCenter
            btnText: "Build"
            onClicked: {
                backend.printData(comboBoxPlatform.displayText)
            }
        }

        Label {
            id: dummylabel
            y: 386
            width: 97
            height: 18
            color: "#ffffff"
            text: ""
            anchors.left: curvedButtonBuild.right
            anchors.leftMargin: 35
            font.pointSize: 10
        }

    }

    Connections{
        target: backend

    }
}
/*##^##
Designer {
    D{i:0;formeditorZoom:0.9}D{i:6}D{i:8}D{i:10}D{i:12}D{i:13}D{i:14}D{i:15}
}
##^##*/
