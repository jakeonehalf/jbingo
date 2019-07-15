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
    color: "#1c1c1c"

    property bool fullscreen: false

    visibility: (fullscreen) ? Window.FullScreen : Window.Windowed

    Item {
        id: escapeItem
        focus: true

        Keys.onShortcutOverride: event.accepted = (event.key === Qt.Key_Escape)

        Keys.onEscapePressed: {
            fullscreen = false;

            console.log("Escape pressed.");
        }
    }

    BingoBoard {
        id: bingoBoard

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20

        width: parent.width - 40
        height: (parent.width - 40) * 0.3125
    }

    Text {
        id: lastCalled

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: bingoBoard.bottom

        anchors.topMargin: 50

        font.pointSize: 128
        minimumPointSize: 64

        width: parent.width / 4
        height: parent.height / 4
    }

    RowLayout {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        spacing: 10

        Button {
            id: fullscreenButton

            Layout.preferredWidth: 125
            Layout.preferredHeight: 50

            text: (fullscreen) ? "Exit Fullscreen" : "Enter Fullscreen"

            onClicked: {
                fullscreen = !fullscreen;
            }

            visible: !fullscreen
        }

        Button {
            id: startButton

            Layout.preferredWidth: 125
            Layout.preferredHeight: 50

            text: (run.running) ? "Stop" : "Start"

            onClicked: {
                if (run.running) {
                    run.stop();
                } else {
                    run.start();
                }
            }
        }

        Button {
            id: resetButton

            Layout.preferredWidth: 125
            Layout.preferredHeight: 50

            text: "Reset"

            onClicked: {
                bingoBoard.reset();
            }
        }
    }

    function takeGuess() {
        if (bingoBoard.allSelected()) {
            run.stop();
            return;
        }

        var guess = Math.floor((Math.random() * 75));

        while(bingoBoard.isSelected(guess)) {
            guess = Math.floor((Math.random() * 75));
        }

        bingoBoard.select(guess);

        var row = Math.floor(guess / 15);
        var column = (guess % 15) + 1;

        switch (row) {
        case 0:
            lastCalled.text = "B" + (guess + 1);
            break;
        case 1:
            lastCalled.text = "I" + (guess + 1);
            break;
        case 2:
            lastCalled.text = "N" + (guess + 1);
            break;
        case 3:
            lastCalled.text = "G" + (guess + 1);
            break;
        case 4:
            lastCalled.text = "O" + (guess + 1);
            break;
        }
    }

    Timer {
        id: run
        interval: 15000
        running: false
        repeat: true

        onTriggered: {
            takeGuess();
        }
    }
}
