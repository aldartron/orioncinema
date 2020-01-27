window.onload = function() {

    if (document.getElementById("face") !== null) {

        refreshFaceMargin();
        var headerHeight;
        var headerTop;
        var isFixed;

        window.onscroll = function () {
            headerHeight = document.getElementById("fixed").offsetHeight;
            headerTop = document.getElementById("face").offsetHeight - headerHeight + 50;
            isFixed = window.innerWidth > 580;

            if (window.scrollY >= headerTop + 3 && isFixed) {
                document.getElementById("subheader").className = "subheader sticky";
                document.getElementById("subheader").setAttribute("style", "top: " + headerHeight + "px");
                document.getElementById("face").style.marginBottom = headerHeight + "px";
            } else {
                document.getElementById("subheader").className = "subheader";
                document.getElementById("subheader").setAttribute("style", "");
                document.getElementById("face").style.marginBottom = 0;
            }
        }
    }

    window.onresize = function () {
        if (document.getElementById("face") !== null)
            refreshFaceMargin();

        document.getElementById("calendar_panel").setAttribute(
            "style","left: " + (document.getElementById("calendar_button").getBoundingClientRect().right + 50) + "px; " +
            "top: " + document.getElementById("subheader").clientHeight +"px"
        );

    };

};

function refreshFaceMargin() {
    var isFixed = window.innerWidth > 580;
    var headerHeight = document.getElementById("fixed").offsetHeight;
    if (isFixed)
        document.getElementById("face").style.paddingTop = 8 + headerHeight - 50 + "px";
}