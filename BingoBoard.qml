import QtQuick 2.0
import QtQuick.Layouts 1.3

ColumnLayout {
    spacing: 2

    function reset() {
        b.reset();
        i.reset();
        n.reset();
        g.reset();
        o.reset();
    }

    function select(item) {
        var row = Math.floor(item / 15);
        var column = (item % 15) + 1;

        switch(row) {
        case 0:
            if (!b.isSelected(column)) {
                b.select(column);
            }
            break;
        case 1:
            if (!i.isSelected(column)) {
                i.select(column);
            }
            break;
        case 2:
            if (!n.isSelected(column)) {
                n.select(column);
            }
            break;
        case 3:
            if (!g.isSelected(column)) {
                g.select(column);
            }
            break;
        case 4:
            if (!o.isSelected(column)) {
                o.select(column);
            }
            break;
        default:
            console.log("select: Invalid item " + item);
            break;
        }
    }

    function isSelected(item) {
        var row = Math.floor(item / 15);
        var column = (item % 15) + 1;

        switch(row) {
        case 0:
            return b.isSelected(column);
        case 1:
            return i.isSelected(column);
        case 2:
            return n.isSelected(column);
        case 3:
            return g.isSelected(column);
        case 4:
            return o.isSelected(column);
        default:
            console.log("isSelected: Invalid item " + item);
            break;
        }
    }

    function allSelected() {
        for (var i = 0; i < 75; i++) {
            if (!isSelected(i)) return false;
        }

        return true;
    }

    BingoRow {
        id: b
        label: "B"

        start: 1

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: i
        label: "I"

        start: 16

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: n
        label: "N"

        start: 31

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: g
        label: "G"

        start: 46

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }

    BingoRow {
        id: o
        label: "O"

        start: 61

        Layout.preferredWidth: parent.width
        Layout.preferredHeight: parent.height / 5
    }
}
