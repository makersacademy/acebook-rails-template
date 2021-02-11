// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require_tree .

window.onload = function () {
  // When a post is clicked on posts/index
  // The browser accesses the posts individual url
  $(".posts-index-cont").click(function () {
    let id = $(this).attr("id");
    let currentURL = window.location.toString();
    let urlArr = currentURL.split("/");
    let popped = urlArr.pop();
    if (popped === "posts") {
      window.location.href = window.location + "/" + id;
    } else {
      window.location.href = window.location + "posts/" + id;
    }
  });
  // When a like button is clicked, process it
  $(".like-button").click(function () {
    console.log("post");
    let post_id = $(".post-show-like-button").attr("id");
    $.post(
      "/posts/like_post",
      {
        post_id: post_id
      }
    );
  });
}
