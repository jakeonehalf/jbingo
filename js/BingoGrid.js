var components = [];
var grid = [];

function createGrid() {
    for (var i = 0; i < 75; i++) {
        var component = Qt.createComponent("qrc:/qml/BingoSquare.qml");
        var square = component.createObject(bingoBoard);
        square.item = i+1;
        grid.push(square);
    }
}

function select(item) {
    grid[item].selected = true;
}

function deselect(item) {
    grid[item].selected = false;
}

function isSelected(item) {
    return grid[item].selected;
}

function reset() {
    for (var i = 0; i < 75; i++) {
        grid[i].selected = false;
    }
}

function allSelected() {
    for (var i = 0; i < 75; i++) {
        if (!grid[i].selected) return false;
    }

    return true;
}
