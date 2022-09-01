import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: about
    Rectangle{
        id: aboutPage
        width: 840
        height: 540
        color: "#263238"
        anchors.fill: parent

        Label {
            id: label
            text: qsTr("About Section")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pointSize: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
