import QtQuick 2.0

Rectangle {
    property bool selected: false

    onSelectedChanged: {
        color = (selected) ? "#f54254" : "#4287f5";

        console.log(row + column + " is now " + ((selected) ? "selected" : "unselected"));
    }

    color: "#4287f5"

    property string row
    property int    column

    border.color: "white"

    Text {
        id: textbox

        text: column

        anchors.fill: parent

        color: "white"

        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        font.pointSize: 36
        minimumPointSize: 16

        fontSizeMode: Text.Fit
    }

    MouseArea {
        anchors.fill: parent

        hoverEnabled: true

        onEntered: {
            if (selected) {
                parent.color = "#f02438"
            } else {
                parent.color = "#2478ff";
            }
        }

        onExited: {
            if (selected) {
                parent.color = "#f54254";
            } else {
                parent.color = "#4287f5";
            }
        }

        onClicked: {
            selected = !selected;
        }
    }
}
