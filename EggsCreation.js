var component;
var egg;

function createEgg() {
    component = Qt.createComponent("Egg.qml");
    var start_x = _mainwindow.width * 0.1;
    var start_y = _mainwindow.width * 0.07;
    egg = component.createObject(_mainwindow, {x: start_x, y: start_y, parentWidth: _mainwindow.width});

    if (egg === null) {
        // Обработка ошибок
        console.log("Error creating object");
    }
}
