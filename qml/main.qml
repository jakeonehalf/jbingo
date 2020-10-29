import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import QtSpeak 1.0

import "qrc:/js/BingoGrid.js" as BingoGrid

Window {
    id: main

    visible: true
    width: 800
    height: 600
    title: "J-Bingo"
    color: "#1c1c1c"

    property bool fullscreen: false
    property bool mute: false
    property int guess

    visibility: (fullscreen) ? Window.FullScreen : Window.Windowed

    function takeGuess() {
        if (BingoGrid.allSelected()) {
            run.stop();
            return;
        }

        BingoGrid.stopBlink(guess);

        guess = Math.floor((Math.random() * 75));

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

        BingoGrid.blink(guess);
        if (!mute) speaker.speak(lastCalled.text);
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

    BingoControl {
        id: bingoControl

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 15

        onStart: {
            run.start();
        }

        onPause: {
            run.stop();
        }

        onStop: {
            lastCalled.text = "";
            BingoGrid.reset();
        }

        onNext: {
            if (run.running) run.restart();
            takeGuess();
        }
    }

    IconButton {
        id: fullscreenIcon

        anchors.bottom: parent.bottom
        anchors.right: parent.right

        anchors.bottomMargin: 15
        anchors.rightMargin: 15

        width: 50
        height: 50

        source: (fullscreen) ? "qrc:/icons/exit-fullscreen-icon.svg" : "qrc:/icons/enter-fullscreen-icon.svg"

        onClicked: {
            fullscreen = !fullscreen;
        }

        Item {
            id: escapeItem
            focus: true

            Keys.onShortcutOverride: event.accepted = (event.key === Qt.Key_Escape)

            Keys.onEscapePressed: {
                fullscreen = false;
            }
        }
    }

    IconButton {
        id: muteIcon

        anchors.bottom: parent.bottom
        anchors.right: fullscreenIcon.left

        anchors.bottomMargin: 15
        anchors.rightMargin: 15

        width: 50
        height: 50

        source: (mute) ? "qrc:/icons/sound-off.svg" : "qrc:/icons/sound-on.svg"

        onClicked: {
            mute = !mute;
        }
    }
}
