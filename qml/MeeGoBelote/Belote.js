function fillModel(model) {
    for(var i = 1; i <= 15; ++i) {
        var data = {"number": i, "teamA": Math.floor(Math.random()*42), "teamB": Math.floor(Math.random()*42)};
        model.append(data);
        model.sumA += data.teamA;
        model.sumB += data.teamB;
    }
}
