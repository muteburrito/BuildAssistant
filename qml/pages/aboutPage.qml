import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: about
    width: 840
    height: 520
    Rectangle{
        id: aboutPage
        width: 840
        height: 540
        color: "#263238"
        anchors.fill: parent

        Label {
            id: labelTitle
            color: "#fbfbfb"
            text: qsTr("About")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 0
            font.styleName: "Semibold"
            font.pointSize: 20
        }

        Label {
            id: labelVersion
            color: "#ffffff"
            text: qsTr("Version : 1.0 (Alpha)")
            anchors.top: parent.top
            anchors.topMargin: 95
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

        Label {
            id: labelMaintainer
            color: "#ffffff"
            text: qsTr("Maintainer : pun-buildengineers@ubisoft.com")
            anchors.top: labelVersion.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

        Label {
            id: labelSOS
            color: "#ffffff"
            text: qsTr("SOS : pun-buildengineers@ubisoft.com")
            anchors.top: labelMaintainer.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

        Label {
            id: labelUpTime
            color: "#ffffff"
            text: qsTr("")
            anchors.top: labelSOS.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

        Label {
            id: labelMemoryUsage
            color: "#ffffff"
            text: qsTr("")
            anchors.top: labelUpTime.bottom
            anchors.topMargin: 25
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 10
        }

    }

    Connections{
        target: backend

        function onUpTime(time_run){
            labelUpTime.text = time_run
        }

        function onRamUsage(percent){
            labelMemoryUsage.text = percent
        }
    }
}



