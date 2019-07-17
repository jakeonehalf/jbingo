import QtQuick 2.0
import QtGraphicalEffects 1.0

Item {
    property alias source: icon.source
    property alias color: overlay.color

    signal clicked

    opacity: 0.1
    MouseArea {
        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            parent.opacity = 1.0
        }

        onExited: {
            parent.opacity = 0.1
        }

        onClicked: {
            parent.clicked();
        }
    }

    Image {
        id: icon
        sourceSize: Qt.size(parent.width, parent.height)
        smooth: true
        visible: false
    }

    ColorOverlay {
        id: overlay
        anchors.fill: icon
        source: icon
        color: "white"
    }
}
