window.onload = function() {

    if (document.getElementById("sticky") !== null) {

        refreshFaceMargin();

        window.onresize = function () {
            refreshFaceMargin();
        };
        window.onscroll = function () {
            var headerHeight = document.getElementById("fixed").offsetHeight;
            var style = "";
            var headerTop = document.getElementById("face").offsetHeight - headerHeight + 50;

            var isFixed = window.innerWidth > 580;

            if (headerHeight === 50) {
                style = "sticky1";
            } else if (headerHeight === 100) {
                style = "sticky2";
            } else if (headerHeight === 150) {
                style = "sticky3";
            } else {
                style = "sticky4";
            }

            if (window.scrollY >= headerTop + 3 && style !== "" && isFixed) {
                document.getElementById("sticky").className = style + " nav-sticky";
                document.getElementById("face").style.marginBottom = headerHeight + "px";
            } else {
                document.getElementById("sticky").className = "nav-sticky";
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

