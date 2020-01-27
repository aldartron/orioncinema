var play;

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