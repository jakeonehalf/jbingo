import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 1.4
import QtQuick.Layouts 1.3
import QtSpeak 1.0

import "qrc:/js/BingoGrid.js" as BingoGrid

Window {
    id: main

    visible: true
    width: 640
    height: 480
    title: "J-Bingo"
    color: "#1c1c1c"

    property bool fullscreen: false

    visibility: (fullscreen) ? Window.FullScreen : Window.Windowed

    function takeGuess() {
        if (BingoGrid.allSelected()) {
            run.stop();
            return;
        }

        var guess = Math.floor((Math.random() * 75));

        while(BingoGrid.isSelected(guess)) {
            guess = Math.floor((Math.random() * 75));
        }

        BingoGrid.select(guess);

        var row;
        switch (Math.floor(guess / 15)) {
        case 0: row = 'B'; break;
        case 1: row = 'I'; break;
        case 2: row = 'N'; break;
        case 3: row = 'G'; break;
        case 4: row = 'O'; break;
        }

        lastCalled.text = row + (guess + 1);

        speaker.speak(lastCalled.text);
    }

    Timer {
        id: run
        interval: 30000
        running: false
        repeat: true

        onTriggered: {
            takeGuess();
        }
    }

    Speak {
        id: speaker
    }

    RowLayout {
        id: board

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20

        width: parent.width - 40
        height: (parent.width - 40) * 0.3125

        spacing: 2

        ColumnLayout {
            Layout.maximumWidth: (parent.width / 16) - 2
            Layout.maximumHeight: parent.height

            spacing: 2

            BingoRowHeader {

                Layout.preferredWidth: parent.width
                Layout.preferredHeight: (parent.height / 5) - 2

                text: 'B'
            }

            BingoRowHeader {

                Layout.preferredWidth: parent.width
                Layout.preferredHeight: (parent.height / 5) - 2

                text: 'I'
            }

            BingoRowHeader {

                Layout.preferredWidth: parent.width
                Layout.preferredHeight: (parent.height / 5) - 2

                text: 'N'
            }

            BingoRowHeader {

                Layout.preferredWidth: parent.width
                Layout.preferredHeight: (parent.height / 5) - 2

                text: 'G'
            }

            BingoRowHeader {

                Layout.preferredWidth: parent.width
                Layout.preferredHeight: (parent.height / 5) - 2

                text: 'O'
            }
        }

        GridLayout {
            id: bingoBoard

            Layout.maximumWidth: (parent.width / 16) * 15
            Layout.maximumHeight: parent.height

            rowSpacing: 2
            columnSpacing: 2

            rows: 5
            columns: 15

            Component.onCompleted: BingoGrid.createGrid();
        }
    }

    Text {
        id: lastCalled

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: board.bottom

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
            id: startButton

            Layout.preferredWidth: 125
            Layout.preferredHeight: 50

            text: (run.running) ? "Stop" : "Start"

            onClicked: {
                if (run.running) {
                    run.stop();
                } else {
                    takeGuess();
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
                lastCalled.text = "";
                BingoGrid.reset();
            }
        }
    }

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

    Item {
        id: escapeItem
        focus: true

        Keys.onShortcutOverride: event.accepted = (event.key === Qt.Key_Escape)

        Keys.onEscapePressed: {
            fullscreen = false;

            console.log("Escape pressed.");
        }
    }
}