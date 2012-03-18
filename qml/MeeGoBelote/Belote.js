function fillModel() {
    for(var i = 1; i <= 15; ++i) {
        var data = {"number": i, "teamA": Math.floor(Math.random()*42), "teamB": Math.floor(Math.random()*42)};
        commonModel.append(data);
        commonModel.sumA += data.teamA;
        commonModel.sumB += data.teamB;
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

function updateModel(data) {
    commonModel.append(data);
    commonModel.sumA += data.teamA;
    commonModel.sumB += data.teamB;
}
