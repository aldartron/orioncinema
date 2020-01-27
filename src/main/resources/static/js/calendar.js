var isCalendarOpened = false;

go_calendar = function() {
    var panel = document.getElementById("calendar_panel");
    var button = document.getElementById("calendar_button");
    panel.setAttribute(
        "style","left: " + (button.getBoundingClientRect().left - 150 + 19 + 66) + "px; " +
        "top: " + document.getElementById("subheader").clientHeight +"px"
    );

    if (!isCalendarOpened) {
        isCalendarOpened = true;
        button.classList.add("active");
        panel.classList.add("enabled");
    } else {
        isCalendarOpened = false;
        button.classList.remove("active");
        panel.classList.remove("enabled");
    }
};