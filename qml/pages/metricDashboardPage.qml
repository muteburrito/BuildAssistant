import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: buildDashboardPage
    Rectangle{
        id: buildDashboard
        width: 840
        height: 540
        color: "#263238"
        anchors.fill: parent

        Label {
            id: label
            text: qsTr("Build DashBoard")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}
