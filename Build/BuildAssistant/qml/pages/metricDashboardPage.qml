import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: buildDashboardPage
    width: 840
    height: 520
    Rectangle{
        id: buildDashboard
        width: 840
        height: 540
        color: "#263238"
        anchors.fill: parent

        Label {
            id: labelTitle
            color: "#fbfbfb"
            text: qsTr("Build Dashboard")
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.horizontalCenter: parent.horizontalCenter
            anchors.topMargin: 0
            font.styleName: "Semibold"
            font.pointSize: 20
        }

    }
}
