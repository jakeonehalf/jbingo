import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3

Window {
    id: main

    visible: true
    width: 640
    height: 480
    title: "J-Bingo"

    BingoBoard {
        id: bingoBoard
    }

    Button {
        id: fullscreenButton

        property bool fullscreen: false

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        width: 125
        height: 50

        text: "Enter Fullscreen"

        onClicked: {
            fullscreen = !fullscreen;

            if (fullscreen) {
                text = "Exit Fullscreen";
                main.visibility = Window.FullScreen;
            } else {
                text = "Enter Fullscreen";
                main.visibility = Window.Windowed;
            }
        }
    }
}
