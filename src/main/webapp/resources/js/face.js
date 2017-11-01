window.onload = function() {

    if (document.getElementById("subheader") !== null) {

        refreshFaceMargin();

        window.onresize = function () {
            refreshFaceMargin();
        };
        window.onscroll = function () {
            var headerHeight = document.getElementById("fixed").offsetHeight;
            var headerTop = document.getElementById("face").offsetHeight - headerHeight + 50;

            var isFixed = window.innerWidth > 580;

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
};

function refreshFaceMargin() {
    var isFixed = window.innerWidth > 580;
    var headerHeight = document.getElementById("fixed").offsetHeight;
    if (isFixed)
        document.getElementById("face").style.paddingTop = 8 + headerHeight - 50 + "px";
}

go_trailer = function () {
    var frame = document.getElementById("frame");
    frame.style = "";
    frame.classList.add("opened_frame");
    play.playVideo()
};

close_frame = function () {
    var frame = document.getElementById("frame");
    frame.style = "display: none;";
    frame.className = "";
    play.pauseVideo()
};

