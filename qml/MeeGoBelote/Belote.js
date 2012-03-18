function fillModel() {
    for(var i = 1; i <= 15; ++i) {
        var data = {"number": i, "teamA": Math.floor(Math.random()*42), "teamB": Math.floor(Math.random()*42)};
        commonModel.append(data);
        commonModel.sumA += data.teamA;
        commonModel.sumB += data.teamB;
    }
}
