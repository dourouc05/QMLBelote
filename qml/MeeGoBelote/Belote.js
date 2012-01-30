.pragma library // Single context for all instances (stateless)
var model;
var pageStack;

function initModel(_model) {
    model = _model;
}

function fillModel() {
    for(var i = 1; i <= 15; ++i) {
        updateModel({"number": i, "teamA": Math.floor(Math.random()*42/2), "teamB": Math.floor(Math.random()*42/2)});
    }
}

function emptyModel() {
    model.clear();
    model.sumA = 0;
    model.sumB = 0;
}

function addGame(_pageStack) {
    pageStack = _pageStack;
    pageStack.push(Qt.createComponent("AddGamePage.qml"));
}

function pushGame(a, b) {
    updateModel({"number": model.count + 1, "teamA": parseInt(a.text), "teamB": parseInt(b.text)});
    pageStack.pop();
}

/**
  * var data = {"number": int, "teamA": int, "teamB": int};
  */
function updateModel(data) {
    model.append(data);
    model.sumA += data.teamA;
    model.sumB += data.teamB;
}
