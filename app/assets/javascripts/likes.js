// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.


// // In this file, have
// - Update Display with number of likes
// - Update display to change icon
//
// // In index.html.erb
// - Add remote: true to the button_to for each like button
// - Add on_success JS call to the buttons
//
//
// // In likes_controller
// - Change create, destroy paths to remove redirects and return JSON objects


function test(input) { console.log(input) }
$(document).ready(function() {
  // $(`.like-btn`).click(function() {
  //   console.log("I've been clicked")
  //   // $( this ).width(900);
  //   console.log(this)
  //
  //   console.log(this.parentNode.parentNode.id)
  //
  //   $(this)
  //     .parent()
  //     .parent()
  //     .find(".like-count")
  //     .html(`<%= @post.likes.count %> <%= (Post.find(9).likes.count) == 1 ? 'Like' : 'Likes'%>`);
  //
  // });

  $(".like-btn").click(function() {
    $(this).on("ajax:complete", function () {
      console.log("I'm in heeeere!")
      $(this)
        .parent()
        .find(".like-count")
        .html("ajax yay");
    });
  })

});
