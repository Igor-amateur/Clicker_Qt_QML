var component;
var egg;

function createEgg() {
    component = Qt.createComponent("Egg.qml");
    egg = component.createObject(_leftCol, {x: 100, y: 100});

    if (egg == null) {
        // Обработка ошибок
        console.log("Error creating object");
    }
}
