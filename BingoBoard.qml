import QtQuick 2.0
import QtQuick.Layouts 1.3

ColumnLayout {
    anchors.topMargin: 10
    anchors.top: parent.top
    anchors.horizontalCenter: parent.horizontalCenter

    width: parent.width - 20
    height: parent.height - 100

    spacing: 2

    BingoRow {
        id: b
        label: "B"

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: i
        label: "I"

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: n
        label: "N"

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: g
        label: "G"

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: o
        label: "O"

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }
}
