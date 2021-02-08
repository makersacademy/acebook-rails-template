$(document).ready(function(){
    var thisUrl = window.location.pathname;
    $("li").has(`a[href$="${thisUrl}"]`).attr("aria-current", "page");
    $("li").has(`a[href$="${thisUrl}"]`).addClass("breadcrumb-item active");
    $(`li > a[href$="${thisUrl}"]`).contents().unwrap();
});