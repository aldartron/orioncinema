window.onload = function() {

    if (document.getElementById("subheader") !== null) {

        refreshFaceMargin();

        window.onresize = function () {
            var headersHeight = document.getElementById("subheader_fixed").clientHeight + document.getElementById("fixed").clientHeight;
            document.getElementById("hall").style = "margin-top: " + headersHeight + "px;";
        };
    }
};

var selectedButtons = [];

select_seat = function (button) {
    if (button.classList.contains("checked")) {
        var index = selectedButtons.indexOf(button);
        if (index > -1) {
            selectedButtons.splice(index, 1);
            button.classList.remove("checked");
        }
    } else {
        button.classList.add("checked");
        selectedButtons.push(button);
    }
    refreshInfo();
};

refreshInfo = function() {
    document.getElementById("seat_count").innerHTML = selectedButtons.length;
    document.getElementById("cost").innerHTML = getSumOfTickets();
};

getSumOfTickets = function () {
    var sum = 0;
    for (var i in selectedButtons) {
        sum += parseInt(selectedButtons[i].getAttribute("price"));
    }
    return sum;
};



