import QtQuick 2.0
import QtQuick.Layouts 1.3

RowLayout {
    signal start
    signal pause
    signal stop
    signal next

    property bool running: false

    spacing: 15

    IconButton {
        id: stopIcon

        width: 50
        height: 50

        color: "red"

        source: "qrc:/icons/stop.svg"

        onClicked: {
            parent.stop();
        }
    }

    IconButton {
        id: startIcon

        width: 50
        height: 50

        color: (running) ? "yellow" : "green"

        source: (running) ? "qrc:/icons/pause.svg" : "qrc:/icons/play.svg"

        onClicked: {
            if (running) {
                parent.pause();
            } else {
                parent.start();
            }

            running = !running
        }
    }

    IconButton {
        id: nextIcon

        width: 50
        height: 50

        source: "qrc:/icons/next.svg"

        onClicked: {
            parent.next();
        }
    }
}
