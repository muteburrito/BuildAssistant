import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import 'controls'
import 'pages'

Window {
    id: window
    width: 840
    height: 540
    minimumWidth: 830
    minimumHeight: 530
    opacity: 1
    visible: true
    color: "#263238"

    //Removing Title Bar -->
    flags: Qt.Window | Qt.FramelessWindowHint
    title: qsTr("Build Assistant")

    // Adding a section for pages -->
    Rectangle {
        id: pages
        color: "#00ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.bottomMargin: 0
        anchors.topMargin: 20
        anchors.rightMargin: 0
        anchors.leftMargin: 0

        // Commenting Stack view as loader has a better performance
        /*StackView {
            id: stackView
            anchors.fill: parent
            initialItem: Qt.resolvedUrl("pages/home.qml")
        }*/

        Loader{
            id: pageViewHome
            anchors.fill: parent
            source: Qt.resolvedUrl("pages/home.qml")
            visible: true
        }

        Loader{
            id: pageViewBuildDashboard
            anchors.fill: parent
            source: Qt.resolvedUrl("pages/metricDashboardPage.qml")
            visible: false
        }

        Loader{
            id: pageViewAbout
            anchors.fill: parent
            source: Qt.resolvedUrl("pages/aboutPage.qml")
            visible: false
        }

    }

    // Adding a functionality to drag -->
    DragHandler{
        onActiveChanged: if(active){
                             window.startSystemMove()
                         }
    }

    //Properties -->
    property int windowStatus: 0

    // Internal Functions -->
    QtObject{
        id: internal

        function maximizeRestore(){
            if(windowStatus == 0){
                windowStatus = 1
                window.showMaximized()
            }
            else{
                windowStatus = 0
                window.showNormal()
            }
        }

    }

    ControlButtons{
        id: ctrl_close
        x: 820
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.rightMargin: 0
        btnColorMouseOver: "#ff5555"

        // Fuction to close -->
        onClicked: window.close()
    }

    ControlButtons{
        id: ctrl_maximize
        x: 777
        anchors.right: ctrl_close.left
        anchors.top: ctrl_close.bottom
        anchors.topMargin: -20
        anchors.rightMargin: 15
        btn1IconSource: "../images/svg_images/maximize.svg"

        // Fuction to mximize -->
        onClicked: internal.maximizeRestore()
    }

    ControlButtons{
        id: ctrl_minimize
        x: 719
        anchors.right: ctrl_maximize.left
        anchors.top: ctrl_maximize.bottom
        anchors.topMargin: -20
        anchors.rightMargin: 15
        btn1IconSource: "../images/svg_images/minimize.svg"

        // Fuction to minimize -->
        onClicked: window.showMinimized()
    }

    Rectangle {
        id: leftMenu
        width: 75
        color: "#37474f"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        clip: true
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        anchors.leftMargin: 0

        PropertyAnimation{
            id: animationMenu
            target: leftMenu
            property: "width"
            to: if(leftMenu.width == 75) return 200; else return 75
            duration: 500
            easing.type: Easing.InOutQuint

        }

        HamButton{
            onClicked: animationMenu.running = true
        }

        LeftMenuBtn{
            id: home
            x: 0
            width: leftMenu.width
            anchors.top: parent.top
            anchors.topMargin: 40
            menuText: "Home"
            isActive: true
            onClicked: {
                home.isActive = true
                buildDashboard.isActive = false
                about.isActive = false
                //stackView.push(Qt.resolvedUrl("pages/home.qml"))
                pageViewHome.visible = true
                pageViewBuildDashboard.visible = false
                pageViewAbout.visible = false
            }

        }

        LeftMenuBtn{
            id: buildDashboard
            x: 0
            width: leftMenu.width
            anchors.top: home.bottom
            btn1IconSource: "../images/svg_images/metrics.svg"
            anchors.topMargin: 10
            menuText: "Build Dashboard"
            isActive: false
            onClicked: {
                home.isActive = false
                buildDashboard.isActive = true
                about.isActive = false
                //stackView.push(Qt.resolvedUrl("pages/metricDashboardPage.qml"))
                pageViewHome.visible = true
                pageViewBuildDashboard.visible = true
                pageViewAbout.visible = false
            }

        }

        LeftMenuBtn{
            id: about
            x: 0
            width: leftMenu.width
            anchors.top: buildDashboard.bottom
            btn1IconSource: "../images/svg_images/info.svg"
            anchors.topMargin: 10
            menuText: "About"
            isActive: false
            onClicked: {
                home.isActive = false
                buildDashboard.isActive = false
                about.isActive = true
                //stackView.push(Qt.resolvedUrl("pages/aboutPage.qml"))
                pageViewHome.visible = false
                pageViewBuildDashboard.visible = false
                pageViewAbout.visible = true
            }

        }

        Label {
            id: timeView
            y: 502
            color: "#B0BEC5"
            text: qsTr("")
            anchors.bottom: parent.bottom
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 12
            font.bold: true
            anchors.bottomMargin: 20
        }

    }

    Image {
        id: ubisoftLogo
        x: 710
        y: 409
        width: 100
        height: 100
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        source: "../images/svg_images/ubisoft_logo.png"
        anchors.bottomMargin: 15
        anchors.rightMargin: 15
        fillMode: Image.PreserveAspectFit
    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: -8
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 window.startSystemResize(Qt.LeftEdge)
                             }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: -8
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 window.startSystemResize(Qt.RightEdge)
                             }
        }
    }

    MouseArea {
        id: resizeBottom
        y: 526
        width: 10
        height: 10
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottomMargin: -6
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 window.startSystemResize(Qt.BottomEdge)
                             }
        }
    }

    MouseArea {
        id: resizeTop
        y: 526
        width: 10
        height: 10
        anchors.top: parent.top
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.topMargin: -6
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 window.startSystemResize(Qt.TopEdge)
                             }
        }
    }


    MouseArea {
        id: mouseArea
        y: 531
        height: 17
        anchors.left: resizeBottom.right
        anchors.right: parent.right
        anchors.leftMargin: 0
        anchors.rightMargin: 0
        cursorShape: Qt.SizeFDiagCursor

        DragHandler{
            target: null
            onActiveChanged: if(active){
                                 window.startSystemResize(Qt.RightEdge | Qt.BottomEdge)
                             }
        }
    }

    Connections{
        target: backend

        function onPrintTime(time){
            timeView.text = time
        }
    }
}
