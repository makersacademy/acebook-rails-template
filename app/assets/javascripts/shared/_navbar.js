$(document).ready(function(){
    var thisUrl = window.location.pathname;
    if( thisUrl == “/”){
        $(“li”).has(“#profile”).attr(“aria-current”, “page”);
        $(“li”).has(“#profile”).addClass(“breadcrumb-item active”);
        $(“#profile”).contents().unwrap();
    } else{
        $(“li”).has(`a[href$=“${thisUrl}“]`).attr(“aria-current”, “page”);
        $(“li”).has(`a[href$=“${thisUrl}“]`).addClass(“breadcrumb-item active”);
        $(`li > a[href$=“${thisUrl}“]`).contents().unwrap();
    }
});
