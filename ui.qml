import QtQuick 2.3
import QtQuick.Controls 1.3
import QtQuick.Layouts 1.3

ApplicationWindow {

    id: window
    visible: true
    width: 640
    height: 512
    //flags: Qt.SplashScreen
    //flags: Qt.WindowSystemMenuHint

    Image {
        width: parent.width
        height: parent.height
        source: "bg.png"

        Component.onCompleted: {
            window.flags = Qt.SplashScreen
        }

        focus: true
        Keys.onPressed: {
            if ((event.key === Qt.Key_Q) && (event.modifiers & Qt.ControlModifier)) {
                window.close();
            } else if(event.key === Qt.Key_Escape) {
                console.log("love")

                window.showMinimized()
                window.flags = Qt.WindowModal

            }

        }

    }

    ColumnLayout {
        width: parent.width
        height: parent.height


        Rectangle {
            anchors.verticalCenter: parent.verticalCenter
            Layout.minimumWidth: 384
            height: 384
            color: "transparent"

            ColumnLayout {
                height: parent.height
                anchors.horizontalCenter: parent.horizontalCenter

                Rectangle {
                    anchors.top: parent.top
                    width: 200
                    height: 48
                    border.width: 3
                    radius: 64
                    border.color: "dodgerblue"
                    color: 'transparent'

                    MouseArea {
                        anchors.fill: parent
                        hoverEnabled: true
                        cursorShape: Qt.PointingHandCursor

                        onEntered: {
                            parent.color = "white"
                            parent.border.color = "white"
                            parent.children[1].color = "dodgerblue"
                        }

                        onPressed: {
                            parent.color = "dodgerblue"
                            parent.border.color = "dodgerblue"
                            parent.children[1].color = "white"
                        }

                        onExited: {
                            parent.color = "transparent"
                            parent.border.color = "dodgerblue"
                            parent.children[1].color = "white"
                        }

                    }

                    Text {
                        anchors.centerIn: parent
                        color: "white"
                        font.pixelSize: 32
                        text: "Pay In"
                    }


                }

                Text {
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottom: parent.bottom
                    color: "white"
                    font.pixelSize: 32
                    text: "0.00"
                }

            }

        }

        Rectangle {
            anchors.right: parent.right
            width: parent.width / 5 * 2
            height: parent.height
            color: "dodgerblue"

            Grid {
                anchors.centerIn: parent
                Rectangle {
                    width: 4
                    height: 4
                    color: "white"
                }
            }

        }

    }




}
