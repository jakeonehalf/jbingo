import QtQuick 2.0

Rectangle {
    property alias text: textbox.text

    color: "green"

    border.color: "black"

    Text {
        id: textbox

        anchors.fill: parent

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pixelSize: parent.height - 5
        minimumPixelSize: 13

        fontSizeMode: Text.Fit
    }

    MouseArea {
        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            parent.color = "red"
        }

        onExited: {
            parent.color = "green"
        }
    }
}
