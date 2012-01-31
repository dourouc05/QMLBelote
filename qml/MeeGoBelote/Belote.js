function fillModel() {
    for(var i = 1; i <= 15; ++i) {
        updateModel({"number": i, "teamA": Math.floor(Math.random()*42/2), "teamB": Math.floor(Math.random()*42/2)});
    }
}

function emptyModel() {
    commonModel.clear();
    commonModel.sumA = 0;
    commonModel.sumB = 0;
}

function pushGame(a, b) {
    var ia = parseInt(a.text);
    var ib = parseInt(b.text);

    if(! isNaN(ia) && ! isNaN(ib))
    {
        updateModel({"number": commonModel.count + 1, "teamA": ia, "teamB": ib});
        appWindow.pageStack.pop();

        a.text = "";
        b.text = "";
    }
}

/**
  * var data = {"number": int, "teamA": int, "teamB": int};
  */
function updateModel(data) {
    commonModel.append(data);
    commonModel.sumA += data.teamA;
    commonModel.sumB += data.teamB;
}
